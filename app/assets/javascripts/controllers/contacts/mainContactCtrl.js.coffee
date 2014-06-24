@ContactCtrl = ($scope, $location, $http, userService, contactService) ->
  $scope.data = 
    contacts: [{email: 'Loading contacts...'}]
  
  

  contactService.fetchContacts
    afterFetch: (data) ->
      $scope.data.contacts = data

  $scope.viewContact = (contactId) ->
    $location.url('/contacts/' + contactId)