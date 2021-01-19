define(['./module', 'underscore'], function(module, _){

    module.controller('SettingsController', ['$scope', '$routeParams', 'Rest', '$timeout', function($scope, $routeParams, Rest, $timeout){
        var category = $routeParams.category;
        var store_id = 0;

        $scope.settings = [];
        $scope.hasSubcategs = false;

        $timeout(function () {
            Rest.loadSettings(category, store_id).then(function(settings){
                var subcateg = {};

                _.each(settings, function(setting){
                    if (setting.subcategory) {
                        subcateg[setting.subcategory] = subcateg[setting.subcategory] || [];
                        subcateg[setting.subcategory].push(setting);
                    }
                });

                $scope.hasSubcategs = Object.keys(subcateg).length > 0;
                $scope.settings = $scope.hasSubcategs ? subcateg : settings;
                $('.journal-loading').hide();
            }, function(error){
                console.error(error);
            });
        }, 1);



        $scope.save = function() {
            var settings = [];
            if ($scope.hasSubcategs) {
                _.each($scope.settings, function(subcateg) {
                    _.each(subcateg, function(setting) {
                        if (setting.setting.value !== undefined) {
                            settings.push({
                                key: setting.setting.name,
                                value: setting.setting.value
                            });
                        }
                    });
                });
            } else {
                _.each($scope.settings, function(setting) {
                    if (setting.setting.value !== undefined) {
                        settings.push({
                            key: setting.setting.name,
                            value: setting.setting.value
                        });
                    }
                });
            }

            Rest.saveSettings(settings, store_id).then(function(response){
                console.log(response);
            }, function(error){
                console.error(error);
            });
        }

    }]);

});
