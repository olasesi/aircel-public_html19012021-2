define(['./../module', 'underscore'], function (module, _) {

    module.factory('CarouselFactory', function () {
        return {
            SuperSection: function () {
                return {
                    module_name: 'New Module',
                    module_type: 'product',
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
                                "value": "2",
                                "range": "1,10",
                                "step": "1"
                            },
                            "tablet": {
                                "value": "3",
                                "range": "1,10",
                                "step": "1"
                            },
                            "tablet1": {
                                "value": "2",
                                "range": "1,10",
                                "step": "1"
                            },
                            "tablet2": {
                                "value": "1",
                                "range": "1,10",
                                "step": "1"
                            },
                            "desktop": {
                                "value": "4",
                                "range": "1,10",
                                "step": "1"
                            },
                            "desktop1": {
                                "value": "3",
                                "range": "1,10",
                                "step": "1"
                            },
                            "desktop2": {
                                "value": "2",
                                "range": "1,10",
                                "step": "1"
                            },
                            "large_desktop": {
                                "value": "5",
                                "range": "1,10",
                                "step": "1"
                            },
                            "large_desktop1": {
                                "value": "4",
                                "range": "1,10",
                                "step": "1"
                            },
                            "large_desktop2": {
                                "value": "4",
                                "range": "1,10",
                                "step": "1"
                            }
                        }
                    },
                    module_background:{},
                    module_padding:'0',
                    arrows: 'top',
                    bullets: 1,
                    top_bottom_placement: 0,
                    background: {},
                    fullwidth: '0',
                    margin_top: '',
                    margin_bottom: '',
                    spacing: '',
                    show_title: '1',
                    brand_name: '1',
                    autoplay: '0',
                    pause_on_hover: '1',
                    transition_speed: '400',
                    transition_delay: '3000',
                    touch_drag: '0',
                    image_border: {},
                    image_bgcolor: '',
                    image_width: '',
                    image_height: '',
                    image_type: 'fit',
                    product_sections: [],
                    category_sections: [],
                    manufacturer_sections: [],
                    enable_on_phone: '1',
                    enable_on_tablet: '1',
                    enable_on_desktop: '1'
                };
            },
            ProductSection : function () {
                return {
                    is_open: true,
                    section_title: {},
                    section_type: 'module',
                    status: '1',
                    default_section: '0',
                    sort_order: '',
                    products: [],
                    category: '',
                    items_limit: 5,
                    module_type: 'featured',
                    todays_specials_only: '0',
                    countdown_visibility: '0',
                    filter_category: '0',
                    link: {
                        menu_type: 'custom',
                        url: ''
                    },
                    new_window: '0'
                };
            },
            CategorySection : function () {
                return {
                    is_open: true,
                    section_title: {},
                    section_type: 'top',
                    status: '1',
                    default_section: '0',
                    sort_order: '',
                    category_sub: '',
                    categories: [],
                    items_limit: 5,
                    link: {
                        menu_type: 'custom',
                        url: ''
                    },
                    new_window: '0'
                };
            },
            ManufacturerSection : function () {
                return {
                    is_open: true,
                    section_title: {},
                    section_type: 'all',
                    status: '1',
                    default_section: '0',
                    sort_order: '',
                    manufacturers: [],
                    items_limit: 5,
                    link: {
                        menu_type: 'custom',
                        url: ''
                    },
                    new_window: '0'
                };
            }
        };
    });

    module.controller('CarouselFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', 'CarouselFactory', function ($scope, $routeParams, $location, Rest, Spinner, CarouselFactory) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'carousel';
        $scope.default_language = Journal2Config.languages.default;
        $scope.featured_modules = [];

        $scope.module_data = new CarouselFactory.SuperSection();

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

        /* add section */
        $scope.addSection = function (type) {
            switch (type) {
            case 'product':
                $scope.module_data.product_sections.push(new CarouselFactory.ProductSection());
                break;
            case 'category':
                $scope.module_data.category_sections.push(new CarouselFactory.CategorySection());
                break;
            case 'manufacturer':
                $scope.module_data.manufacturer_sections.push(new CarouselFactory.ManufacturerSection());
                break;
            }
        };

        /* remove section */
        $scope.removeSection = function (sections, $index) {
            sections.splice($index, 1);
        };

        /* add product */
        $scope.addProduct = function (section) {
            section.products.push({ });
        };

        /* remove product */
        $scope.removeProduct = function (section, $index) {
            section.products.splice($index, 1);
        };

        /* add category */
        $scope.addCategory = function (section) {
            section.categories.push({ });
        };

        /* remove category */
        $scope.removeCategory = function (section, $index) {
            section.categories.splice($index, 1);
        };

        /* add manufacturer */
        $scope.addManufacturer = function (section) {
            section.manufacturers.push({ });
        };

        /* remove manufacturer */
        $scope.removeManufacturer = function (section, $index) {
            section.manufacturers.splice($index, 1);
        };

        /* reset default section */
        $scope.setDefault = function (sections, index) {
            var i;
            for (i = 0; i < sections.length; i = i + 1) {
                if (index !== i) {
                    sections[i].default_section = '0';
                }
            }
        };

        $scope.duplicateSection = function (sections, index) {
            sections.push(angular.copy(sections[index]));
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

    }]);

});