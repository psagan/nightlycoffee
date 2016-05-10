angular.module('App')
.controller 'ArticlesNewController', ($scope, $resource, $state, Article) ->
  that = this
  that.article = new Article
  that.create = ->
    # article_form is name of form tag
    if $scope.article_form.$valid
      that.article.$save ->
        $state.go('articles')
  that


