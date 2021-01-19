define(['./module'], function(module){

    module.directive('switch', function() {
        return {
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            replace: true,
            transclude: true,
            templateUrl: 'view/journal2/tpl/directives/switch.html?ver=' + Journal2Config.version,
            link: function($scope, element, attrs, ctrl) {
                var $element = $(element);
                var $input = $element.find('input');
                var name = _.uniqueId('switch-group-');

                $input.attr('name', name);
                $element.addClass('switch-' + $input.length);
                $element.attr('data-name', name);

                $scope.$on('change-' + name, function(e, value) {
                    $scope.ngModel = value;
                });

                $scope.$watch('ngModel', function (value) {
                    $element.find('input').each(function() {
                        this.checked = false;
                    });
                    try {
                        $element.find('input[data-key="' + value + '"]')[0].checked = true;
                    } catch (e) { }
                });
            }
        };
    })
        .directive('switchOption', function($compile) {
            return {
                restrict: 'E',
                link: function (scope, element) {
                    var $element = $(element);
                    var $parent = $element.parent();
                    var key = $element.attr('key');
                    var value = $element.html();
                    var id = _.uniqueId('switch-option-');
                    scope.parent = $parent;

                    var $newElement = $compile('<input id="' + id + '" type="radio" data-key="' + key + '" /><label for="' + id + '" data-ng-click="setValue(\'' + key + '\', this)" onclick="">' + value + '</label>')(scope);

                    $element.remove();

                    $parent.append($newElement);

                    $parent.find('a').remove();
                    $parent.append($('<a/>'));

                    scope.setValue = function(value, s) {
                        var name = s.parent.attr('data-name');
                        scope.$parent.$broadcast('change-' + name, value);
                        $parent.addClass('t-candy');
                    };
                }
            };
        });

});