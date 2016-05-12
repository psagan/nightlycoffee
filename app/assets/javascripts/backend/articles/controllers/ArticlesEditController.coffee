angular.module('App')
  .controller 'ArticlesEditController', ($resource, $stateParams, Article) ->
    that = this
    that.article = Article.get({id: $stateParams.id})
    that.update = ->
      that.article.$update ->
    that


