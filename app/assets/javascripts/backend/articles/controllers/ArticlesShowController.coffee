angular.module('App')
    .controller 'ArticlesShowController', ($resource, $state, $stateParams, Article) ->
        that = this
        that.article = Article.get({id: $stateParams.id})
        that.destroy = ->
          that.article.$delete ->
            $state.go('articles')
        that
