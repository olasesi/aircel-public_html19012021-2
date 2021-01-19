define(['./../module', 'underscore'], function (module, _) {

    module.controller('HeaderNoticeFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'header_notice';
        $scope.default_language = Journal2Config.languages.default;

        $scope.module_data = {
            module_name: 'New Module',
            height: '',
            padding_t: '',
            padding_l: '',
            padding_b: '',
            padding_r: '',
            text: {},
            text_align: 'center',
            text_font: {},
            text_link_color: {},
            text_link_hover_color: {},
            button_color: {},
            button_hover_color: {},
            button_bg_color: {},
            button_hover_bg_color: {},
            icon: {},
            float_icon: '1',
            fullwidth: '1',
            icon_position: 'left',
            close_button_type: 'icon',
            close_button_text: {},
            show_only_once: '0',
            do_not_show_again: '1',
            do_not_show_again_cookie: '',
            enable_on_phone: '1',
            enable_on_tablet: '1',
            enable_on_desktop: '1'
        };

        $scope.resetCookie = function () {
            $scope.module_data.do_not_show_again_cookie = Math.random().toString(36).substring(7);
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
            $scope.module_data.content_is_open = true;
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

        $scope.toggleAccordion = function (items, value) {
            _.each(items, function (item) {
                item.is_open = value;
            });
            $scope.module_data.general_is_open = value;
            $scope.module_data.content_is_open = value;
            if (value) {
                $scope.module_data.close_others = false;
            }
        };

    }]);

});