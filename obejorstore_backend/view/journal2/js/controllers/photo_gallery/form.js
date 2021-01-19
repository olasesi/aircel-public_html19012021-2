define(['./../module', 'underscore'], function (module, _) {

    module.controller('PhotoGalleryFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'photo_gallery';
        $scope.default_language = Journal2Config.languages.default;

        $scope.module_data = {
            module_name: 'New Module',
            gallery_name: {},
            thumbs_limit: '',
            thumbs_width: '',
            thumbs_height: '',
            thumbs_type: 'crop',
            items_per_row: {
                "range": "1,10",
                "step": "1",
                "value": {
                    "mobile": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "mobile1": {
                        "value": "4",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet": {
                        "value": "5",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet1": {
                        "value": "4",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet2": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop": {
                        "value": "7",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop1": {
                        "value": "6",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop2": {
                        "value": "5",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop": {
                        "value": "8",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop1": {
                        "value": "7",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop2": {
                        "value": "6",
                        "range": "1,10",
                        "step": "1"
                    }
                }
            },
            carousel: 0,
            carousel_arrows: 'none',
            carousel_buttons: 1,
            top_bottom_placement: 0,
            background: {},
            autoplay: '0',
            pause_on_hover: '1',
            transition_speed: '400',
            transition_delay: '3000',
            touch_drag: '0',
            fullwidth: '0',
            margin_top: '',
            margin_bottom: '',
            image_border: {},
            images: [],
            enable_on_phone: '1',
            enable_on_tablet: '1',
            enable_on_desktop: '1'
        };

        if ($scope.module_id) {
            Rest.getModule($scope.module_id).then(function (response) {
                $scope.module_data = _.extend($scope.module_data, response.module_data);
                Spinner.hide();
            }, function (error) {
                Spinner.hide();
                console.error(error);
            });
        } else {
            $scope.module_data.general_is_open = true;
            Spinner.hide();
        }

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

        $scope.addImage = function () {
            $scope.module_data.images.push({
                is_open: true
            });
        };

        $scope.removeImage = function ($index) {
            $scope.module_data.images.splice($index, 1);
        };

        $scope.duplicateImage = function (index) {
            $scope.module_data.images.push(angular.copy($scope.module_data.images[index]));
        };

        $scope.toggleAccordion = function (items, value) {
            _.each(items, function (item) {
                item.is_open = value;
            });
            $scope.module_data.general_is_open = value;
            if (value) {
                $scope.module_data.close_others = false;
            }
        };

    }]);

});