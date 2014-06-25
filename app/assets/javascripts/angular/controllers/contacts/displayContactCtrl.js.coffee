@DisplayContactCtrl = ($scope, $route, $routeParams, $http, contactService) ->

  contactService.fetchContact
    contactId: $routeParams.id
    afterFetch: (data) ->
      $scope.contact = data
      $scope.firstName = data.first_name
      $scope.lastName = data.last_name
      $scope.email = data.email

  $scope.updateContact = () ->
    data = {
      first_name: $scope.firstName
      last_name: $scope.lastName
      email: $scope.email
     
    }
    contactService.updateContact(data, $routeParams.id)