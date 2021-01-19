define(['./module'], function (module) {
    module
        .directive('storePicker', ['$location', '$routeParams', function ($location, $routeParams) {
            return {
                replace: true,
                restrict: 'E',
                templateUrl: 'view/journal2/tpl/directives/store-picker.html?ver=' + Journal2Config.version,
                link: function ($scope, $element) {
                    $scope.stores = Journal2Config.stores;

                    $scope.store_id = $routeParams.store_id || Journal2Config.stores[0].store_id;

                    $scope.storeChange = function () {
                        $location.path($element.attr('data-url') + '/' + $scope.store_id);
                    };
                }
            };
        }]);
});
