define(['./../../module', 'underscore'], function (module, _) {

    module.controller('BlogModuleSidePostsFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', function ($scope, $routeParams, $location, Rest, Spinner) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'blog_side_posts';
        $scope.default_language = Journal2Config.languages.default;
        $scope.posts = [];

        $scope.module_data = {
            general_is_open: true,
            close_others: false,
            module_name: 'New Module',
            module_type: 'newest',
            posts: [],
            limit: 5
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