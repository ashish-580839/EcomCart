angular.module('cybrillaAssignment').factory ('LineItemService', ['$resource', function($resource) {
  return $resource('/line_items/:id/:action',
    {id: '@id'}, {
    query: {isArray: false},
    update: { method: "PUT"},
    updateQuantity: { method: "PUT", params: {action: "update_quantity" } }
  });

}]);
