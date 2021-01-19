define(['./module'], function(module){

    module.directive('jOptSelect', ['$compile', function($compile) {
        return {
            replace: true,
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/j-opt-select.html?ver=' + Journal2Config.version,
            controller: function($scope, $element) {
                $scope.ngModel.value = $scope.ngModel.value || {option: null};
                var name = _.uniqueId('switch-');
                var $options = $element.find('div.switch-toggle');

                $options.addClass('switch-' + $scope.ngModel.options.length);

                _.each($scope.ngModel.options, function(opt){
                    var id = _.uniqueId('switch-option-');
                    var checked = $scope.ngModel.value.option == opt ? ' checked="checked"' : '';
                    $options.append('<input id="' + id + '" type="radio" name="' + name + '"' + checked + '/>');
                    $options.append($compile('<label for="' + id + '" onclick="" data-ng-click="setValue(\'' + opt + '\')">' + opt + '</label>')($scope));
                });

                $options.append($('<a/>'));

                $scope.setValue = function(value) {
                    $scope.ngModel.value.option = value;
                };
            }
        };
    }])

});
