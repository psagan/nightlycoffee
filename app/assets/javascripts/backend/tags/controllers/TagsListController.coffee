angular.module('App')
    .controller 'TagsListController', ($resource, Tag) ->
      this.tags = Tag.query();
      this
