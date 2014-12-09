angular.module('app').controller 'homeCtrl', ['$scope', '$routeParams', '$location', '$http', 'licensing',
 class homeCtrl
  constructor: (@scope, @routeParams, @location, @http, @licensing)->
   license = @routeParams.license
   if !license? || license == ''
    @location.path('/register')
   else
    success = (data) => 
     
     if data.data.active == true && data.data.suspended == false
      @scope.message = "Welcome!"
     else
      if data.data.suspended
       @scope.message = "Your account has been suspended."
      else
       @scope.message = "Your account is inactive."
    error = (error) => 
     @scope.message = "Error: " + error.status + error.data
     @location.path('/register')
     
    @http.get(@licensing.url + 'license/fetch/'+license).then success, error
    #@scope.message = 'Welcome!'
]