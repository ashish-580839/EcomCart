angular.module('cybrillaAssignment').factory ('ItemService', ['$resource', function($resource) {
  return $resource('/items/:id/:action',
    {id: '@id'}, {
    query: {isArray: false},
    update: { method: "PUT"}
  });

}]);
