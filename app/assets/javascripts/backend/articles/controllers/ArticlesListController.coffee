angular.module('App')
    .controller 'ArticlesListController', ($resource, Article) ->
      this.articles = Article.query()
      this
