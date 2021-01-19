define(['./../module', 'underscore'], function (module, _) {

    module.controller('ProductTabsFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'product_tabs';
        $scope.default_language = Journal2Config.languages.default;
        $scope.stores = Journal2Config.stores;
        $scope.popup_modules = [];

        $scope.module_data = {
            module_name: 'New Module',
            name: {},
            icon_status: '0',
            icon: {},
            icon_border: {},
            icon_bg_color: '',
            icon_width: '',
            icon_height: '',
            content_type: 'custom',
            out_of_stock_only: '0',
            content: {},
            popup: '',
            global: 1,
            products: [],
            categories: [],
            manufacturers: [],
            store_id: -1,
            status: 1,
            sort_order: '',
            position: 'tab',
            option_position: 'top',
            enable_on_phone: '1',
            enable_on_tablet: '1',
            enable_on_desktop: '1'
        };

        Rest.getModules('popup').then(function (response) {
            $scope.popup_modules = response;
        }, function (error) {
            alert(error);
        });

        if ($scope.module_id) {
            Rest.getModule($scope.module_id).then(function (response) {
                $scope.module_data = _.extend($scope.module_data, response.module_data);
                Spinner.hide();
            }, function (error) {
                Spinner.hide();
                console.error(error);
            });
        } else {
            Spinner.hide();
        }

        $scope.addItem = function (items) {
            items.push({ });
        };

        $scope.removeItem = function (items, $index) {
            items.splice($index, 1);
        };

        /* save data */
        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            if ($scope.module_id) {
                Rest.editModule($scope.module_id, $scope.module_data).then(function () {
                    Spinner.hide($src);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            } else {
                Rest.addModule($scope.module_type, $scope.module_data).then(function (response) {
                    $location.path('/module/' + $scope.module_type + '/form/' + response.module_id);
                    Spinner.hide($src);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            }
        };

        $scope.delete = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            if (!confirm('Delete module "' + $scope.module_data.module_name + '"?')) {
                Spinner.hide($src);
                return;
            }
            Rest.deleteModule($scope.module_id).then(function () {
                $location.path('/module/' + $scope.module_type + '/all');
                Spinner.hide($src);
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

    }]);

});