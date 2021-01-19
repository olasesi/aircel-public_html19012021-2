define(['./module', 'underscore'], function(module, _){

    module.directive('iconSelect', [function() {
        return {
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/icon-select.html?ver=' + Journal2Config.version,
            controller: ['$scope', 'Rest', '$modal', function($scope, Rest, $modal) {
                $scope.getImageSrc = function(image){
                    return Journal2Config.img_folder + (image ? image : 'data/journal2/no_image.jpg');
                };

                $scope.open = function() {
                    $modal.open({
                        templateUrl: 'view/journal2/tpl/directives/icon-select-popup.html?ver=' + Journal2Config.version,
                        resolve: {
                            ngModel: function() { return $scope.ngModel || {}; }
                        },
                        controller: function($scope, ngModel, $modalInstance) {
                            $scope.ngModel = ngModel || {};
                            Rest.getIcons().then(function(response){
                                $scope.icons = response;
                            }, function(error){
                                console.error(error);
                            });
                            $scope.isSelected = function(icon) {
                                return $scope.ngModel && $scope.ngModel.icon && $scope.ngModel.icon.icon && $scope.ngModel.icon.icon === icon.icon ? 'selected' : '';
                            };
                            $scope.chooseIcon = function(icon, $event) {
                                $('span.selected').removeClass('selected');
                                $($event.target).addClass('selected');
                                $scope.ngModel.icon = icon;
                            };
                            $scope.font_sizes = ['---'].concat(_.map(_.range(5, 200), function(e) { return e + 'px'; }));
                            $scope.close = function(){
                                $modalInstance.close($scope.ngModel);
                            };
                            $scope.reset = function() {
                                $scope.ngModel = {
                                    icon_type: 'none',
                                    options: {
                                        font_size: '---'
                                    }
                                }
                            };
                        }
                    }).result.then(function(model){
                        $scope.ngModel = model;
                    });
                };

                $scope.$watch('ngModel', function (val) {
                    val = val || {};
                    if (Object.prototype.toString.call(val) === '[object Array]') {
                        val = {};
                    }
                    val.options = val.options || {};
                    val.options.font_size = val.options.font_size || '---';
                    $scope.ngModel = val;
                });
            }]
        };
    }]);

});