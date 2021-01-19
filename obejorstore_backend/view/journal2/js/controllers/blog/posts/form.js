define(['./../../module', 'underscore'], function (module, _) {

    module.controller('BlogPostsFormController', function ($scope, $routeParams, $location, $timeout, localStorageService, Spinner, Rest) {

        $scope.post_id = $routeParams.post_id || null;
        $scope.layouts = Journal2Config.layouts || [];
        $scope.stores = Journal2Config.stores || [];

        $scope.post_data = {
            status: "1",
            layouts: { },
            stores: { },
            author_id: Journal2Config.user_id,
            comments: 2
        };

        $scope.categories = [];
        $scope.authors = [];

        Rest.getBlog('categories').then(function (response) {
            $scope.categories = response.categories;
        }, function (error) {
            alert(error);
        });

        Rest.getBlog('authors').then(function (response) {
            $scope.authors = response;
        }, function (error) {
            alert(error);
        });

        if ($scope.post_id) {
            Rest.getBlog('post&post_id=' + $scope.post_id).then(function (response) {
                $scope.post_data = _.extend($scope.post_data, response);
                if (angular.isArray($scope.post_data.layouts)) {
                    $scope.post_data.layouts = { };
                }
                _.each(Journal2Config.stores, function (store) {
                    $scope.post_data.stores['s_' + store.store_id] = '0';
                });
                _.each(response.store_ids, function (store) {
                    $scope.post_data.stores['s_' + store] = '1';
                });
                Spinner.hide();
            }, function (error) {
                Spinner.hide();
                alert(error);
            });
        } else {
            _.each(Journal2Config.stores, function (store) {
                $scope.post_data.stores['s_' + store.store_id] = '1';
            });
            Spinner.hide();
        }

        /* save data */
        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            if ($scope.post_id) {
                Rest.postBlog('edit_post&post_id=' + $scope.post_id, $scope.post_data).then(function (response) {
                    localStorageService.set('blog_posts_accordion', $scope.accordion);
                    Spinner.hide($src);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            } else {
                Rest.postBlog('create_post', $scope.post_data).then(function (response) {
                    localStorageService.set('blog_posts_accordion', $scope.accordion);
                    $location.path('/blog/posts/form/' + response);
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
            if (!confirm('Delete post?')) {
                Spinner.hide($src);
                return;
            }
            Rest.postBlog('delete_post&post_id=' + $scope.post_id).then(function (response) {
                console.log(response);
                $location.path('/blog/posts');
                Spinner.hide($src);
            }, function (error) {
                alert(error);
                Spinner.hide($src);
            });
        };

        $scope.accordion = {
            general_is_open: true,
            details_is_open: true,
            data_is_open: true,
            links_is_open: true,
            layouts_is_open: true,
            stores_is_open: true,
            close_others: false
        };

        $scope.accordion = _.extend($scope.accordion, localStorageService.get('blog_posts_accordion') || $scope.accordion);

        $scope.toggleAccordion = function (value) {
            $scope.accordion.general_is_open = value;
            $scope.accordion.details_is_open = value;
            $scope.accordion.data_is_open = value;
            $scope.accordion.links_is_open = value;
            $scope.accordion.layouts_is_open = value;
            $scope.accordion.stores_is_open = value;
            if (value) {
                $scope.accordion.close_others = false;
            }
        };

        /* add category */
        $scope.addCategory = function () {
            $scope.post_data.categories = $scope.post_data.categories || [];
            $scope.post_data.categories.push({});
        };

        /* remove category */
        $scope.removeCategory = function ($index) {
            $scope.post_data.categories.splice($index, 1);
        };

        /* add product */
        $scope.addProduct = function () {
            $scope.post_data.products = $scope.post_data.products || [];
            $scope.post_data.products.push({});
        };

        /* remove product */
        $scope.removeProduct = function ($index) {
            $scope.post_data.products.splice($index, 1);
        };


    });

});
