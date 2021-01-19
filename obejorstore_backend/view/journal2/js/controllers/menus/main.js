define(['./../module', 'underscore'], function (module, _) {

    module.factory('MainMenuFactory', [function () {
        return {
            Menu: function () {
                return {
                    type: 'categories',
                    categories: {
                        type: 'existing',
                        show: 'both',
                        image_position: 'right',
                        links_type: 'categories',
                        items: [],
                        render_as: 'megamenu'
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
                        target: 0,
                        items: []
                    },
                    mixed_columns: [],
                    icon: { },
                    hide_text: '0',
                    is_open: 1,
                    status: 1,
                    items_per_row: {
                        "range": "1,10",
                        "step": "1",
                        "hide_columns": true,
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
                    image_type: 'fit',
                    enable_on_phone: '1',
                    enable_on_tablet: '1',
                    enable_on_desktop: '1'
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
                   sort_order: '',
                   enable_on_phone: '1',
                   enable_on_tablet: '1',
                   enable_on_desktop: '1'
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

    module.controller('MainMenuController', function ($scope, $routeParams, $timeout, Spinner, Rest, MainMenuFactory) {

        $scope.store_id = $routeParams.store_id || Journal2Config.stores[0].store_id;
        $scope.items = [];
        $scope.close_others = false;
        $scope.options = new MainMenuFactory.Options();
        $scope.featured_modules = [];

        Rest.all({
            settings: Rest.getSetting('mega_menu', $scope.store_id),
            featured_modules: Rest.getFeaturedModules()
        }, function (response) {
            if (response.settings) {
                $scope.items = response.settings.items || [];
                $scope.close_others = response.settings.close_others;
                $scope.options = _.extend($scope.options, response.settings.options);
            }
            $scope.items = _.map($scope.items, function (item) {
                item = _.extend(new MainMenuFactory.Menu(), item);
                if (item.type === 'html') {
                    item.html_blocks = _.map(item.html_blocks, function (block) {
                        return _.extend(new MainMenuFactory.HtmlMenuItem(), block);
                    });
                }
                return item;
            });
            $scope.featured_modules = response.featured_modules;
            Spinner.hide();
        }, function (error) {
            Spinner.hide();
            alert(error);
        });

        $scope.addMenu = function () {
            $scope.items.push(new MainMenuFactory.Menu());
        };

        $scope.removeMenu = function ($index) {
            $scope.items.splice($index, 1);
        };

        $scope.addColumn = function (menu) {
            menu.mixed_columns.push(new MainMenuFactory.MenuColumn());
        };

        $scope.removeColumn = function (menu, $index) {
            menu.mixed_columns.splice($index, 1);
        };

        $scope.addSubMenu = function (menu) {
            menu.items.push(new MainMenuFactory.MenuItem());
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
            menu.html_blocks.push(new MainMenuFactory.HtmlMenuItem());
        };

        $scope.removeHtmlBlock = function (menu, $index) {
            menu.html_blocks.splice($index, 1);
        };

        $scope.addCMSBlock = function (column) {
            column.cms_blocks = column.cms_blocks || {};
            column.cms_blocks.push(new MainMenuFactory.MenuCMSBlock());
        };

        $scope.removeCMSBlock = function (column, $index) {
            column.cms_blocks.splice($index, 1);
        };

        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.setSetting('mega_menu', $scope.store_id, { items: $scope.items, close_others: $scope.close_others, options: $scope.options }).then(function (response) {
                Spinner.hide($src);
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

        $scope.reset = function ($event) {
            if (!confirm('Reset menu?')) {
                return;
            }
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.getTopCategories().then(function (response) {
                Spinner.hide($src);
                $scope.items = [];
                _.each(response, function (category) {
                    var item = _.extend(new MainMenuFactory.Menu(), {
                        type: "categories",
                        categories: {
                            type: "existing",
                            show: "both",
                            items: [ ],
                            render_as: "dropdown",
                            top: {
                                id: category.category_id,
                                name: category.name
                            },
                            subcategories: []
                        }
                    });
                    $scope.items.push(item);
                });
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

        $scope.toggleAccordion = function (items, model, value) {
            _.each(items, function (item) {
                item.is_open = value;
            });
            if (value) {
                if (model === null) {
                    $scope.close_others = false;
                } else {
                    model.close_others = false;
                }
            }
        };

        $scope.duplicateMenu = function (index) {
            $scope.items.push(angular.copy($scope.items[index]));
        };

        $scope.duplicateColumn = function (parent, index) {
            $scope.items[parent].mixed_columns.push(angular.copy($scope.items[parent].mixed_columns[index]));
        };

        $scope.getItemName = function (index, menu) {
            return menu['item_name'] || 'Menu Item ' + (index + 1);
        };
    });

});