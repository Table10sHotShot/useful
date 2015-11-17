import cProfile as _cProfile
import functools as _functools
from line_profiler import LineProfiler

# TODO: update so can print_stats to file
def do_lprofile(func=None, out_fp=None, follow=()):

    if func is None:
        return _functools.partial(do_lprofile, out_fp=out_fp, follow=follow)

    @_functools.wraps(func)
    def lprofiled_func(*args, **kwargs):
        try:
            lprofiler = LineProfiler(func)
            for fn in follow:
                legit = True
                if isinstance(fn, str):
                    obj = args[0]
                    for attr in fn.split('.'):
                        fn = getattr(obj, attr, None)
                        if fn is None:
                            print('Could not find attribute {} on object {}'.format(attr, obj))
                            legit = False
                            break
                        obj = fn
                if legit:
                    lprofiler.add_function(fn)

            lprofiler.enable_by_count()
            result = func(*args, **kwargs)
            lprofiler.disable_by_count()
            return result
        finally:
            if isinstance(out_fp, str):
                with open(out_fp, 'w') as f:
                    lprofiler.print_stats(f)
            else:
                lprofiler.print_stats(out_fp)

    return lprofiled_func

def do_cprofile(func):
    @_functools.wraps(func)
    def profiled_func(*args, **kwargs):
        profile = _cProfile.Profile()
        try:
            profile.enable()
            result = func(*args, **kwargs)
            profile.disable()
            return result
        finally:
            profile.print_stats(sort='cumtime')
    return profiled_func

def do_memoize(obj):
    cache = obj.cache = {}

    @_functools.wraps(obj)
    def memoizer(*args, **kwargs):
        key = str(args) + str(kwargs)

        if key not in cache:
            cache[key] = obj(*args, **kwargs)
        return cache[key]

    return memoizer
