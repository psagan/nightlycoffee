angular.module('App')
    .controller('ArticleCtrl', function ($resource) {

        var Article = $resource('/articles/:articleId.json')
        this.article = Article.get({articleId: 1})
    });