define(['./module'], function(module){

    module.directive('imageSelect', function(){
        return {
            replace: true,
            restrict: 'E',
            scope: {
                image: '=image'
            },
            templateUrl: 'view/journal2/tpl/directives/image-select.html?ver=' + Journal2Config.version,
            controller: function($scope) {
                $scope.selectImage = function() {
                    if (Journal2Config['oc2'] || Journal2Config['oc3']) {
                        $('#modal-image').remove();

                        $.ajax({
                            url: 'index.php?route=common/filemanager&' + (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token + '&target=' + $scope.fieldId + '&thumb=' + 'thumb-' + $scope.fieldId,
                            dataType: 'html',
                            beforeSend: function() {
                                $('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
                                $('#button-image').prop('disabled', true);
                            },
                            complete: function() {
                                $('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
                                $('#button-image').prop('disabled', false);
                            },
                            success: function(html) {
                                $('body').append('<div id="modal-image" class="modal">' + html + '</div>');

                                $('#modal-image').modal('show');
                            }
                        });

                        $(document).delegate('a.thumbnail', 'click', function () {
                            $scope.image = $('#' + $scope.fieldId).val();
                            $scope.$apply();
                        });
                    } else {
                        $('#dialog').remove();

                        $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=' + Journal2Config.token + '&field=' + $scope.fieldId + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

                        $('#dialog').dialog({
                            title: 'image manager',
                            bgiframe: false,
                            width: typeof Journal2ImageManagerWidth === 'undefined' ? 700 : Journal2ImageManagerWidth,
                            height: typeof Journal2ImageManagerHeight === 'undefined' ? 400 : Journal2ImageManagerHeight,
                            resizable: false,
                            modal: false,
                            close: function() {
                                var val = $('#' + $scope.fieldId).val();
                                if(val) {
                                    $scope.image = val;
                                    $scope.$apply();
                                }
                            }
                        });
                    }
                };

                $scope.getImgUrl = function() {
                    return Journal2Config.img_folder + ($scope.image ? $scope.image : 'data/journal2/no_image.jpg');
                };

                $scope.clearImage = function() {
                    $scope.image = '';
                };
            },
            link: function(scope, elem) {
                scope.fieldId = _.uniqueId('img-upload-');
                elem.find('input[type="hidden"]').attr('id', scope.fieldId);
                elem.find('a').first().attr('id', 'thumb-' + scope.fieldId);
            }
        };
    });

});

