define(['./../module', 'underscore'], function (module, _) {

    module.factory('SimpleSliderFactory', function () {
        return {
            Slider: function () {
                return {
                    module_name: 'New Slider',
                    height: '',
                    transition: 'fade',
                    transition_speed: 1000,
                    autoplay: '1',
                    pause_on_hover: '1',
                    transition_delay: 3000,
                    touch_drag: '0',
                    preload_images: '1',
                    arrows: '0',
                    bullets: '1',
                    show_on_hover: '1',
                    background: {},
                    margin_top: '',
                    margin_bottom: '',
                    slides: [],
                    enable_on_phone: '1',
                    enable_on_tablet: '1',
                    enable_on_desktop: '1'
                };
            },
            Slide: function () {
                return {
                    is_open: true,
                    slide_name: '',
                    image: '',
                    link: {
                        menu_type: 'custom'
                    },
                    link_new_window: '0',
                    status: 1,
                    sort_order: ''
                };
            }
        };
    });

    module.controller('SimpleSliderFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', 'SimpleSliderFactory', '$timeout', function ($scope, $routeParams, $location, Rest, Spinner, SimpleSliderFactory, $timeout) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'simple_slider';
        $scope.default_language = Journal2Config.languages.default;

        $scope.module_data = new SimpleSliderFactory.Slider();

        if ($scope.module_id) {
            Rest.getModule($scope.module_id).then(function (response) {
                $scope.module_data = _.extend($scope.module_data, response.module_data);
                $scope.module_data.slides = _.map($scope.module_data.slides, function (slide) {
                    return _.extend(new SimpleSliderFactory.Slide(), slide);
                });
                $timeout(function () {
                    Spinner.hide();
                }, 1);
            }, function (error) {
                Spinner.hide();
                console.error(error);
            });
        } else {
            $scope.module_data.general_is_open = true;
            $scope.module_data.navigation_is_open = true;
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

        $scope.addSlide = function () {
            $scope.module_data.slides.push(new SimpleSliderFactory.Slide());
        };

        $scope.removeSlide = function ($index) {
            $scope.module_data.slides.splice($index, 1);
        };

        $scope.duplicateSlide = function (index) {
            $scope.module_data.slides.push(angular.copy($scope.module_data.slides[index]));
        };

        $scope.toggleAccordion = function (items, value) {
            _.each(items, function (item) {
                item.is_open = value;
            });
            $scope.module_data.general_is_open = value;
            $scope.module_data.navigation_is_open = value;
            $scope.module_data.top_bottom_is_open = value;
            if (value) {
                $scope.module_data.close_others = false;
            }
        };

    }]);

});