define(['./../module', 'underscore'], function (module, _) {

    module.controller('PopupFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'popup';
        $scope.default_language = Journal2Config.languages.default;
        $scope.newsletter_modules = [];

        $scope.module_data = {
            module_name: 'New module',
            close_button: '1',
            padding: '',
            title: {},
            title_align: 'center',
            title_font: {},
            title_bg_color: '',
            title_height: 40,
            newsletter: '0',
            newsletter_bg_color: '',
            newsletter_height: 80,
            newsletter_id: '',
            footer_height: 60,
            footer_bg_color: '',
            type: 'text',
            text: {},
            text_font: {},
            text_height: '',
            image: 'no_image.jpg',
            content_overflow: '1',
            status: '1',
            width: 600,
            height: 300,
            background: {},
            button_1: '0',
            button_1_link: {
                menu_type: 'custom'
            },
            button_1_icon: {},
            button_1_new_window: '0',
            button_1_text: {},
            button_1_font: {},
            button_1_bgcolor: '',
            button_1_hover_bgcolor: '',
            button_2: '0',
            button_2_link: {
                menu_type: 'custom'
            },
            button_2_icon: {},
            button_2_new_window: '0',
            button_2_text: {},
            button_2_font: {},
            button_2_bgcolor: '',
            button_2_hover_bgcolor: '',
            button_submit_icon: {},
            button_submit_text: {},
            button_submit_font: {},
            button_submit_bgcolor: '',
            button_submit_hover_bgcolor: '',
            button_submit_position: 'center',
            show_only_once: '0',
            do_not_show_again: '1',
            do_not_show_again_text: {},
            do_not_show_again_font: {},
            do_not_show_again_cookie: '',
            sort_order: '',
            enable_on_phone: '1',
            enable_on_tablet: '1',
            enable_on_desktop: '1'
        };

        $scope.resetCookie = function () {
            $scope.module_data.do_not_show_again_cookie = Math.random().toString(36).substring(7);
        };

        /* newsletter */
        Rest.getModules('newsletter').then(function (response) {
            $scope.newsletter_modules = response;
            Spinner.hide();
        }, function (error) {
            Spinner.hide();
        });

        /* get data */
        if ($scope.module_id) {
            Rest.getModule($scope.module_id).then(function (response) {
                $scope.module_data = _.extend($scope.module_data, response.module_data);
                Spinner.hide();
            }, function (error) {
                Spinner.hide();
                alert(error);
            });
        } else {
            $scope.module_data.general_is_open = true;
            $scope.module_data.header_is_open = true;
            $scope.module_data.newsletter_is_open = true;
            $scope.module_data.content_is_open = true;
            $scope.module_data.footer_is_open = true;
            $scope.module_data.top_bottom_is_open = true;
            $scope.resetCookie();
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
            $scope.module_data.header_is_open = value;
            $scope.module_data.newsletter_is_open = value;
            $scope.module_data.content_is_open = value;
            $scope.module_data.footer_is_open = value;
            $scope.module_data.top_bottom_is_open = value;
            if (value) {
                $scope.module_data.close_others = false;
            }
        };

    }]);

});