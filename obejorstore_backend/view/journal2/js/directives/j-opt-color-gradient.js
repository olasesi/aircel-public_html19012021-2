define(['./module'], function(module){

    module.directive('jOptColorGradient', [function() {
        return {
            replace: true,
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/j-opt-color-gradient.html?ver=' + Journal2Config.version,
            controller: function($scope) {
            }
        };
    }]);

});
