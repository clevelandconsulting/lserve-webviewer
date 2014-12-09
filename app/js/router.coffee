angular.module('app').config ['$routeProvider', (routeProvider) ->
 #locationProvider.html5mode(true)
 
 routeProvider
 .when('/', {controller: 'homeCtrl', controllerAs:'home', templateUrl: 'home.html'})
 .when('/register', {controller:'registerCtrl', controllerAs: 'register', templateUrl:'register.html'})
 .otherwise {redirectTo:'/'}
 
]
