import cProfile
import pstats
import functools


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
        try:
            profile.enable()
            result = func(*args, **kwargs)
            profile.disable()
            return result
        finally:
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
        key = (args, frozenset(kwargs.items()))

        if key not in cache:
            cache[key] = obj(*args, **kwargs)
        return cache[key]

    return memoizer
