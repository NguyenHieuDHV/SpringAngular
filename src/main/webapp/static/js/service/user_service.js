'use strict';

angular.module('myApp').factory('UserService', [ '$http', '$q', function($http, $q) {
	var REST_SERVICE_URI = "http://localhost:8080/user/";

	var factory = {
		fetchAllUsers : fetchAllUsers,
		createUser : createUser,
		updateUser : updateUser,
		deleteUser : deleteUser
	};
	return factory;

	function fetchAllUsers() {
		var deferred = $q.defer();
		$http.get(REST_SERVICE_URI)
			.then(
				function(response) {
					deferred.resolve(response.data);
				},
				function(errResponse) {
					console.error('Error white fetching users');
					deferred.reject(errResponse);
				}
			);
		return deferred.promise;
	}

	function createUser(user) {
		var deferred = $q.defer();
		$http.post(REST_SERVICE_URI, user)
			.then(
				function(response) {
					deferred.resolve(response.data);
				},
				function(errResponse) {
					console.error('Error white creating user');
					deferred.reject(errResponse);
				}
			);
		return deferred.promise;
	}

	function updateUser(user, id) {
		var deferred = $q.defer();
		$http.put(REST_SERVICE_URI + id, user)
			.then(
				function(response) {
					deferred.resolve(response.data);
				},
				function(errResponse) {
					console.error('Error white updating user');
					deferred.reject(errResponse);
				}
			);
		return deferred.promise;
	}

	function deleteUser(id) {
		var deferred = $q.defer();
		$http.put(REST_SERVICE_URI + id)
			.then(
				function(response) {
					deferred.resolve(response.data);
				},
				function(errResponse) {
					console.error('Error white deleting user');
					deferred.reject(errResponse);
				}
			);
		return deferred.promise;
	}
} ]);