window.App.service('userService', ($http) ->


  login : (options) ->
    console.log "LOGIN =>", options

    $http(
      method: 'POST'
      url: 'users/sign_in'
      data:
        user:
          email: 'arthur.souviron@leikir-studio.com2'
          password: 'password'
        
    ).then( (res) ->
      console.log "success"
    , (res) ->
      alert('error update')
    )


      # url: "/users/sign_in"
      #   type: "POST"
      #   format: 'json'
      #   contentType: 'application/json'
      #   dataType: 'json'
      #   data: 


  # fetchContacts : (options) ->
  #   if window.current_user
  #     $http.get('./users/' + window.current_user.id + '/contacts.json').success( (data) ->
  #       console.log "success", options
  #       options.afterFetch(data)
  #     ).error( ->
  #       console.log('error')
  #     )

  # fetchContact : (options) ->
  #   if window.current_user
  #     $http.get('./users/' + window.current_user.id + '/contacts/' + options.contactId + '.json').success( (data) ->
  #       console.log options
  #       options.afterFetch(data)
  #     ).error( ->
  #       console.log "error"
  #     )
)