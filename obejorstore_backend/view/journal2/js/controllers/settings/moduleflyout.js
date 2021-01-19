define(['./../module', 'underscore'], function (module, _) {

    module.controller('ModuleFlyoutSettingsController', function ($scope, $routeParams, $location, localStorageService, Rest, Spinner, SkinManager) {
        $scope.skin_id = $routeParams.skin_id;
        $scope.category = 'moduleflyout';
        $scope.settings = { };

        if (!$scope.skin_id) {
            $location.path('settings/' + $scope.category + '/' + SkinManager.getActiveSkin());
        } else {
            Rest.loadSettings($scope.category, $scope.skin_id).then(function (settings) {
                if (!_.isArray(settings)) {
                    $scope.settings = settings;
                }
                Spinner.hide();
            }, function (error) {
                alert(error);
                Spinner.hide();
            });
        }

        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            var promises = {
                settings: Rest.saveSettings($scope.settings, $scope.category, $scope.skin_id)
            };

//            if (Journal2Config.stores.length <= 1) {
//                promises.config = Rest.setSetting('active_skin', 0, $scope.skin_id);
//            }
            Rest.all(promises, function (response) {
                Spinner.hide($src);
                localStorageService.set('setting_' + $scope.category + '_accordion', $scope.accordion);
            }, function (error) {
                alert(error);
                Spinner.hide($src);
            });
        };

        $scope.saveAs = function ($event) {
            var skinName = prompt('Enter skin\'s name:');
            if (skinName !== null) {
                var $src = $($event.target || $event.srcElement);
                Spinner.show($src);
                Rest.saveSettingsAs(skinName, $scope.settings, $scope.category, $scope.skin_id).then(function (response) {
                    Spinner.hide($src);
                    $location.path('settings/' + $scope.category + '/' + response);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            }
        };

        $scope.saveDefault = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.saveSettings($scope.settings, $scope.category, $scope.skin_id).then(function (response) {
                Rest.export().then(function (response) {
                    Spinner.hide($src);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            }, function (error) {
                alert(error);
                Spinner.hide($src);
            });

        };

        $scope.reset = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.loadDefaultSettings($scope.category, $scope.skin_id).then(function (settings) {
                if (!_.isArray(settings)) {
                    $scope.settings = settings;
                } else {
                    $scope.settings = { };
                }
                Spinner.hide();
            }, function (error) {
                alert(error);
                Spinner.hide();
            });
        };

        $scope.delete = function ($event) {
            if (!confirm('Are you sure?')) {
                return;
            }
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.deleteSkin($scope.skin_id).then(function (settings) {
                Journal2Config.active_skin = 1;
                $location.path('settings/' + $scope.category + '/1');
                Spinner.hide();
            }, function (error) {
                alert(error);
                Spinner.hide();
            });
        };

        /* expand / collapse */
        $scope.accordion = {
            accordions: { },
            close_others: false
        };

        $scope.accordion = localStorageService.get('setting_' + $scope.category + '_accordion') || $scope.accordion;

        $scope.toggleAccordion = function (value) {
            var $accordions = $('#main-accordion > div > .accordion-group');
            for (var i=0; i<$accordions.length; i++) {
                $scope.accordion.accordions[i] = value;
            }
            if (value) {
                $scope.accordion.close_others = false;
            }
        };

    });

});
