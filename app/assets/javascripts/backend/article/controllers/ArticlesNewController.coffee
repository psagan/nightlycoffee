angular.module('App')
.controller 'ArticlesNewController', ($resource, $state, Article) ->
  that = this
  that.article = new Article
  that.create = ->
    that.article.$save ->
      $state.go('articles')
  that


