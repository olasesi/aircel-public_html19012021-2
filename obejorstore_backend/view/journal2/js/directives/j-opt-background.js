define(['./module', 'underscore'], function (module, _) {

    module
        .directive('jOptBackground', ['Rest', function () {
            return {
                replace: true,
                require: '?ngModel',
                scope: {
                    ngModel: '='
                },
                restrict: 'E',
                templateUrl: 'view/journal2/tpl/directives/j-opt-background.html?ver=' + Journal2Config.version,
                controller: ['$scope', '$attrs', '$modal', function ($scope, $attrs, $modal) {
                    $scope.ngModel = $scope.ngModel || {};
                    $scope.ngModel.value = $scope.ngModel.value || {};
                    $scope.edit = function () {
                        $modal.open({
                            templateUrl: 'view/journal2/tpl/directives/j-opt-background-editor.html?ver=' + Journal2Config.version,
                            resolve: {
                                ngModel: function () { return $scope.ngModel; },
                                bgcolor: function () { return $attrs.bgcolor; }
                            },
                            controller: function ($scope, $rootScope, $modalInstance, ngModel, bgcolor) {
                                $scope.ngModel = ngModel.value || {};
                                $scope.bgcolor = bgcolor;
                                $scope.save = function () {
                                    $modalInstance.close($scope.ngModel);
                                };
                                $scope.reset = function() {
                                    $scope.ngModel = {
                                        "bgimage_attach": "scroll",
                                        "use_gradient": "0",
                                        "bgimage_size": "auto",
                                        "bgimage_position": "center top",
                                        "bgimage_repeat": "repeat"
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
                        if (!val.value.bgimage_attach) {
                            val.value.bgimage_attach = 'scroll';
                        }
                        if (typeof val.value.use_gradient === 'undefined') {
                            val.value.use_gradient = 0;
                        }
                        if (typeof val.value.bgimage_size === 'undefined') {
                            val.value.bgimage_size = 'auto';
                        }
                        if (typeof val.value.bgimage_position === 'undefined' || val.value.bgimage_position === 'center') {
                            val.value.bgimage_position = 'center top';
                        }
                        $scope.ngModel = val;
                    });
                }]
            };
        }]);

});