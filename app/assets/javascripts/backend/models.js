angular.module('App')
.factory('Article', function($resource) {
    return $resource('/articles/:id.json');
});