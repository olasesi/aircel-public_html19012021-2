define(['./module'], function(module){

    module.directive('imageSelectLang', function(){
        return {
            replace: true,
            restrict: 'E',
            scope: {
                ngModel: '=image'
            },
            templateUrl: 'view/journal2/tpl/directives/image-select-lang.html?ver=' + Journal2Config.version,
            controller: function($scope) {
                $scope.languages = Journal2Config.languages;
            },
            link: function($scope) {
                $scope.$watch('ngModel', function (val) {
                    if (Object.prototype.toString.call(val) !== '[object Object]') {
                        $scope.ngModel = {};
                        _.each (Journal2Config.languages.languages, function (language) {
                            $scope.ngModel[language.language_id] = val;
                        });
                    } else {
                        $scope.ngModel = val;
                    }
                });
            }
        };
    });

});

