define(['./module', 'underscore'], function (module, _) {

    module
        .directive('jOptBorder', ['Rest', function () {
            return {
                replace: true,
                require: '?ngModel',
                scope: {
                    ngModel: '='
                },
                restrict: 'E',
                templateUrl: 'view/journal2/tpl/directives/j-opt-border.html?ver=' + Journal2Config.version,
                controller: ['$scope', '$attrs', '$modal', function ($scope, $attrs, $modal) {
                    $scope.ngModel = $scope.ngModel || {};
                    $scope.ngModel.value = $scope.ngModel.value || {};
                    $scope.edit = function () {
                        $modal.open({
                            templateUrl: 'view/journal2/tpl/directives/j-opt-border-editor.html?ver=' + Journal2Config.version,
                            resolve: {
                                ngModel: function () { return $scope.ngModel; },
                                editor: function () { return $attrs.editor; }
                            },
                            controller: function ($scope, $rootScope, $modalInstance, ngModel, editor) {
                                $scope.ngModel = ngModel.value;
                                $scope.editor = ngModel.editor || editor;

                                $scope.title = 'Border Settings';

                                if ($scope.editor === 'hide-style') {
                                    $scope.title = 'Border Radius';
                                }

                                if ($scope.editor === 'hide-radius') {
                                    $scope.title = 'Border Settings';
                                }

                                $scope.save = function () {
                                    $modalInstance.close($scope.ngModel);
                                };

                                $scope.reset = function() {
                                    $scope.ngModel = {
                                        "border_rounded": "px",
                                        "border_type": "solid",
                                        "border_radius_unit": "px"
                                    };
                                };
                            }
                        }).result.then(function(model){
                            $scope.ngModel = $scope.ngModel || {};
                            $scope.ngModel.value = model;
                        });
                    };
                    $scope.$watch('ngModel', function (val) {
                        val = val || {};
                        val.value = val.value || {};
                        if (Object.prototype.toString.call(val.value) === '[object Array]') {
                            val.value = {};
                        }
                        if (val.value.border_rounded === undefined) {
                            val.value.border_rounded = 'px';
                        }
                        $scope.ngModel = val;
                    });
                }]

            };
        }]);

});