Contents:
---------

  + 1 IPython_
  + 2 Pandas_
  + 3 Python_
  + 4 ndb_

IPython
-------

* Auto reload modules::

    %load_ext autoreload
    %autoreload 2

Pandas
------

* cut

  + Bin data by portion of data range

* qcut

  + Bin data by portion of data

* Grouper

  + Specify data for groupby()
  + http://pandas.pydata.org/pandas-docs/dev/groupby.html#grouping-with-a-grouper-specification
  + eg. :code:`df.groupby([pd.Grouper(freq='1M', key='Date'), 'Buyer']).sum()`

Python
------

* Package is a directory containing an __init__.py file

  + The __init__.py file can control what children are available when the package is imported

* Partial unpacking::

    a, *b, c = [0, 1, 2, 3, 4]

ndb
---

* Modeling one-to-many relationships

  + Ancestor queries

    - Strongly consistent
    - 1 write/sec

  + KeyProperty

    - High write throughput
    - Eventual consistency

  + StructuredProperty

    - Can store child node directly in parent node
    - Entity has max size of 1 MB which may be problematic (especially with repeated StructuredProperty)
