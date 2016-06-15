angular.module('App')
.config(($stateProvider) ->
    $stateProvider.state('articles', {
        url: '/articles',
        templateUrl: 'backend/articles/tmpl/list.html',
        controller: 'ArticlesListController',
        controllerAs: 'ctrl'
    }).state('articlesShow', {
        url: '/articles/:id/show',
        templateUrl: 'backend/articles/tmpl/show.html',
        controller: 'ArticlesShowController',
        controllerAs: 'ctrl'
    }).state('articlesEdit', {
        url: '/articles/:id/edit',
        templateUrl: 'backend/articles/tmpl/edit.html',
        controller: 'ArticlesEditController',
        controllerAs: 'ctrl'
    }).state('articlesNew', {
        url: '/articles/new',
        templateUrl: 'backend/articles/tmpl/new.html',
        controller: 'ArticlesNewController',
        controllerAs: 'ctrl'
    }).state('tags', {
        url: '/tags',
        templateUrl: 'backend/tags/tmpl/list.html',
        controller: 'TagsListController',
        controllerAs: 'ctrl'
    }).state('tagsShow', {
        url: '/tags/:id/show',
        templateUrl: 'backend/tags/tmpl/show.html',
        controller: 'TagsShowController',
        controllerAs: 'ctrl'
    }).state('tagsEdit', {
        url: '/tags/:id/edit',
        templateUrl: 'backend/tags/tmpl/edit.html',
        controller: 'TagsEditController',
        controllerAs: 'ctrl'
    }).state('tagsNew', {
        url: '/tags/new',
        templateUrl: 'backend/tags/tmpl/new.html',
        controller: 'TagsNewController',
        controllerAs: 'ctrl'
    })
)

