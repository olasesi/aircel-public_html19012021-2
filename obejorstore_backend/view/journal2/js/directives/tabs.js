define(['./module', 'idTabs'], function(module, idTabs){

    module.directive('jTabs', ['$timeout', function($timeout) {
        return {
            restrict: 'A',
            link: function(scope, element, attrs) {
                if (scope.$last === true) {
                    $timeout(function(){
                        $(attrs.jTabs).idTabs();
                    });
                }
            }
        };
    }])

});