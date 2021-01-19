define(['./../module', 'underscore'], function (module, _) {

    module.factory('AdvancedGridFactory', [function () {
        return {
            Column: function () {
                return {
                    is_open: true,
                    width: '',
                    status: 1,
                    sort_order: '',
                    modules: []
                };
            },
            Module: function () {
                return {
                    is_open: true,
                    height: '',
                    module_id: '',
                    status: 1,
                    sort_order: '',
                    enable_on_phone: '1',
                    enable_on_tablet: '1',
                    enable_on_desktop: '1'
                };
            }
        };
    }]);

    module.controller('AdvancedGridFormController', function ($scope, $routeParams, $location, Rest, Spinner, AdvancedGridFactory) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'advanced_grid';
        $scope.default_language = Journal2Config.languages.default;
        $scope.modules = [];

        $scope.module_data = {
            module_name: 'New Module',
            height: '',
            module_background:{},
            module_padding:'0',
            background: {},
            fullwidth: '0',
            margin_top: '',
            margin_bottom: '',
            grid_dimensions: '1',
            module_spacing: '',
            columns: [],
            enable_on_phone: '1',
            enable_on_tablet: '1',
            enable_on_desktop: '1'
        };

        var promises = {
            modules: Rest.getMultiModules()
        };


        if ($scope.module_id) {
            promises.module = Rest.getModule($scope.module_id);
        } else {
            $scope.module_data.general_is_open = true;
            $scope.module_data.top_bottom_is_open = true;
        }

        Rest.all(promises, function (response) {
            if ($scope.module_id) {
                $scope.module_data = _.extend($scope.module_data, response.module.module_data);
                $scope.module_data.columns = _.map($scope.module_data.columns, function (column) {
                    var columns = _.extend(new AdvancedGridFactory.Column(), column);
                    columns.modules = _.map(columns.modules, function (module) {
                        return _.extend(new AdvancedGridFactory.Module(), module);
                    });
                    return columns;
                });
            }
            $scope.modules = response.modules;
            Spinner.hide();
        }, function (error) {
            Spinner.hide();
        });

        $scope.addColumn = function () {
            $scope.module_data.columns.push(new AdvancedGridFactory.Column());
        };

        $scope.removeColumn = function ($index) {
            $scope.module_data.columns.splice($index, 1);
        };

        $scope.addModule = function (column) {
            column.modules.push(new AdvancedGridFactory.Module());
        };

        $scope.removeModule = function (column, $index) {
            column.modules.splice($index, 1);
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

        $scope.duplicateColumn = function (index) {
            $scope.module_data.columns.push(angular.copy($scope.module_data.columns[index]));
        };

        $scope.duplicateModule = function (parent, index) {
            $scope.module_data.columns[parent].modules.push(angular.copy($scope.module_data.columns[parent].modules[index]));
        };

        $scope.toggleAccordion = function (items, value) {
            _.each(items, function (item) {
                item.is_open = value;
            });
            $scope.module_data.general_is_open = value;
            $scope.module_data.top_bottom_is_open = value;
            if (value) {
                $scope.module_data.close_others = false;
            }
        };

        $scope.toggleAccordion2 = function (column, value) {
            _.each(column.modules, function (item) {
                item.is_open = value;
            });
            if (value) {
                column.close_others = false;
            }
        };

    });

});