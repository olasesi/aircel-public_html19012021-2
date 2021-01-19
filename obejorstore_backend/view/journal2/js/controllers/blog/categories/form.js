define(['./../../module', 'underscore'], function (module, _) {

    module.controller('BlogCategoriesFormController', function ($scope, $routeParams, $location, $timeout, localStorageService, Spinner, Rest) {

        $scope.category_id = $routeParams.category_id || null;
        $scope.layouts = Journal2Config.layouts || [];
        $scope.stores = Journal2Config.stores || [];

        $scope.category_data = {
            layouts: { },
            stores: { }
        };

        if ($scope.category_id) {
            Rest.getBlog('category&category_id=' + $scope.category_id).then(function (response) {
                $scope.category_data = _.extend($scope.category_data, response);
                if (angular.isArray($scope.category_data.layouts)) {
                    $scope.category_data.layouts = { };
                }
                _.each(Journal2Config.stores, function (store) {
                    $scope.category_data.stores['s_' + store.store_id] = '0';
                });
                _.each(response.store_ids, function (store) {
                    $scope.category_data.stores['s_' + store] = '1';
                });
                Spinner.hide();
            }, function (error) {
                Spinner.hide();
                alert(error);
            });
        } else {
            _.each(Journal2Config.stores, function (store) {
                $scope.category_data.stores['s_' + store.store_id] = '1';
            });
            Spinner.hide();
        }

        /* save data */
        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            if ($scope.category_id) {
                Rest.postBlog('edit_category&category_id=' + $scope.category_id, $scope.category_data).then(function (response) {
                    localStorageService.set('blog_categories_accordion', $scope.accordion);
                    Spinner.hide($src);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            } else {
                Rest.postBlog('create_category', $scope.category_data).then(function (response) {
                    localStorageService.set('blog_categories_accordion', $scope.accordion);
                    $location.path('/blog/categories/form/' + response);
                    Spinner.hide($src);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            }
        };

        /* delete */
        $scope.delete = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            if (!confirm('Delete category?')) {
                Spinner.hide($src);
                return;
            }
            Rest.postBlog('delete_category&category_id=' + $scope.category_id).then(function (response) {
                $location.path('/blog/categories');
                Spinner.hide($src);
            }, function (error) {
                alert(error);
                Spinner.hide($src);
            });
        };

        $scope.accordion = {
            general_is_open: true,
            layouts_is_open: true,
            stores_is_open: true,
            close_others: false
        };

        $scope.accordion = _.extend($scope.accordion, localStorageService.get('blog_categories_accordion') || $scope.accordion);

        $scope.toggleAccordion = function (value) {
            $scope.accordion.general_is_open = value;
            $scope.accordion.layouts_is_open = value;
            $scope.accordion.stores_is_open = value;
            if (value) {
                $scope.accordion.close_others = false;
            }
        };

    });

});
