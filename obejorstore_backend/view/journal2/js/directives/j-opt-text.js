define(['./module'], function(module){

    module.directive('jOptText', [function() {
        return {
            replace: true,
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/j-opt-text.html?ver=' + Journal2Config.version,
            controller: function($scope, $attrs) {
                $scope.ngModel = $scope.ngModel || {};
                $scope.ngModel.value = $scope.ngModel.value || '';
                $scope.reset = function() {
                    $scope.ngModel.value = $scope.ngModel.default;
                };
                $scope.placeholder = $attrs.placeholder;
            }
        };
    }]);

});
