define(['./module'], function(module){

    module.directive('jOptIcon', [function() {
        return {
            replace: true,
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/j-opt-icon.html?ver=' + Journal2Config.version,
            controller: function($scope) {
            }
        };
    }]);

});
