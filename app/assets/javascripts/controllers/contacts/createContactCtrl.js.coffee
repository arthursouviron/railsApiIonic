@CreateContactCtrl = ($scope, $route, $http, userService, contactService) ->

  $scope.saveContact = () ->
    data = {
      first_name: $scope.firstName
      last_name: $scope.lastName
      email: $scope.email
     
    }
    contactService.saveContact(data)