angular.module('App')
    .controller('ArticlesShowController', function ($resource, $stateParams, Article) {
        this.article = Article.get({id: $stateParams.id});
    });