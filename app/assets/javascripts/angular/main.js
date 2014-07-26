
angular.module('randubeServices', ['ngResource']);

angular.module('randube', ['templates', 'ngRoute', 'randubeServices', 'authentication_redirect'])
.config(['$routeProvider', '$httpProvider', function($routeProvider, $httpProvider) {
	$routeProvider
		.when('/', {
			controller: 'HomeCtrl',
			templateUrl: 'Home.html'
		})
		.when('/login', {
			controller: 'LoginCtrl',
			templateUrl: 'Login.html'
		})
		.otherwise({
			redirectTo: '/'
		});

	// Make CSRF protection work
	authToken = $("meta[name=\"csrf-token\"]").attr("content");
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;

  // Support PATCH method (just in case)
  $httpProvider.defaults.headers.patch['Content-Type'] = 'application/json';
}]);

