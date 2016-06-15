angular.module('App')
.factory 'Article', ($resource) ->
    $resource('/articles/:id.json', {id: '@id'}, {
        update: {
            method: 'PUT'
        }
    })

.factory 'Tag', ($resource) ->
    $resource('/tags/:id.json', {id: '@id'}, {
        update: {
            method: 'PUT'
        }
    })
