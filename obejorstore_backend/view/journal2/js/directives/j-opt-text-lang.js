define(['./module'], function(module){

    module.directive('jOptTextLang', [function() {
        return {
            replace: true,
            require: '?ngModel',
            scope: {
                ngModel: '='
            },
            restrict: 'E',
            templateUrl: 'view/journal2/tpl/directives/j-opt-text-lang.html?ver=' + Journal2Config.version,
            link: function($scope) {
                $scope.languages = Journal2Config.languages;
                $scope.ngModel = $scope.ngModel || {};
                $scope.ngModel.value = $scope.ngModel.value || {};
                _.each($scope.languages.languages, function(language) {
                    $scope.ngModel.value[language.language_id] = $scope.ngModel.value[language.language_id] || '';
                });
                $scope.reset = function() {
                    _.each($scope.languages.languages, function(language) {
                        $scope.ngModel.value[language.language_id] = $scope.ngModel.default;
                    });
                };
                $scope.$watch('ngModel', function () {
                    $scope.ngModel = $scope.ngModel || {};
                    $scope.ngModel.value = $scope.ngModel.value || {};
                });
            }
        };
    }]);

});