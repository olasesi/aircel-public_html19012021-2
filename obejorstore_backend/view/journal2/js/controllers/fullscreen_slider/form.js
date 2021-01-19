define(['./../module', 'underscore'], function (module, _) {

    module.factory('FullScreenSliderFactory', function () {
        return {
            Transitions: function () {
                return [
                    { id: 'none',           name: 'No transition effect' },
                    { id: 'fade',           name: 'Fade' },
                    { id: 'slideTop',       name: 'Slide in from top' },
                    { id: 'slideRight',     name: 'Slide in from right' },
                    { id: 'slideBottom',    name: 'Slide in from bottom' },
                    { id: 'slideLeft',      name: 'Slide in from left' },
                    { id: 'carouselRight',  name: 'Carousel from right to left' },
                    { id: 'carouselLeft',   name: 'Carousel from left to right' }
                ];
            }
        };
    });

    module.controller('FullScreenSliderFormController', function ($scope, $routeParams, $location, Rest, Spinner, FullScreenSliderFactory) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'fullscreen_slider';
        $scope.default_language = Journal2Config.languages.default;
        $scope.transitions = new FullScreenSliderFactory.Transitions();

        $scope.module_data = {
            module_name: 'New Module',
            transition: 'fade',
            transition_speed: 700,
            transition_delay: 3000,
            transparent_overlay: '',
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
                is_open: true,
                image: '',
                status: 1,
                sort_order: ''
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

    });

});
