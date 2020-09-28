'use strict';

angular.module("myApp").controller('userController',['$scope', 'UserService', function($scope, UserService) {
		var self = this;
		self.user = {
			id : null,
			username : '',
			address : '',
			email : ''
		};

		self.users = [];

		self.submit = submit;
		self.edit = edit;
		self.remove = remove;
		self.reset = reset;					

		fetchAllUsers();

		function fetchAllUsers() {
				UserService.fetchAllUsers()
					.then(
						function(d) {
							self.users = d;
						},
						function(errResponse) {
							console.error('Error while fetching Users');
						}
					);
		}

		function createUser(user) {
				UserService.createUser(user)
					.then(
						fetchAllUsers,
						function(errResponse) {
							console.error('Error whilte creating User');
						}
					);
	    }
							
		function updateUser(user, id) {
				UserService.updateUser(user, id)
					.then(
						fetchAllUsers, 
						function(errResponse){
							console.error('Error white update user');
						}
					);
		}
							
		function deleteUser(id){
				UserService.deleteUser(id)
					.then(
						 fetchAllUsers,
						 function(errResponse){
						      console.error('Error while deleting User');
						 }
					);
		}
							
							
		function submit() {
			if(self.user.id === null) {
				console.log('saveing new user', self.user);
					createUser(self.user);
			}else {
				updateUser(self.user, self.user.id);
				console.log('user update with id', self.user.id);
			}
			reset();
		}
		
		function edit(id) {
			for(var i = 0; i < self.users.length; i++) {
				if(self.users[i].id === id) {
					self.user = angular.copy(self.users[i]);
				}
			}
		}
		
		function remove(id) {
			deleteUser(id);
		}
		
		function reset() {
			 self.user={id:null,username:'',address:'',email:''};
		     $scope.formUser.$setPristine();
		}
							
} ]);
