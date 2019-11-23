angular.module('cybrillaAssignment').controller('ItemController', ['$scope','items','$state','$uibModal', function ($scope,items,$state,$uibModal) {

  var $ctrl = this;

  $ctrl.animationsEnabled = true;

  $ctrl.items = items.items;





}]);
