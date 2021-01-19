define(['./module', 'underscore.string'], function (module, _S) {

    module.factory('MenuItemName', function () {
        var TYPES = {
            category    : 'Category',
            product     : 'Product',
            manufacturer: 'Brand',
            information : 'Information',
            opencart    : 'OpenCart Page',
            custom      : 'Custom'
        };

        var PAGES = {
            'common/home': 'Home',
            'account/wishlist': 'Wishlist',
            'product/compare': 'Compare',
            'account/account': 'My Account',
            'checkout/cart': 'Shopping cart',
            'checkout/checkout': 'Checkout',
            'information/contact': 'Contact',
            'account/return/insert': 'Returns',
            'information/sitemap': 'Sitemap',
            'product/manufacturer': 'Brands',
            'account/voucher': 'Gift Vouchers',
            'affiliate/account': 'Affiliates',
            'product/special': 'Specials',
            'product/search': 'Search',
            'account/order': 'Order History',
            'account/newsletter': 'Newsletter',
            'login': 'Login (Account)',
            'register': 'Register (Logout)'
        };

        return function (item) {
            var type = item.menu.menu_type;
            var name = item.menu.menu_item ? item.menu.menu_item.name : 'Menu Item';
            if (type === 'custom') {
                name = item.name.value[Journal2Config.languages.default] || 'Menu Item';
            }
            if (type === 'opencart') {
                name = PAGES[item.menu.menu_item.page];
            }
            if (item.name_overwrite == 1 && item.name && item.name.value) {
                name = item.name.value[Journal2Config.languages.default];
            }
            name = name || '';
            var pieces = name.split(' &gt; ');
            return _S.unescapeHTML(pieces.length > 0 ? pieces[pieces.length - 1] : '');
        };
    });

    module.directive('menuItem', function (Rest) {
        return {
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/menu-item.html?ver=' + Journal2Config.version,
            controller: function ($scope) {
                $scope.languages = Journal2Config.languages.languages;
            },
            link: function ($scope, $element) {
                $scope.popup_modules = [];
                $($element).find('select').change(function () {
                    if ($scope.ngModel.menu_type === 'opencart') {
                        $scope.ngModel.menu_item.page = 'common/home';
                    }
                });
                $scope.$watch('ngModel', function (val) {
                    val = val || {};
                    val.menu_item = val.menu_item || {};
                    if (Object.prototype.toString.call(val.menu_item) === '[object Array]') {
                        val.menu_item = {};
                    }
                    if (val.menu_type === 'opencart' && (!val.menu_item || !val.menu_item.page)) {
                        val.menu_item = val.menu_item || {};
                        val.menu_item.page = 'common/home';
                    }
                    if (val.menu_type === 'popup') {
                        Rest.getModules('popup').then(function (response) {
                            $scope.popup_modules = response;
                        }, function (error) {
                            alert(error);
                        });
                    }
                    $scope.ngModel = val;
                });
                $scope.resetItem = function () {
                    if ($scope.ngModel.menu_type === 'opencart') {
                        $scope.ngModel.menu_item = {};
                        $scope.ngModel.menu_item.page = 'common/home';
                    } else {
                        $scope.ngModel.menu_item = null;
                    }
                    if ($scope.ngModel.menu_type === 'popup') {
                        Rest.getModules('popup').then(function (response) {
                            $scope.popup_modules = response;
                        }, function (error) {
                            alert(error);
                        });
                    }
                };
            }
        };
    });

});