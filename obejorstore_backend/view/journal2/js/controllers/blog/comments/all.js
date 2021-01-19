define(['./../../module', 'underscore'], function (module, _) {

    module.controller('BlogCommentsAllController', function ($scope, $routeParams, $timeout, $location, Spinner, Rest) {

        $scope.paginationTotalItems = 0;
        $scope.paginationCurrentPage = 1;
        $scope.paginationItemsPerPage = Journal2Config.items_per_page;

        $scope.comments = [];
        $scope.posts = [];
        $scope.filter_post_id = -1;
        $scope.filter_status = -1;
        $scope.filter_type = -1;

        Rest.getBlog('posts').then(function (response) {
            $scope.posts = response.posts;
            $scope.filter = function () {
                $scope.paginationCurrentPage = 1;
                filter();
            };
        }, function (error) {
            alert(error);
            Spinner.hide();
        });

        var filter = function () {
            Spinner.show();
            Rest.getBlog('comments&post_id=' + $scope.filter_post_id + '&status=' + $scope.filter_status + '&type=' + $scope.filter_type + '&start=' + $scope.paginationCurrentPage + '&limit=' + $scope.paginationItemsPerPage).then(function (response) {
                $scope.comments = response.comments;
                $scope.paginationTotalItems = response.total;
                Spinner.hide();
            }, function (error) {
                alert(error);
                Spinner.hide();
            });
        };

        $scope.$watch('paginationCurrentPage', function (n, o) {
            if (n !== o) {
                filter();
            }
        });

    });

});
