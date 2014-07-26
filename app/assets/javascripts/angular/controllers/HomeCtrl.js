angular.module('randube').controller('HomeCtrl', ['$scope', 'Backend', function($scope, Backend){
	$scope.helloworld = "Hello from HomeCtrl";
	$scope.channels = Backend.get();
}]);

