var app = angular.module('App', ['ngRoute', 'ngResource', 'templates'])

    app.config(function($routeProvider) {

        $routeProvider.when("/", {
            controller: 'ArticleCtrl',
            templateUrl: 'backend/article/tmpl/article_show.html',
            controllerAs: 'ctrl'
        })

        .otherwise({redirectTo: '/'});
    })


