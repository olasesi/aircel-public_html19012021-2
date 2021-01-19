define(['./module'], function (module) {
    module
        .directive('ckEditor', [function () {
            return {
                replace: true,
                restrict: 'E',
                scope: {
                    ngModel: '=ngModel'
                },
                templateUrl: 'view/journal2/tpl/directives/ckeditor.html?ver=' + Journal2Config.version,
                link: function ($scope) {
                    $scope.languages = Journal2Config.languages;
                    $scope.$watch('ngModel', function (val) {
                        $scope.ngModel = val || {};
                    });
                }
            };
        }])
        .directive('ckEditorText', function ($timeout) {
            return {
                require: '?ngModel',
                link: function ($scope, $element, $attrs, $model) {
                    var ck = CKEDITOR.replace($element[0], {
                        filebrowserBrowseUrl: 'index.php?route=common/filemanager&' + (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token,
                        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&' + (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token,
                        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&' + (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token,
                        filebrowserUploadUrl: 'index.php?route=common/filemanager&' + (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token,
                        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&' + (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token,
                        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&' + (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token
                    });
                    function updateModel() {
                        $scope.$apply(function () {
                            $model.$setViewValue(ck.getData());
                        });
                    }

                    ck.on('imageDone', updateModel);
                    ck.on('change', updateModel);
                    ck.on('key', updateModel);
                    ck.on('pasteState', updateModel);

                    $scope.$watch('ngModel', function (val) {
                        $timeout(function () {
                            if ($model.$viewValue !== undefined) {
                                ck.setData($model.$viewValue);
                            }
                        }, 10);
                    });

                }
            };
        });
});
