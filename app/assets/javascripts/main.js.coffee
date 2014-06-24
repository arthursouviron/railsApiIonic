# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./controllers/main
#= require_tree ./controllers/contacts
#= require_tree ./services/main
#= require_tree ./services/contacts

window.App = angular.module('App', ['ngRoute'])

####################
# TOKEN AJAX REQUEST
# ##################


window.App.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]


#############
#ROUTES
#############
window.App.config ['$routeProvider', ($routeProvider) ->
 

  # Contacts
  $routeProvider.when('/contacts/new', { templateUrl: '../assets/templates/contact/createContact.html', controller: 'CreateContactCtrl'})
  $routeProvider.when('/contacts/:id', { templateUrl: '../assets/templates/contact/displayContact.html', controller: 'DisplayContactCtrl'})
  $routeProvider.when('/contacts', { templateUrl: '../assets/templates/contact/mainContacts.html', controller: 'ContactCtrl' })

  #Default
  $routeProvider.otherwise({ templateUrl: '../assets/templates/mainIndex.html', controller: 'IndexCtrl'})

]
