@IndexCtrl = ($scope, userService) ->


  $scope.updateAvatar = () ->
    console.log $scope.avatar
    userService.update_avatar
      data: $scope.avatar

  #console.log userService
  # $scope.login = () ->
  #   userService.login
  #     email: 'arthur.souviron@epitech.eu'
  #     password: 'password'
