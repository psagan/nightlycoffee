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
    }).state('articleEdit', {
        url: '/articles/:id/edit',
        templateUrl: 'backend/article/tmpl/edit.html',
        controller: 'ArticlesEditController',
        controllerAs: 'ctrl'
    }).state('articleNew', {
        url: '/articles/new',
        templateUrl: 'backend/article/tmpl/new.html',
        controller: 'ArticlesNewController',
        controllerAs: 'ctrl'
    })
})

