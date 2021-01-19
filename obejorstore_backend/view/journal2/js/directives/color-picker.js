
define(['./module'], function (module) {

    module.directive('colorPicker', function () {
        return {
            restrict: 'A',
            require: 'ngModel',
            link: function ($scope, $element, $attrs, $ngModel) {
                $($element).spectrum({
                    preferredFormat: "rgb",
                    allowEmpty: true,
                    showAlpha: true,
                    showInput: true,
                    showButtons: false,
                    showPalette: true,
                    palette: [
                        typeof Journal2Colors === 'undefined' ? [] : Journal2Colors
                    ]
                });
                $scope.$watch(function () {
                    return $ngModel.$modelValue;
                }, function (val) {
                    $($element).spectrum('set', val);
                });
            }
        };
    });

});
