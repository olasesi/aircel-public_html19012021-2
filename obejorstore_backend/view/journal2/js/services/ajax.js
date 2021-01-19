define(['underscore', 'underscore.string', './module'], function(_, _S, module){

    module
        .factory('Url', [function(){
            return {
                generateLink: function(url) {
                    var args = Array.prototype.slice.call(arguments).slice(1);
                    return args.length ? url + '&' + args.join('&') : url;
                }
            };
        }])
        .factory('Ajax', ['$http', '$q', function($http, $q){
            return {
                get: function(url, data) {
                    var deferred = $q.defer();
                    $http
                        .get(url, data)
                        .success(function(response){
                            if (_S.endsWith(url, '.json')) {
                                deferred.resolve(response);
                            }
                            if (typeof(response) !== 'object') {
                                deferred.reject('Cannot access ' + url);
                            }
                            if(response.status === 'success') {
                                deferred.resolve(response.response);
                            } else {
                                deferred.reject(response.error);
                            }
                        }).error(function(response){
                            deferred.reject(response);
                        });
                    return deferred.promise;
                },
                post: function(url, data) {
                    var deferred = $q.defer();
                    $http
                        .post(url, angular.copy(data))
                        .success(function(response){
                            if (typeof(response) !== 'object') {
                                deferred.reject('Cannot access ' + url);
                            }
                            if(response.status === 'success') {
                                deferred.resolve(response.response);
                            } else {
                                deferred.reject(response.error);
                            }
                        }).error(function(response){
                            deferred.reject(response);
                        });
                    return deferred.promise;
                }
            };
        }]);

});


