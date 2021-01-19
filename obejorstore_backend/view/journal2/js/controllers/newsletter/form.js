define(['./../module', 'underscore'], function (module, _) {

    module.controller('NewsletterFormController', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'newsletter';
        $scope.default_language = Journal2Config.languages.default;

        $scope.module_data = {
            module_name: 'New Module',
            module_title: {},
            module_text: {},
            module_text_font: '',
            module_background: {},
            module_border: {},
            module_padding_top: '',
            module_padding_right: '',
            module_padding_bottom: '',
            module_padding_left: '',
            text_position: 'left',
            input_height: '',
            input_placeholder: {},
            input_bg_color: {},
            input_font: '',
            input_border: {},
            button_text: {},
            button_font: '',
            button_icon: {},
            button_border: {},
            button_offset_top: '',
            button_offset_left: '',
            button_shadow: {},
            button_shadow_hover: {},
            button_shadow_active: {},
            button_bg_image: {},
            button_bg_image_hover: {},
            background: {},
            fullwidth: '0',
            margin_top: '',
            margin_bottom: '',
            enable_on_phone: '1',
            enable_on_tablet: '1',
            enable_on_desktop: '1'
        };

        /* get data */
        if ($scope.module_id) {
            Rest.getModule($scope.module_id).then(function (response) {
                $scope.module_data = _.extend($scope.module_data, response.module_data);
                Spinner.hide();
            }, function (error) {
                $scope.module_data.general_is_open = true;
                $scope.module_data.top_bottom_is_open = true;
                Spinner.hide();
                alert(error);
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

    });

});