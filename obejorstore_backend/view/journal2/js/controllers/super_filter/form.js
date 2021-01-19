define(['./../module', 'underscore'], function (module, _) {

    module.controller('SuperFilterFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'super_filter';
        $scope.default_language = Journal2Config.languages.default;
        $scope.attributes = [];
        $scope.options = [];
        $scope.filters = [];
        $scope.tax_classes = [];

        $scope.module_data = {
            module_name: 'New Module',
            reset: 1,
            product_count: 1,
            price: 1,
            price_slider: 1,
            tags : 1,
            availability: 1,
            tax_class_id: -1,
            manufacturer: 'list',
            manufacturer_type: 'multi',
            category: 'list',
            category_type: 'multi',
            options: {},
            options_type: {},
            attributes: {},
            attributes_type: {},
            sort_orders: {},
            filters: {},
            filters_type: {},
            enable_on_phone: '1',
            enable_on_tablet: '1',
            enable_on_desktop: '1'
        };

        var promises = {
            filters: Rest.getFilters()
        };

        if ($scope.module_id) {
            promises.module = Rest.getModule($scope.module_id);
        }

        Rest.all(promises, function (response) {
            if ($scope.module_id) {
                $scope.module_data = _.extend($scope.module_data, response.module.module_data);
            }
            $scope.module_data.is_open = $scope.module_data.is_open || {};
            $scope.attributes = response.filters.attributes;
            $scope.options = response.filters.options;
            $scope.filters = response.filters.filters;
            $scope.tax_classes = response.filters.tax_classes;
            _.each($scope.attributes, function (attribute_group) {
                $scope.module_data.is_open[attribute_group.group_id] = $scope.module_data.is_open[attribute_group.group_id] || {};
            });
            if (Object.prototype.toString.call($scope.module_data.sort_orders) === '[object Array]') {
                $scope.module_data.sort_orders = {};
            }
            Spinner.hide();
        }, function (error) {
            $scope.module_data.is_open = {};
            $scope.module_data.general_is_open = true;
            $scope.module_data.options_is_open = true;
            $scope.module_data.filters_is_open = true;
            Spinner.hide();
            alert(error);
        });

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

        $scope.toggleAccordion = function (items, value) {
            _.each(items, function (item) {
                item.is_open = value;
            });
            $scope.module_data.general_is_open = value;
            $scope.module_data.options_is_open = value;
            $scope.module_data.filters_is_open = value;
            if (value) {
                $scope.module_data.close_others = false;
            }
        };

    }]);

});