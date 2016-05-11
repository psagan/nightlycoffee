angular.module('App')
.controller 'ArticlesNewController', ($scope, $resource, $state, Article) ->
  that = this
  that.article = new Article
  that.create = ->
    # article_form is name of form tag
    if $scope.article_form.$valid
      that.article.$save (response) ->
        $state.go('articles')
      , (response) ->
        # @todo - refactor those methods - make common
        angular.forEach response.data, (v, k) ->
          angular.forEach v, (msg) ->
            $scope.article_form[k].$dirty = true
            $scope.article_form[k].$touched = true
            $scope.article_form[k].$setValidity(msg, false)

  # @todo - refactor those methods - make common
  that.errorMessage = (field) ->
    result = []
    angular.forEach $scope.article_form[field].$error, (v,k) ->
      result.push(k)
    result
  that


