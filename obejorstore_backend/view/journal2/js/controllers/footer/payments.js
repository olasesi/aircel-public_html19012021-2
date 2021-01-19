define(['./../module', 'underscore'], function (module, _) {

    module.controller('FooterPaymentsController', function ($scope, $routeParams, $timeout, Spinner, Rest) {

        $scope.store_id = $routeParams.store_id || Journal2Config.stores[0].store_id;
        $scope.default_language = Journal2Config.languages.default;

        $scope.payments = [];
        $scope.close_others = false;

        var Item = function () {
            return {
                image: '',
                name: {},
                link: '',
                new_window: '0',
                sort_order: ''
            };
        };

        Rest.getSetting('payments', $scope.store_id).then(function (response) {
            if (response) {
                $scope.payments = response.payments || [];
                $scope.close_others = response.close_others;
            }
            $timeout(function () {
                Spinner.hide();
            }, 1);
        }, function (error) {
            console.error(error);
        });

        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.setSetting('payments', $scope.store_id, { payments: $scope.payments, close_others: $scope.close_others }).then(function (response) {
                Spinner.hide($src);
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

        $scope.addItem = function () {
            $scope.payments.push(new Item());
        };

        $scope.removeItem = function ($index) {
            $scope.payments.splice($index, 1);
        };

        $scope.toggleAccordion = function (items, value) {
            _.each(items, function (item) {
                item.is_open = value;
            });
        };

        $scope.toggleAccordion = function (items, value) {
            _.each(items, function (item) {
                item.is_open = value;
            });
            if (value) {
                $scope.close_others = false;
            }
        };

    });

});
