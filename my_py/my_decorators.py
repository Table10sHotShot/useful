import cProfile
import os
import pstats
import functools
import pickle


def profile_lines(func=None, out_fp=None, follow=()):

    try:
        from line_profiler import LineProfiler
    except ImportError:
        raise ImportError('Need kernprof installed to do line profiling.')

    if func is None:
        return functools.partial(profile_lines, out_fp=out_fp, follow=follow)

    @functools.wraps(func)
    def lprofiled_func(*args, **kwargs):
        try:
            lprofiler = LineProfiler(func)
            for namespaces_chained in follow:
                if not isinstance(namespaces_chained, str):
                    print('Need str not ', namespaces_chained)
                    continue

                obj = args[0]
                namespaces = namespaces_chained.split('.')

                for attr in namespaces:
                    try:
                        obj = getattr(obj, attr)
                    except AttributeError:
                        print('Could not find attribute {} on object {}'.format(attr, obj))
                        break
                else:
                    lprofiler.add_function(obj)

            lprofiler.enable_by_count()
            result = func(*args, **kwargs)
            lprofiler.disable_by_count()
            return result
        finally:
            if out_fp:
                lprofiler.dump_stats(out_fp)
            lprofiler.print_stats()

    return lprofiled_func


def profile_funcs(func=None, out_fp=None, sort_order=('cumtime',), subcalls=True, builtins=False):

    if func is None:
        return functools.partial(profile_funcs, out_fp=out_fp, sort_order=sort_order, subcalls=subcalls, builtins=builtins)

    @functools.wraps(func)
    def profiled_func(*args, **kwargs):
        profile = cProfile.Profile(subcalls=subcalls, builtins=builtins)
        profile.enable()
        try:
            result = func(*args, **kwargs)
        except KeyboardInterrupt:
            pass
        else:
            return result
        finally:
            profile.disable()
            stats = pstats.Stats(profile)
            if out_fp:
                print('dumping stats')
                stats.dump_stats(out_fp)
            stats.strip_dirs().sort_stats(*sort_order).print_stats()
    return profiled_func


def memoize(obj):
    cache = {}

    @functools.wraps(obj)
    def memoizer(*args, **kwargs):
        key = pickle.dumps(args) + pickle.dumps(kwargs)

        if key not in cache:
            cache[key] = obj(*args, **kwargs)
        return cache[key]

    return memoizer


def limit_recursion(func=None, max_tries=8, exception=Exception):

    # Note: this must be a decorator e.g. g = limit_recursion(f) won't work

    if func is None:
        return functools.partial(limit_recursion, max_tries=max_tries, exception=exception)

    @functools.wraps(func)
    def inner(*args, **kwargs):

        try:
            func.call_count += 1
        except AttributeError:
            func.call_count = 1

        try:
            if func.call_count > max_tries:
                raise exception

            return func(*args, **kwargs)
        finally:
            func.call_count -= 1

    return inner


def pickle_cache_results(func, dpath=''):

    if isinstance(func, str):
        return functools.partial(pickle_cache_results, dpath=func)

    if dpath and not os.path.isdir(dpath):
        os.makedirs(dpath)

    @functools.wraps(func)
    def inner(*args, **kwargs):

        # TODO(jalex): This will only get actual kwargs that are passed in - not defaults

        str_kwargs = ['-'.join((k, v)) for k, v in kwargs.items()]

        fname = '_'.join(list(args) + str_kwargs) + '.pkl'

        fpath = os.path.join(dpath, fname)

        if os.path.isfile(fpath):
            with open(fpath, 'rb') as f:
                return pickle.load(f)
        else:
            result = func(*args, **kwargs)

            with open(fpath, 'wb') as f:
                pickle.dump(result, f)

            return result

    return inner
