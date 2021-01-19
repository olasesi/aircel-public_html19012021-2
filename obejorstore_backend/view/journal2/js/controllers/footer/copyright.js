define(['./../module', 'underscore'], function (module, _) {

    module.controller('FooterCopyrightController', function ($scope, $routeParams, $timeout, Spinner, Rest) {

        $scope.store_id = $routeParams.store_id || Journal2Config.stores[0].store_id;

        $scope.copyright = {};

        Rest.getSetting('copyright', $scope.store_id).then(function (response) {
            if (response) {
                $scope.copyright = response;
            }
            $timeout(function () {
                Spinner.hide();
            }, 1);
        }, function (error) {
            console.error(error);
        });

        $scope.save = function () {
            Rest.setSetting('copyright', $scope.store_id, $scope.copyright).then(function (response) {
                console.log(response);
            }, function (error) {
                console.error(error);
            });
        };

    });

});
