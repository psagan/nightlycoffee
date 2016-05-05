angular.module('App')
.config(function($stateProvider) {

    $stateProvider.state('articles', {
        url: '/articles',
        templateUrl: 'backend/article/tmpl/list.html',
        controller: 'ArticlesListController',
        controllerAs: 'ctrl'
    }).state('articlesShow', {
        url: '/articles/:id/show',
        templateUrl: 'backend/article/tmpl/show.html',
        controller: 'ArticlesShowController',
        controllerAs: 'ctrl'
    })
})
    .run(function($state) {
        $state.go('articles');
    });
