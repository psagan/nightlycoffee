angular.module('App')
.controller('ArticlesListController', function ($resource, Article) {
    this.articles = Article.query();
});