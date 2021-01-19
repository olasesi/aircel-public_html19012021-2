define(['./module', 'underscore'], function (module, _) {

    module.directive('jOptSlider', ['$timeout', function ($timeout) {
        return {
            replace: true,
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/j-opt-slider.html?ver=' + Journal2Config.version,
            controller: function ($scope) {
                $scope.ngModel = $scope.ngModel || {};
                $scope.ngModel.value = $scope.ngModel.value || 0;
            },
            link: function ($scope, $element, $attrs, $ngModel) {
                var NewValue = function ($scope, value) {
                    var newValue = value;
                    /* check if current value is valid */
                    if ($scope.ngModel.values) {
                        var values = $scope.ngModel.values.split(',');
                        var min = _.min(values);
                        var max = _.max(values);
                        if (value < min) {
                            newValue = parseInt(min, 10);
                        }
                        if (value > max) {
                            newValue = parseInt(max, 10);
                        }
                    }
                    if ($scope.ngModel.range) {
                        var range = $scope.ngModel.range.split(',');
                        var min = parseInt(range[0], 10);
                        var max = parseInt(range[1], 10);
                        if (value < min) {
                            newValue = parseInt(min, 10);
                        }
                        if (value > max) {
                            newValue = parseInt(max, 10);
                        }
                    }
                    return newValue;
                };

                $timeout(function () {
                    $scope.ngModel = $scope.ngModel || {};
                    /* init plugin */
                    if ($element.attr('data-values')) {
                        $scope.ngModel.values = $element.attr('data-values');
                    }
                    if ($element.attr('data-range')) {
                        $scope.ngModel.range = $element.attr('data-range');
                    }
                    if ($element.attr('data-step')) {
                        $scope.ngModel.step = $element.attr('data-step');
                    }
                    var $slider = $($element.find('input')).simpleSlider({
                        values: $scope.ngModel.values,
                        range: $scope.ngModel.range,
                        step: $scope.ngModel.step
                    });
                    /* set value */
                    $scope.$watch('ngModel.value', function (value) {
                        $scope.ngModel = $scope.ngModel || {};
                        var newValue = NewValue($scope, value);
                        $scope.ngModel.value = newValue;
                        $slider.simpleSlider('setValue', newValue, true);
                    });
                }, 1);
            }
        };
    }]);

});
