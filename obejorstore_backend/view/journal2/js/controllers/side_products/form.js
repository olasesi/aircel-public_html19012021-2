define(['./../module', 'underscore'], function (module, _) {

    module.controller('SideProductsFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'side_products';
        $scope.default_language = Journal2Config.languages.default;
        $scope.featured_modules = [];

        $scope.module_data = {
            module_name: 'New Module',
            section_title: {},
            section_type: 'module',
            products: [],
            category: '',
            items_limit: 5,
            module_type: 'featured',
            filter_category: '0'
        };

        /* get data */
        var data = {
            featured_modules: Rest.getFeaturedModules()
        };

        if ($scope.module_id) {
            data.modules = Rest.getModule($scope.module_id);
        }

        Rest.all(data, function (response) {
            $scope.featured_modules = response.featured_modules;
            if (response.modules) {
                $scope.module_data = _.extend($scope.module_data, response.modules.module_data);
            }
            Spinner.hide();
        }, function (error) {
            $scope.module_data.general_is_open = true;
            $scope.module_data.top_bottom_is_open = true;
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

        $scope.toggleAccordion = function (value) {
            _.each($scope.module_data.product_sections, function (item) {
                item.is_open = value;
            });
            _.each($scope.module_data.category_sections, function (item) {
                item.is_open = value;
            });
            _.each($scope.module_data.manufacturer_sections, function (item) {
                item.is_open = value;
            });
            $scope.module_data.general_is_open = value;
            $scope.module_data.top_bottom_is_open = value;
            if (value) {
                $scope.module_data.close_others = false;
            }
        };

        /* add product */
        $scope.addProduct = function () {
            $scope.module_data.products.push({ });
        };

        /* remove product */
        $scope.removeProduct = function ($index) {
            $scope.module_data.products.splice($index, 1);
        };

    }]);

});