define(['./module', 'underscore'], function(module, _){

    module
        .factory('FontDefaults', function () {
            return {
                fonts: null,
                font_subsets: null,
                system: function () {
                    return {
                        font_type: 'none',
                        font_size: '',
                        font_size_mobile: '---',
                        font_family: 'Helvetica, Arial, sans-serif',
                        font_name: 'ABeeZee',
                        font_weight: '',
                        font_style: '',
                        font_subset: ['latin'],
                        letter_spacing: '',
                        text_transform: ''
                    };
                },
                google: function () {
                    return {
                        font_type: 'google',
                        font_size: '',
                        font_size_mobile: '---',
                        font_family: 'Helvetica, Arial, sans-serif',
                        font_name: 'ABeeZee',
                        font_weight: '',
                        font_style: '',
                        font_subset: ['latin'],
                        letter_spacing: '',
                        text_transform: ''
                    };
                }
            };
        })
        .filter('filterFonts', function() {
            return function (font, subsets) {
                if (!subsets || !subsets.length) return font;
                return _.filter(font, function(f){
                    return _.intersection(f.subsets, subsets).length > 0;
                });
            };
        })
        .directive('jOptFont', ['Rest', 'FontDefaults', 'Spinner', function(Rest, FontDefaults, Spinner) {
            return {
                replace: true,
                require: '?ngModel',
                scope: {
                    ngModel: '='
                },
                restrict: 'E',
                templateUrl: 'view/journal2/tpl/directives/j-opt-font.html?ver=' + Journal2Config.version,
                controller: ['$timeout', '$scope', '$modal', function($timeout, $scope, $modal) {
                    $scope.ngModel = $scope.ngModel || {};
                    if ($.isArray($scope.ngModel)) {
                        $scope.ngModel = {};
                    }
                    $scope.ngModel.value = $scope.ngModel.value || new FontDefaults.system();

                    $scope.edit = function() {
                        $modal.open({
                            templateUrl: 'view/journal2/tpl/directives/j-opt-font-editor.html?ver=' + Journal2Config.version,
                            resolve: {
                                ngModel: function() { return $scope.ngModel; },
                                fonts: function() { return $scope.fonts; },
                                font_subsets: function() { return $scope.font_subsets; }
                            },
                            controller: function($scope, ngModel, $modalInstance) {
                                ngModel = ngModel || {};
                                $scope.font = ngModel.value || new FontDefaults.system();

                                if ($scope.font.v !== '2') {
                                    if ($scope.font.font_type === 'none') {
                                        $scope.font.font_size = '---';
                                        $scope.font.font_style = '';
                                        $scope.font.font_weight = '';
                                        $scope.font.text_transform = '';
                                        $scope.font.letter_spacing = '';
                                    }
                                    $scope.font.v = '2';
                                }

                                if (!$scope.font.font_size_mobile) {
                                    $scope.font.font_size_mobile = '---';
                                }

                                $scope.fonts = [];
                                $scope.font_subsets = [];
                                if (FontDefaults.fonts !== null) {
                                    $scope.fonts = FontDefaults.fonts;
                                    $scope.font_subsets = FontDefaults.font_subsets;
                                } else {
                                    Rest.getFonts().then(function(fonts) {
                                        $scope.fonts = fonts;
                                        $scope.font_subsets = _
                                            .chain(fonts.google_fonts)
                                            .map(function (font) {
                                                return font.subsets;
                                            })
                                            .reduce(function (a, b) {
                                                return a.concat(b);
                                            })
                                            .uniq()
                                            .value();
                                        FontDefaults.fonts = $scope.fonts;
                                        FontDefaults.font_subsets = $scope.font_subsets;
                                        $scope.fontChanged($scope.font);
                                    });
                                }
                                // preview text
                                $scope.dummyText = 'The quick brown Fox jumps over the lazy Dog.';
                                $scope.isEditable = false;
                                $scope.editText = function() {
                                    $scope.isEditable = !$scope.isEditable;
                                };
                                $scope.getEditBtnText = function() {
                                    return $scope.isEditable ? "Save" : "Edit";
                                };

                                // generate collections
                                $scope.font_types = ['system', 'google'];

                                $scope.font_sizes = _.map(_.range(4, 400), function(e) { return e === 4 ? '---' : e + 'px'; });

                                // select2 matcher
                                $scope.matcher = function(term, text) {
                                    return text.toUpperCase().indexOf(term.toUpperCase()) === 0;
                                };

                                // modal actions
                                $scope.save = function() {
                                    $modalInstance.close($scope.font);
                                };

                                $scope.cancel = function() {
                                    $modalInstance.dismiss('cancel');
                                };

                                $scope.getStyle = function (font) {
                                    return font.font_style;
                                };

                                $scope.getWeight = function (font) {
                                    return font.font_type === 'google' ? font.font_weight.replace(/[\D]/g, '') : font.font_weight;
                                };

                                $scope.$watch('font.font_type', function () {
                                    $scope.fontChanged($scope.font);
                                });

                                $scope.fontChanged = function(font) {
                                    $scope.loading = false;
                                    Spinner.hide($('.font-preview'));
                                    if (font.font_type === 'google') {
                                        Spinner.show($('.font-preview'));
                                        if (!font.font_name) {
                                            font.font_name = 'ABeeZee';
                                        }
                                        if (!font.font_subset || font.font_subset.length === 0) {
                                            font.font_subset = ['latin'];
                                        }
                                        $scope.loading = true;
                                        $timeout(function () {
                                            $scope.loadFont(font);
                                        }, 350);
                                    }
                                    $scope.getFontWeights(font);
                                    if ($scope.font_weights && $scope.font_weights.length && _.indexOf($scope.font_weights, font.font_weight) === -1) {
                                        font.font_weight = $scope.font_weights[0];
                                    }
                                };

                                $scope.loadFont = function(font) {
                                    if (font.font_type !== 'google' || !font.font_name) return;
                                    WebFont.load({
                                        google: {
                                            families: [font.font_name]
                                        },
                                        active: function () {
                                            $scope.loading = false;
                                            Spinner.hide($('.font-preview'));
                                            $scope.$apply();
                                        }
                                    });
                                };

                                $scope.getFontWeights = function(font) {
                                    if (font.font_type === 'google') {
                                        _.each($scope.fonts.google_fonts, function(f){
                                            if (font.font_name === f.family) {
                                                $scope.font_weights = f.variants;
                                            }
                                        });
                                    } else {
                                        $scope.font_weights = ['', 'normal', 'bold'];
                                    }
                                };

                                $scope.loadFont($scope.font);
                                $scope.getFontWeights($scope.font);

                                $scope.reset = function() {
                                    $scope.font = {
                                        "font_weight": "",
                                        "font_type": "none",
                                        "font_size": "---",
                                        "font_size_mobile": "---",
                                        "text_transform": "",
                                        "font_style": ""
                                    };
                                };

                            }
                        }).result.then(function(font){
                            $scope.ngModel = $scope.ngModel || {};
                            $scope.ngModel.value = font;
                        });
                    };
                }]
            };
        }]);
});