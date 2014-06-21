angular.module('randube', ['templates', 'ngRoute'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider
		.when('/', {
			controller: 'HomeCtrl',
			templateUrl: 'Home.html'
		})
		.otherwise({
			redirectTo: '/'
		});
}])