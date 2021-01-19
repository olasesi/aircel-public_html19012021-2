define(['./module'], function(module){

    module.directive('jOptions', [function() {
        return {
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/j-options.html?ver=' + Journal2Config.version,
            controller: function($scope) {
            }
        };
    }]);

});

