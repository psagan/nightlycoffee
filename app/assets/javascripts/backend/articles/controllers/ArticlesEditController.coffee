angular.module('App')
  .controller 'ArticlesEditController', ($http, $resource, $stateParams, Article, Tag) ->
    that = this
    that.article = Article.get({id: $stateParams.id})

    that.loadTags = (query) ->
      $http.get('/tags.json')
    
    that.update = ->
      that.article.$update ->
    that


