define(['./../../module', 'underscore'], function (module, _) {

    module.controller('BlogCategoriesAllController', function ($scope, $routeParams, $timeout, Spinner, Rest) {

        $scope.paginationTotalItems = 0;
        $scope.paginationCurrentPage = 1;
        $scope.paginationItemsPerPage = Journal2Config.items_per_page;

        $scope.categories = [];

        var filter = function () {
            Spinner.show();
            Rest.getBlog('categories&start=' + $scope.paginationCurrentPage + '&limit=' + $scope.paginationItemsPerPage).then(function (response) {
                $scope.categories = response.categories;
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
