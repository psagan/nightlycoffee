angular.module('App')
.config(function($routeProvider) {

    $routeProvider.when("/",
        {
            controller: 'ArticleListController',
            templateUrl: 'backend/article/tmpl/article_show.html',
            controllerAs: 'ctrl'
        }
    )

    .otherwise({redirectTo: '/'});
})
