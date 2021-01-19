define(['./../module', 'underscore'], function (module, _) {

    module.controller('ImportExportSettingsController', function ($scope, $routeParams, $location, $timeout, localStorageService, Rest, Spinner) {

        $scope.settings = {
            opencart_version: (Journal2Config.oc3 || Journal2Config.oc2) ? 2 : 1,
            include_store_data: 0,
            add_dummy_images: 0,
            include_blog_data: 0,
            purchased_code: localStorageService.get('j2_purchased_code'),
            tf_user: localStorageService.get('j2_tf_user')
        };

        $scope.saveCookie = function (key) {
            localStorageService.set('j2_' + key, $scope.settings[key]);
        };

        Spinner.hide();

        var getExportLink = function () {
            return _.map($scope.settings, function (value, key) {
                return key + '=' + value;
            }).join('&');
        };

        $scope.confirmation = function ($event, verify) {
            $event.preventDefault();
            var $src = $($event.target || $event.srcElement);
            if ($scope.settings.include_store_data == 1 && !confirm('WARNING! This will include store data from this installation. Importing this file into your store will reset your data to the one in this file. ')) {
                return false;
            }
            if (verify) {
                Spinner.show($src);
                Rest.verifyCode($scope.settings).then(function () {
                    window.location = $src.attr('href') + '&' + getExportLink();
                    Spinner.hide($src);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            } else {
                window.location = $src.attr('href') + '&' + getExportLink();
            }
            return false;
        };

    });

});
