define(['./module'], function(module){

    module.directive('jOptColor', [function() {
        return {
            replace: true,
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/j-opt-color.html?ver=' + Journal2Config.version,
            controller: function($scope) {
                $scope.$watch('ngModel', function (val) {
                    if (Object.prototype.toString.call(val) === '[object Array]') {
                        val = {};
                    }
                    $scope.ngModel = val;
                });
            }
        };
    }])

});
