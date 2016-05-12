angular.module('App')
  .controller 'TagsEditController', ($resource, $stateParams, Tag) ->
    that = this
    that.tag = Tag.get({id: $stateParams.id})
    that.update = ->
      that.tag.$update ->
    that


