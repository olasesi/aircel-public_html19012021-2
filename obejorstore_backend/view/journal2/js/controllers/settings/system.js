define(['./../module', 'underscore', 'underscore.string'], function (module, _, _S) {

    module.controller('SystemSettingsController', function ($scope, $routeParams, $location, $timeout, localStorageService, Rest, Spinner) {

        $scope.settings = {
            developer_mode: 1,
            minify_html: 0,
            minify_css: 0,
            minify_js: 0,
            optimise_images: 0,
            simple_slider_cache: 0,
            slider_cache: 0,
            static_banners_cache: 0,
            carousel_cache: 0,
            custom_sections_cache: 0,
            cms_blocks_cache: 0,
            side_category_cache: 0,
            side_column_menu_cache: 0,
            text_rotator_cache: 0,
            headline_rotator_cache: 0,
            photo_gallery_cache: 0,
            side_blocks_cache: 0,
            fullscreen_slider_cache: 0,
            advanced_grid_cache: 0,
            carousel_grid_cache: 0,
            side_products_cache: 0,
			cache_by_cg_id: 0
        };

        $scope.table_columns = null;

        $scope.imageOptimisationInProgress = false;
        $scope.cachingStatus = {
            optimised: 0,
            total: 0,
            percent: 0
        };
        var cachingSource = null;

        $timeout(function () {
            Rest.all({
                settings: Rest.getSetting('system_settings', -1),
                caching_status: Rest.getImageOptimisationStatus()
            }, function (response) {
                $scope.cachingStatus = response.caching_status;
                $scope.settings =  _.extend($scope.settings, response.settings);
                $timeout(function () {
                    Spinner.hide();
                }, 1);
            }, function (error) {
                Spinner.hide();
                alert(error);
            });
        }, 500);

        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.setSetting('system_settings', -1, $scope.settings).then(function (response) {
                Spinner.hide($src);
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

        $scope.clearCache = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.clearCache().then(function (response) {
                Spinner.hide($src);
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

        $scope.startImageOptimisation = function (all) {
            if ($scope.imageOptimisationInProgress) {
                return;
            }
            $scope.imageOptimisationInProgress = true;

            if (all) {
                $timeout(function () {
                    $scope.cachingStatus.percent = 0;
                    $scope.cachingStatus.optimised = 0;
                }, 1);
            }

            cachingSource = new EventSource('index.php?route=module/journal2/rest/image_optimisation/process' + (all ? '&all=true' : '') + '&token=' + Journal2Config.token);

            cachingSource.addEventListener('message', function (e) {
                var response = $.parseJSON(e.data);

                console.log(response);

                if (response.percent) {
                    $timeout(function () {
                        $scope.cachingStatus.percent = response.percent;
                        $scope.cachingStatus.optimised = response.optimised;
                        $scope.cachingStatus.total = response.total;
                    }, 1);
                }

                if (response.status === 'terminated') {
                    $scope.stopImageOptimisation();
                }

                if (response.error) {
                    $scope.stopImageOptimisation();
                    alert(response.error);
                }
            }, false);

            cachingSource.addEventListener('error', function (e) {
                console.log(e);
                $scope.stopImageOptimisation();
            }, false);
        };

        $scope.getDatabaseIndexStatus = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.getTableIndexesStatus().then(function (response) {
                $scope.table_columns = response;
                Spinner.hide($src);
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

        $scope.addDatabaseIndexes = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.addTableIndexes().then(function (response) {
                $scope.table_columns = response;
                Spinner.hide($src);
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

        $scope.stopImageOptimisation = function () {
            if (!$scope.imageOptimisationInProgress) {
                return;
            }

            cachingSource.close();

            $timeout(function () {
                $scope.imageOptimisationInProgress = false;
            }, 1);
        };

        $scope.toggle_modules = function ($event, modules_cache) {
            $event.stopPropagation();
            _.each($scope.settings, function (v, k) {
                if (_S.endsWith(k, '_cache')) {
                    $scope.settings[k] = modules_cache;
                }
            });
        };

    });

});
