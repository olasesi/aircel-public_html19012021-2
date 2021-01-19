define(['./../module', 'underscore'], function (module, _) {

    module.controller('StaticBannersFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'static_banners';
        $scope.default_language = Journal2Config.languages.default;

        $scope.module_data = {
            module_name: 'New Module',
            module_title: {},
            items_per_row: {
                "range": "1,10",
                "step": "1",
                "value": {
                    "mobile": {
                        "value": "1",
                        "range": "1,10",
                        "step": "1"
                    },
                    "mobile1": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet1": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet2": {
                        "value": "1",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop1": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop2": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop1": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop2": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    }
                }
            },
            module_background:{},
            module_padding:'0',
            background: {},
            bgcolor: '',
            icon: {},
            fullwidth: '0',
            margin_top: '',
            margin_bottom: '',
            image_border: {},
            carousel: '0',
            arrows: '1',
            bullets: '1',
            autoplay: '0',
            pause_on_hover: '1',
            transition_speed: '400',
            transition_delay: '3000',
            touch_drag: '0',
            sections: [],
            enable_on_phone: '1',
            enable_on_tablet: '1',
            enable_on_desktop: '1'
        };

        var Section = function () {
            return {
                is_open: true,
                image: '',
                image_title: {},
                link: {
                    menu_type: 'custom'
                },
                link_new_window: '0',
                status: '1',
                sort_order: ''
            };
        };

        if ($scope.module_id) {
            Rest.getModule($scope.module_id).then(function (response) {
                $scope.module_data = _.extend($scope.module_data, response.module_data);
                $scope.module_data.sections = _.map($scope.module_data.sections, function (section) {
                    return _.extend(new Section(), section);
                });
                Spinner.hide();
            }, function (error) {
                Spinner.hide();
                console.error(error);
            });
        } else {
            $scope.module_data.general_is_open = true;
            $scope.module_data.top_bottom_is_open = true;
            Spinner.hide();
        }

        $scope.addSection = function () {
            $scope.module_data.sections.push(new Section());
        };

        $scope.removeSection = function ($index) {
            $scope.module_data.sections.splice($index, 1);
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

        $scope.duplicateSection = function (index) {
            $scope.module_data.sections.push(angular.copy($scope.module_data.sections[index]));
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

    }]);

});