<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<title>Insert title here</title>
</head>
<body data-ng-app="myApp" class="ng-cloak">
	<div class="container" data-ng-controller="userController as userCtrl">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">User Registration Form</span>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" data-ng-submit="userCtrl.submit()" name=formUser>
					<input type="hidden" data-ng-model="userCtrl.user.id">
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-label" for="username">Name</label>
							<div class="col-md-7">
								<input class="form-control input-sm" type="text" data-ng-model="userCtrl.user.username" id="username" placeholder="Enter your name" required data-ng-minlength="3">
								<div class="has-error" data-ng-show="formUser.$dirty">
									<span data-ng-show="formUser.username.$error.required">this is required field</span>
									<span data-ng-show="formUser.username.$error.minlength">Minimum length required is 3</span>
									<span data-ng-show="formUser.username.$invalid">This field is invalid </span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-label" for="address">Address</label>
							<div class="col-md-7">
								<input type="text" class="form-control input-sm" data-ng-model="userCtrl.user.address" id="address" placeholder="Enter your Address" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-label" for="email">Email</label>
							<div class="col-md-7">
								<input type="email" data-ng-model="userCtrl.user.email" id="email" class="email form-control input-sm" placeholder="Enter your Email" required />
								<div class="has-error" data-ng-show="formUser.$dirty">
									<span data-ng-show="formUser.email.$error.required">This is a required field</span>
									<span data-ng-show="formUser.email.$invalid">This field is invalid </span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="{{!userCtrl.user.id ? 'Add User' : 'Update'}}" class="btn btn-primary btn-sm" data-ng-disabled="formUser.$invalid">
							<button type="button" data-ng-click="userCtrl.reset()"class="btn btn-warning btn-sm" data-ng-disabled="formUser.$pristine">Reset Form</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">List of Users</span>
			</div>
			<div class="panel-body">
				<table class="table table-bordered table-hover" style="width: 100%;">
					<thead>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>ADRRESS</th>
							<th>EMAIL</th>
							<th width="20%;"></th>
						</tr>
					</thead>
					<tbody>
						<tr data-ng-repeat="user in userCtrl.users">
							<td><span data-ng-bind="user.id"></span></td>
							<td><span data-ng-bind="user.username"></span></td>
							<td><span data-ng-bind="user.address"></span></td>
							<td><span data-ng-bind="user.email"></span></td>
							<td>
								<button type="button" data-ng-click="userCtrl.edit(user.id)" class="btn btn-success">Edit</button>
								<button type="button" data-ng-click="userCtrl.delete(user.id)" class="btn btn-danger">Delete</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/user_service.js' />"></script>
	<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
</body>
</html>