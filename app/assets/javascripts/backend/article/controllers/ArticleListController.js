angular.module('App')
.controller('ArticleListController', function ($resource, Article) {
    this.article = Article.get({id: 1});
});