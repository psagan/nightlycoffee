angular.module('App')
.controller 'TagsNewController', ($scope, $resource, $state, Tag) ->
  that = this
  that.tag = new Tag
  that.create = ->
    # article_form is name of form tag
    if $scope.tag_form.$valid
      that.tag.$save (response) ->
        $state.go('tags')
      , (response) ->
        # @todo - refactor those methods - make common
        angular.forEach response.data, (v, k) ->
          angular.forEach v, (msg) ->
            $scope.tag_form[k].$dirty = true
            $scope.tag_form[k].$touched = true
            $scope.tag_form[k].$setValidity(msg, false)

  # @todo - refactor those methods - make common
  that.errorMessage = (field) ->
    result = []
    angular.forEach $scope.tag_form[field].$error, (v,k) ->
      result.push(k)
    result
  that


