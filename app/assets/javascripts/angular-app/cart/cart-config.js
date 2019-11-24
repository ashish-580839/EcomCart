angular.module('cybrillaAssignment').config(['$stateProvider', function($stateProvider) {
    $stateProvider
        .state('container.public.carts', {
            url: "/cart",
            controller: "CartController",
            controllerAs: '$ctrl',
            templateUrl: "angular-app/cart/carts.html",
            resolve: {
              cart: ['CartService',function(CartService){
              return CartService.get({id:0}).$promise;
              }],
            }
          })
}]);
