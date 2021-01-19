define(['./../module', 'underscore'], function (module, _) {

    module.controller('SideBlocksFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'side_blocks';
        $scope.default_language = Journal2Config.languages.default;
		$scope.stores = Journal2Config.stores;

        $scope.module_data = {
            module_name: 'New Module',
            module_type: 'block',
            icon: {},
            icon_bg_color: 'FFF',
            icon_border: { },
            icon_bg_hover_color: '',
            content_bg_color: '999999',
            alignment: 'left',
            position: 'fixed',
            icon_width: '',
            icon_height: '',
            offset_top: '',
            offset_side: '',
            content_width: '',
            content_padding: '',
            content: { },
            link: {
                menu_type: 'custom',
                url: ''
            },
            new_window: '0',
			store_id: -1
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

    }]);

});
