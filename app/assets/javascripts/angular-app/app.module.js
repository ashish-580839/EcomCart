angular.module('cybrillaAssignment', [
        'ngResource',
        'ngAnimate',
        'templates', // Angular rails templates module
        'ui.router',
        'angular-loading-bar',
        'ui.bootstrap'
    ]);

angular.module('cybrillaAssignment')
      .run(['$http',function($http){

      }]);

angular.module('cybrillaAssignment').config(["$httpProvider", function($httpProvider){
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }]);

angular.module('cybrillaAssignment')
      .controller('RootController',['$scope',function($scope){

      }]);
