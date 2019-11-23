angular.module('cybrillaAssignment').config(['$stateProvider', function($stateProvider) {
    $stateProvider
        .state('container.public.items', {
            url: "/items",
            controller: "ItemController",
            controllerAs: '$ctrl',
            templateUrl: "angular-app/item/items.html",
            resolve: {
              items: ['ItemService',function(ItemService){
                return ItemService.query().$promise;
              }],
            }
          })
}]);
