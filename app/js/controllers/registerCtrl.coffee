angular.module('app').controller 'registerCtrl', ['$scope', '$http', 'licensing', '$routeParams',
 class registerCtrl
  constructor: (@scope, @http, @licensing, @route)->
   @registered = false
   #@scope.message = { level: 'alert-info', msg: @route.callback }
  
  
  
  submit: () ->
   success = (data) => 
    if data.data.license?
	    msg = "<b>Congratulations!</b>, You've successfully registered your product.  Here is your license key: <b>" + data.data.license + "</b>. Thank you for using our product!"
	    @scope.message = {msg: msg, level: 'alert-success'};
	    @registered = true
	    if @route.callback?
	     uri = @route.callback + data.data.license
	     window.location = uri
	   else
	    @scope.message = {msg: data.data.error.message, level: 'alert-danger'};
    
   error = (error) => 
    @scope.message = {msg: error.data.error.message, level: 'alert-danger'};
   
   data = {'email': @email, 'company': @company}
   @http.post(@licensing.url + 'license/register', data).then success, error
   
   
]