angular.module('App')
.factory('Article', function($resource) {
    return $resource('/articles/:id.json', {id: '@id'}, {
        update: {
            method: 'PUT'
        }
    });
})
.factory('Tag', function($resource) {
    return $resource('/tags/:id.json', {id: '@id'}, {
        update: {
            method: 'PUT'
        }
    });
});