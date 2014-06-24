@IndexCtrl = ($scope, userService) ->
  console.log userService
  $scope.login = () ->
    userService.login
      email: 'arthur.souviron@epitech.eu'
      password: 'password'
