define(['./../../module', 'underscore'], function (module, _) {

    module.controller('BlogPostsAllController', function ($scope, $routeParams, $timeout, Spinner, Rest) {

        $scope.paginationTotalItems = 0;
        $scope.paginationCurrentPage = 1;
        $scope.paginationItemsPerPage = Journal2Config.items_per_page;

        $scope.posts = [];

        var filter = function () {
            Spinner.show();
            Rest.getBlog('posts&start=' + $scope.paginationCurrentPage + '&limit=' + $scope.paginationItemsPerPage).then(function (response) {
                $scope.posts = response.posts;
                $scope.paginationTotalItems = response.total;
                Spinner.hide();
            }, function (error) {
                alert(error);
                Spinner.hide();
            });
        };

        filter();

        $scope.$watch('paginationCurrentPage', function (n, o) {
            if (n !== o) {
                filter();
            }
        });

    });

});
