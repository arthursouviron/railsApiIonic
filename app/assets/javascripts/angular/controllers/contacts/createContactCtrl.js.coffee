@CreateContactCtrl = ($scope, $route, $http, contactService) ->

  $scope.saveContact = () ->
    data = {
      first_name: $scope.firstName
      last_name: $scope.lastName
      email: $scope.email
      avatar: $scope.avatar
     
    }
    contactService.saveContact(data)