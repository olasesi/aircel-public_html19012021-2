define(['./../module', 'underscore'], function (module, _) {

    module.factory('SideColumnMenuFactory', [function () {
        return {
            Menu: function () {
                return {
                    type: 'mixed',
                    container_width: '',
                    categories: {
                        type: 'existing',
                        show: 'both',
                        image_position: 'right',
                        links_type: 'categories',
                        items: [],
                        render_as: 'dropdown'
                    },
                    custom: {
                        top: {
                            menu_type: 'custom',
                            menu_item: null
                        },
                        target: 0,
                        items: []
                    },
                    mixed_columns: [],
                    icon: { },
                    background: { },
                    hide_text: '0',
                    is_open: 1,
                    status: 1,
                    hide_on_mobile: 0,
                    hide_on_desktop: '0',
                    items_per_row: {
                        "range": "1,10",
                        "step": "1",
                        "hide_columns": true,
                        "hide_phone": true,
                        "value": {
                            "mobile": {
                                "value": "2",
                                "range": "1,10",
                                "step": "1"
                            },
                            "mobile1": {
                                "value": "3",
                                "range": "1,10",
                                "step": "1"
                            },
                            "tablet": {
                                "value": "4",
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
                                "value": "6",
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
                                "value": "6",
                                "range": "1,10",
                                "step": "1"
                            },
                            "large_desktop1": {
                                "value": "3",
                                "range": "1,10",
                                "step": "1"
                            },
                            "large_desktop2": {
                                "value": "2",
                                "range": "1,10",
                                "step": "1"
                            }
                        }
                    },
                    items_limit: 5,
                    html_blocks: [],
                    html_menu_link: {
                        menu_type: 'custom',
                        menu_item: null
                    },
                    title: {},
                    float: 'left',
                    image_width: '',
                    image_height: '',
                    image_type: 'fit'
                };
            },
            HtmlMenuItem: function () {
                return {
                    title: {},
                    status: 1,
                    sort_order: '',
                    text: {},
                    is_open: 1
                };
            },
            MenuColumn: function () {
                return {
                    is_open:1,
                    hide_on_mobile: 0,
                    hide_on_desktop: '0',
                    type: 'categories',
                    categories: {
                        type: 'existing',
                        show: 'both',
                        image_position: 'right',
                        links_type: 'categories',
                        items: []
                    },
                    products: {
                        source: 'category',
                        module_type: 'featured',
                        items: []
                    },
                    manufacturers: {
                        type: 'all',
                        show: 'image',
                        items: []
                    },
                    custom: {
                        top: {
                            menu_type: 'custom',
                            menu_item: null
                        },
                        items: []
                    },
                    link: {
                        menu_type: 'custom',
                        menu_item: null
                    },
                    html_text: {},
                    cms_blocks: [],
                    width: '',
                    image_width: '',
                    image_height: '',
                    image_type: 'fit',
                    items_per_row: {
                        "range": "1,10",
                        "step": "1",
                        "hide_columns": true,
                        "hide_phone": true,
                        "value": {
                            "mobile": {
                                "value": "2",
                                "range": "1,10",
                                "step": "1"
                            },
                            "mobile1": {
                                "value": "3",
                                "range": "1,10",
                                "step": "1"
                            },
                            "tablet": {
                                "value": "4",
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
                                "value": "6",
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
                                "value": "6",
                                "range": "1,10",
                                "step": "1"
                            },
                            "large_desktop1": {
                                "value": "3",
                                "range": "1,10",
                                "step": "1"
                            },
                            "large_desktop2": {
                                "value": "2",
                                "range": "1,10",
                                "step": "1"
                            }
                        }
                    },
                    items_limit: 5,
                    status: '1',
                    sort_order: ''
                }
            },
            MenuItem: function () {
                return {
                    menu: {
                        menu_type: 'custom',
                        menu_item: null
                    },
                    target: 0,
                    is_open: 1
                };
            },
            MenuCMSBlock: function () {
                return {
                    is_open: 1,
                    content: { },
                    position: 'top',
                    status: 1,
                    sort_order: ''
                };
            },
            Options: function () {
                return {
                    display: 'table',
                    table_layout: 'fixed',
                    is_open: 1
                };
            }
        };
    }]);

    module.controller('SideColumnMenuFormController', function ($scope, $routeParams, $location, Rest, Spinner, SideColumnMenuFactory) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'side_column_menu';
        $scope.default_language = Journal2Config.languages.default;
        $scope.featured_modules = [];

        $scope.module_data = {
            module_name: 'New Flyout Menu',
            title: {},
            items: [],
        };

        Rest.getFeaturedModules().then(function (response) {
            $scope.featured_modules = response;
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

        $scope.addMenu = function () {
            $scope.module_data.items.push(new SideColumnMenuFactory.Menu());
        };

        $scope.removeMenu = function ($index) {
            $scope.module_data.items.splice($index, 1);
        };

        $scope.addColumn = function (menu) {
            menu.mixed_columns.push(new SideColumnMenuFactory.MenuColumn());
        };

        $scope.removeColumn = function (menu, $index) {
            menu.mixed_columns.splice($index, 1);
        };

        $scope.addSubMenu = function (menu) {
            menu.items.push(new SideColumnMenuFactory.MenuItem());
        };

        $scope.removeSubMenu = function (menu, $index) {
            menu.items.splice($index, 1);
        };

        $scope.addItem = function (menu) {
            menu.items.push({
                menu_type: 'opencart',
                menu_item: {}
            });
        };

        $scope.removeItem = function (menu, $index) {
            menu.items.splice($index, 1);
        };

        $scope.addHtmlBlock = function (menu) {
            menu.html_blocks.push(new SideColumnMenuFactory.HtmlMenuItem());
        };

        $scope.removeHtmlBlock = function (menu, $index) {
            menu.html_blocks.splice($index, 1);
        };

        $scope.addCMSBlock = function (column) {
            column.cms_blocks = column.cms_blocks || {};
            column.cms_blocks.push(new SideColumnMenuFactory.MenuCMSBlock());
        };

        $scope.removeCMSBlock = function (column, $index) {
            column.cms_blocks.splice($index, 1);
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

        $scope.toggleAccordion2 = function (menu, value) {
            _.each(menu.mixed_columns, function (item) {
                item.is_open = value;
            });
            if (value) {
                $scope.close_others = value;
            }
        };

    });

});
