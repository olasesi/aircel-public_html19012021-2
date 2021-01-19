define(['./../../module', 'underscore'], function (module, _) {

    module.controller('BlogCommentsFormController', function ($scope, $routeParams, $location, $timeout, localStorageService, Spinner, Rest) {

        $scope.comment_id = $routeParams.comment_id || null;

        $scope.comment_data = { };

        if ($scope.comment_id) {
            Rest.getBlog('comment&comment_id=' + $scope.comment_id).then(function (response) {
                $scope.comment_data = _.extend($scope.comment_data, response);
                Spinner.hide();
            }, function (error) {
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
            if ($scope.comment_id) {
                Rest.postBlog('edit_comment&comment_id=' + $scope.comment_id, $scope.comment_data).then(function (response) {
                    localStorageService.set('blog_comments_accordion', $scope.accordion);
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
            if (!confirm('Delete comment?')) {
                Spinner.hide($src);
                return;
            }
            Rest.postBlog('delete_comment&comment_id=' + $scope.comment_id).then(function (response) {
                console.log(response);
                $location.path('/blog/comments');
                Spinner.hide($src);
            }, function (error) {
                alert(error);
                Spinner.hide($src);
            });
        };

        $scope.accordion = {
            general_is_open: true,
            close_others: false
        };

        $scope.accordion = _.extend($scope.accordion, localStorageService.get('blog_comments_accordion') || $scope.accordion);

        $scope.toggleAccordion = function (value) {
            $scope.accordion.general_is_open = value;
            if (value) {
                $scope.accordion.close_others = false;
            }
        };

    });

});
