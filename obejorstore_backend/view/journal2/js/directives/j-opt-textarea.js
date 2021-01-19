define(['./module'], function(module){

    module.directive('jOptTextarea', [function() {
        return {
            replace: true,
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/j-opt-textarea.html?ver=' + Journal2Config.version,
            link: function ($scope) {
                $scope.$watch('ngModel', function (val) {
                    if (typeof val === 'string') {
                        $scope.ngModel = {};
                        $scope.ngModel.value = {};
                        $scope.ngModel.value.text = val;
                    } else {
                        $scope.ngModel = val;
                    }
                });
            }
        };
    }]);

});
