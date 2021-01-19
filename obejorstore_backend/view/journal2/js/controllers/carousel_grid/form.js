define(['./../module', 'underscore'], function (module, _) {

    module.factory('CarouselGridFactory', [function () {
        return {
            Column: function () {
                return {
                    is_open: true,
                    width: '',
                    module_id: '',
                    disable_mobile: '0',
                    disable_desktop: '0',
                    status: 1,
                    sort_order: ''
                };
            }
        };
    }]);

    module.controller('CarouselGridFormController', function ($scope, $routeParams, $location, Rest, Spinner, CarouselGridFactory) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'carousel_grid';
        $scope.default_language = Journal2Config.languages.default;
        $scope.modules = [];

        $scope.module_data = {
            module_name: 'New Module',
            background: {},
            fullwidth: '0',
            margin_top: '',
            margin_bottom: '',
            disable_mobile: '0',
            disable_desktop: '0',
            module_spacing: '',
            columns: []
        };

        var promises = {
            modules: Rest.getModules('carousel')
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
                    var columns = _.extend(new CarouselGridFactory.Column(), column);
                    columns.modules = _.map(columns.modules, function (module) {
                        return _.extend(new CarouselGridFactory.Module(), module);
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
            $scope.module_data.columns.push(new CarouselGridFactory.Column());
        };

        $scope.removeColumn = function ($index) {
            $scope.module_data.columns.splice($index, 1);
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