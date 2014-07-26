angular.module('randubeServices').factory('Backend', ['$resource',
 function($resource){
	return $resource('api/channels', {}, {
      // query: {method:'GET', params:{phoneId:'phones'}, isArray:true}
    });
}])