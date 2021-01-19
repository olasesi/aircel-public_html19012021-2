define(['./module'], function (module) {
    module
        .directive('skinManager', function ($location, $routeParams, $timeout, SkinManager, Rest, Spinner) {
            return {
                replace: true,
                restrict: 'E',
                templateUrl: 'view/journal2/tpl/directives/skin-manager.html?ver=' + Journal2Config.version,
                controller: ['$scope', '$modal', function ($scope, $modal) {
                    $scope.openManager = function () {
                        $modal.open({
                            templateUrl: 'view/journal2/tpl/directives/skin-manager-popup.html?ver=' + Journal2Config.version,
                            controller: function ($scope, $modalInstance) {
                                $scope.stores = _.clone(Journal2Config.stores);

                                var promises = {
                                    skins: SkinManager.getSkins()
                                };

                                _.each($scope.stores, function (store) {
                                    promises[store.store_id] = Rest.getSetting('active_skin', store.store_id);
                                });

                                Rest.all(promises, function (response) {
                                    $scope.skins = response.skins;
                                    _.each($scope.stores, function (store) {
                                        store.skin_id = response[store.store_id];
                                    });
                                }, function (error) {
                                    alert(error);
                                });

                                $scope.save = function ($event) {
                                    var $src = $($event.target || $event.srcElement);
                                    Spinner.show($src);
                                    var promises = {};
                                    _.each($scope.stores, function (store) {
                                        promises[store.store_id] = Rest.setSetting('active_skin', store.store_id, store.skin_id);
                                    });
                                    Rest.all(promises, function (response) {
                                        $timeout(function () {
                                            $modalInstance.dismiss('cancel');
                                        }, 200);
                                        Spinner.hide($src);
                                    }, function (error) {
                                        $modalInstance.dismiss('cancel');
                                        Spinner.hide($src);
                                        alert(error);
                                    });
                                };

                                $scope.cancel = function () {
                                    $modalInstance.dismiss('cancel');
                                };
                            }
                        });
                    };
                }],
                link: function ($scope, $element) {
                    $scope.skins = [];

                    SkinManager.getSkins().then(function (skins) {
                        $scope.skins = skins;
                    }, function (error) {
                        alert(error);
                    });

                    $scope.stores = _.clone(Journal2Config.stores);

                    $scope.skin_id = $routeParams.skin_id;
                    $scope.skinChange = function () {
                        SkinManager.setActiveSkin($scope.skin_id);
                        $location.path($element.attr('data-url') + '/' + $scope.skin_id);
                    };
                }
            };
        });
});
