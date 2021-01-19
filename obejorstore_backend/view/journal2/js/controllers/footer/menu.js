define(['./../module', 'underscore'], function (module, _) {

    module.controller('FooterMenuController', function ($scope, $routeParams, $timeout, Spinner, Rest) {
        $scope.store_id = $routeParams.store_id || Journal2Config.stores[0].store_id;

        /* module */
        $scope.rows = [];
        $scope.close_others = false;
        $scope.newsletter_modules = [];

        $scope.default_language = Journal2Config.languages.default;
        $scope.featured_modules = [];

        var Row = function () {
            return {
                type: 'columns',
                text: {},
                columns: [],
                contacts: [],
                social_icons: [],
                status: 1,
                sort_order: '',
                bottom_spacing: '',
                padding_top: '',
                padding_right: '',
                padding_bottom: '',
                padding_left: '',
                items_per_row: {
                    "hide_columns": true,
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
                            "value": "4",
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
                is_open: true,
                background: {},
                enable_on_phone: '1',
                enable_on_tablet: '1',
                enable_on_desktop: '1'
            };
        };

        var Column = function () {
            return {
                type: 'menu',
                items: [],
                text: {},
                title: {},
                icon_status: '0',
                icon: {},
                icon_position: 'top',
                icon_border: {},
                icon_bg_color: '',
                icon_width: '',
                icon_height: '',
                is_open: true,
                newsletter_id: '',
                section_type: 'module',
                products: [],
                category: '',
                items_limit: 4,
                module_type: 'featured',
                posts_type: 'newest',
                posts: [],
                status: '1',
                enable_on_phone: '1',
                enable_on_tablet: '1',
                enable_on_desktop: '1'
            };
        };

        var Item = function () {
            return {
                icon: {
                },
                menu: {
                    menu_type: 'opencart',
                    menu_item: {}
                },
                name_overwrite: 0,
                target: 0,
                is_open: true
            };
        };

        var Contact = function () {
            return {
                position: 'left',
                link: {
                    menu_type: 'custom'
                },
                target: 0,
                icon: {},
                name: {},
                tooltip: 0,
                sort_order: '',
                is_open: true,
                enable_on_phone: '1',
                enable_on_tablet: '1',
                enable_on_desktop: '1'
            };
        };

        function extendRows (rows) {
            return _.map(rows, function (row) {
                row = _.extend(new Row(), row);
                if (row.type === 'columns') {
                    row.columns = _.map(row.columns, function (column) {
                        return _.extend(new Column(), column);
                    });
                }
                return row;
            });
        }

        Rest.all({
            footer_menu: Rest.getSetting('footer_menu', $scope.store_id),
            featured_modules: Rest.getFeaturedModules(),
            newsletter_modules: Rest.getModules('newsletter')
        }, function (response) {
            if (response.footer_menu) {
                $scope.rows = response.footer_menu.rows || [];
                $scope.rows = extendRows($scope.rows);
                $scope.close_others = response.footer_menu.close_others;
            }
            $scope.featured_modules = response.featured_modules;
            $scope.newsletter_modules = response.newsletter_modules;
            Spinner.hide();
        }, function (error) {
            Spinner.hide();
            alert(error);
        });

        $scope.addRow = function () {
            $scope.rows.push(new Row());
        };

        $scope.removeRow = function ($index) {
            $scope.rows.splice($index, 1);
        };

        $scope.addColumn = function (row) {
            row.columns.push(new Column());
        };

        $scope.removeColumn = function (row, $index) {
            row.columns.splice($index, 1);
        };

        $scope.addContact = function (row) {
            row.contacts.push(new Contact());
        };

        $scope.removeContact = function (row, $index) {
            row.contacts.splice($index, 1);
        };

        $scope.addItem = function (column) {
            column.items.push(new Item());
        };

        $scope.removeItem = function (column, $index) {
            column.items.splice($index, 1);
        };

        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.setSetting('footer_menu', $scope.store_id, { rows: $scope.rows, close_others: $scope.close_others }).then(function (response) {
                Spinner.hide($src);
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

        $scope.reset = function () {
            if (!confirm('Reset menu?')) {
                return;
            }
            var rows = [{
                type: 'columns',
                columns: [{
                    "type": "menu",
                    "items": [{
                        "icon": [],
                        "menu": {
                            "menu_type": "information",
                            "menu_item": {
                                "id": "4",
                                "name": "About Us"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "information",
                            "menu_item": {
                                "id": "6",
                                "name": "Delivery Information"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "information",
                            "menu_item": {
                                "id": "3",
                                "name": "Privacy Policy"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "information",
                            "menu_item": {
                                "id": "5",
                                "name": "Terms &amp; Conditions"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }],
                    "text": [],
                    "title": {
                        "value": {
                            "1": "Information",
                            "2": "Information"
                        }
                    }
                }, {
                    "type": "menu",
                    "items": [{
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "information\/contact"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "account\/return\/insert"
                            }
                        },
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "information\/sitemap"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }],
                    "text": [],
                    "title": {
                        "value": {
                            "1": "Customer Service",
                            "2": "Customer Service"
                        }
                    }
                }, {
                    "type": "menu",
                    "items": [{
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "product\/manufacturer"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "account\/voucher"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "affiliate\/account"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "product\/special"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }],
                    "text": [],
                    "title": {
                        "value": {
                            "1": "Extras",
                            "2": "Extras"
                        }
                    }
                }, {
                    "type": "menu",
                    "items": [{
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "account\/account"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "account\/order"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "account\/wishlist"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }, {
                        "icon": [],
                        "menu": {
                            "menu_type": "opencart",
                            "menu_item": {
                                "page": "account\/newsletter"
                            }
                        },
                        name_overwrite: 0,
                        "target": 0
                    }],
                    "text": [],
                    "title": {
                        "value": {
                            "1": "My Account",
                            "2": "My Account"
                        }
                    }
                }],
                contacts: [],
                items_per_row: {
                    "hide_columns": true,
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
                            "value": "4",
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
                background: {},
                sort_order: ''
            }];
            $scope.rows = extendRows(rows);
        };

        $scope.toggleAccordion = function (items, type, item, value) {
            _.each(items, function (item) {
                item.is_open = value;
            });
            if (value) {
                if (type === 'scope') {
                    $scope.close_others = false;
                } else {
                    item.close_others = false;
                }
            }
        };

        /* add product */
        $scope.addProduct = function (section) {
            section.products.push({ });
        };

        /* remove product */
        $scope.removeProduct = function (section, $index) {
            section.products.splice($index, 1);
        };

        /* add post */
        $scope.addPost = function (column) {
            column.posts.push({ });
        };

        /* remove product */
        $scope.removeProduct = function (column, $index) {
            column.posts.splice($index, 1);
        };

        $scope.duplicateRow = function (index) {
            $scope.rows.push(angular.copy($scope.rows[index]));
        };

        $scope.duplicateColumn = function (parent, index) {
            $scope.rows[parent].columns.push(angular.copy($scope.rows[parent].columns[index]));
        };

        $scope.getItemName = function (index, row) {
            return row['item_name'] || 'Row ' + (index + 1);
        };

        $scope.getColumnItemName = function (index, row) {
            return row['item_name'] || 'Column ' + (index + 1);
        };
    });

});