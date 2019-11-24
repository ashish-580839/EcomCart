angular.module('cybrillaAssignment').controller('ItemController', ['$scope','items','$state','$uibModal', 'LineItemService', function ($scope,items,$state,$uibModal,LineItemService) {

  var $ctrl = this;

  $ctrl.animationsEnabled = true;

  $ctrl.items = items.items;


  $scope.addItemToCart = function(item){

     LineItemService.save({line_item: {item_id: item.id} }).$promise.then(function(resp) {
           console.log(resp);
           alert("Item: "+item.name+" added to cart successfully.");
           // handle success response
         })
         .catch(function(resp) {
           alert( resp.data.errors);
           // handle error response
         });
  };


}]);
