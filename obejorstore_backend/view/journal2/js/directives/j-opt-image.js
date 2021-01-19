define(['./module'], function(module){

    module.directive('jOptImage', [function() {
        return {
            replace: true,
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/j-opt-image.html?ver=' + Journal2Config.version,
            controller: function($scope) {
            }
        };
    }]);

});
