AngularJS
=========

* :code:`$scope`

  + Scope that is attached to the D
  + Used to store data (incl. functions)

* :code:`$apply`

  1. Root scope created (some child scopes created)
  2. Directives register watchers on scopes
  3. Model mutates (wrapped by :code:`$apply` if in angular)
  4. :code:`$digest` called at root scope

     A. :code:`$digest` propagates down scopes recursively
     B. $watched expressions checked - if change, $watch function called

  5. Child scopes destroy themselves using :code:`scope.$destroy` API
