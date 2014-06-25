window.App.service('contactService', ($http, $location) ->

  fetchContacts : (options) ->
    if window.current_user
      $http.get('./users/' + window.current_user.id + '/contacts.json').success( (data) ->
        console.log "success", options
        options.afterFetch(data)
      ).error( ->
        console.log('error')
      )

  fetchContact : (options) ->
    if window.current_user
      $http.get('./users/' + window.current_user.id + '/contacts/' + options.contactId + '.json').success( (data) ->
        console.log options
        options.afterFetch(data)
      ).error( ->
        console.log "error"
      )

  updateContact : (data, id) ->
    $http(
      method: 'PUT'
      url: './users/' + window.current_user.id + '/contacts/' + id
      data: data
    ).then( (res) ->
      $location.path('/contacts')
    , (res) ->
      alert('error update')
    )

  saveContact : (data) ->
    $http(
      method: 'POST'
      url: './users/' + window.current_user.id + '/contacts'
      data: data
    ).then( (res) ->
      $location.path('/contacts')
    , (res) ->
      alert('error save')
    )
)