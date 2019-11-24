angular.module('cybrillaAssignment').controller('CartController', ['$scope','cart','$state','LineItemService','$uibModal', function ($scope,cart,$state,LineItemService,$uibModal) {

  var $ctrl = this;

  $ctrl.animationsEnabled = true;

  $ctrl.cart = cart.cart;

  $scope.updateItemQuantity = function(line_item, quantity){

    LineItemService.updateQuantity({id: line_item.id, quantity: quantity} ).$promise.then(function(resp) {
        console.log(resp);
        // handle success response
        $state.reload();
      })
      .catch(function(resp) {
        alert(resp.data.errors);
        // handle error response
      });
  }

  $scope.removeItemFromCart = function(line_item){
    if( confirm("Are you sure you want to delete this item?") ){
        LineItemService.delete({id: line_item.id}).$promise.then(function(resp) {
            console.log(resp);
            // handle success response
            $state.reload();
          })
          .catch(function(resp) {
            alert(resp.data.errors);
            // handle error response
          });
    }
  }


}]);
