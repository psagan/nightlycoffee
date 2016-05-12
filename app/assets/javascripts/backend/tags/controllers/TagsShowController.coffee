angular.module('App')
    .controller 'TagsShowController', ($resource, $state, $stateParams, Tag) ->
        that = this
        that.tag = Tag.get({id: $stateParams.id})
        that.destroy = ->
          that.tag.$delete ->
            $state.go('tags')
        that
