define(['./../../module', 'underscore'], function (module, _) {

    module.controller('BlogModulePostsFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'blog_posts';
        $scope.default_language = Journal2Config.languages.default;
        $scope.posts = [];

        $scope.module_data = {
            general_is_open: true,
            top_bottom_is_open: true,
            close_others: false,
            module_name: 'New Module',
            top_bottom_placement: 0,
            module_padding:'0',
            background: {},
            fullwidth: '0',
            margin_top: '',
            margin_bottom: '',
            module_type: 'newest',
            posts: [],
            display: 'grid',
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
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    }
                }
            },
            description: 1,
            description_limit: 150,
            limit: 5,
            content_align:'center',
            image_width: 250,
            image_height: 250,
            image_type: 'fit',
            carousel: 0,
            carousel_arrows: 'none',
            carousel_buttons: 1,
            autoplay: '0',
            pause_on_hover: '1',
            transition_speed: '400',
            transition_delay: '3000',
            enable_on_phone: '1',
            enable_on_tablet: '1',
            enable_on_desktop: '1'
        };

        Rest.getBlog('posts').then(function (response) {
            $scope.posts = response.posts;
        }, function (error) {
            alert(error);
        });

        /* get data */
        if ($scope.module_id) {
            Rest.getModule($scope.module_id).then(function (response) {
                $scope.module_data = _.extend($scope.module_data, response.module_data);
                Spinner.hide();
            }, function (error) {
                $scope.module_data.general_is_open = true;
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
            $scope.module_data.general_is_open = value;
            if (value) {
                $scope.module_data.close_others = false;
            }
        };

        $scope.addPost = function () {
            $scope.module_data.posts.push({});
        };

        $scope.removePost = function ($index) {
            $scope.module_data.posts.splice($index, 1);
        };

    }]);

});