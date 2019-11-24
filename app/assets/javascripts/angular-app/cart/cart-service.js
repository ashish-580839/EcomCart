angular.module('cybrillaAssignment').factory ('CartService', ['$resource', function($resource) {
  return $resource('/carts/:id/:action',
    {id: '@id'}, {
    query: {isArray: false},
    update: { method: "PUT"}
  });

}]);
