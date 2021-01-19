define(['./../module', 'underscore'], function (module, _) {

    module.factory('SliderFactory', function () {
        return {
            Slider: function () {
                return {
                    module_name: 'New Slider',
                    width: '',
                    height: '',
                    hidecaptionsonmobile: '0',
                    timer: 'bottom',
                    js_options: {
                        delay: 4000,
                        onHoverStop: 'off',
                        thumbWidth: 100,
                        thumbHeight: 75,
                        thumbAmount: 4,
                        hideThumbs: 1,
                        navigationType: 'bullet',
                        navigationArrows: 'solo',
                        navigationStyle: 'round',
                        navigationHAlign: 'center',
                        navigationVAlign: 'bottom',
                        navigationHOffset: '',
                        navigationVOffset: '20'
                    },
                    preload_images: '1',
                    background: {},
                    fullwidth: '0',
                    margin_top: '',
                    margin_bottom: '',
                    slides: [],
                    enable_on_phone: '1',
                    enable_on_tablet: '1',
                    enable_on_desktop: '1',
                    spinner: '0'
                };
            },
            Slide: function () {
                return {
                    is_open: true,
                    slide_name: '',
                    image: '',
                    thumb: '',
                    transition: 'fade',
                    slotamount: '',
                    masterspeed: 800,
                    delay: '',
                    captions: [],
                    status: 1,
                    sort_order: '',
                    link: {
                        menu_type: 'custom'
                    },
                    link_new_window: '0',
                    easing: 'easeInOutQuart'
                };
            },
            Caption: function () {
                return {
                    is_open: true,
                    caption_name: '',
                    type: 'image',
                    video_type: 'youtube',
                    video_yt_id: '',
                    video_vm_id: '',
                    video_path: '',
                    video_fullwidth: 0,
                    video_width: '',
                    video_height: '',
                    video_autoplay: 0,
                    video_autoplayonlyfirsttime: 0,
                    video_nextslideatend: 1,
                    video_volume: 1,
                    video_loop: 0,
                    text_font: {},
                    text_color: '',
                    text_bgcolor: '',
                    text_hover_color: '',
                    text_hover_bg_color: '',
                    text_border: {},
                    text_hover_border_color: '',
                    text_padding_top: '',
                    text_padding_right: '',
                    text_padding_bottom: '',
                    text_padding_left: '',
                    text_line_height: '',
                    text_align: 'center',
                    position: 'custom',
                    multilanguage_position: '0',
                    x: '',
                    y: '',
                    x_ml: {},
                    y_ml: {},
                    animation_in: 'fade',
                    animation_out: 'fadeout',
                    custom_in_transition_x: '',
                    custom_in_transition_y: '',
                    custom_in_scale_x: '',
                    custom_in_scale_y: '',
                    custom_in_rotation_x: '',
                    custom_in_rotation_y: '',
                    custom_in_rotation_z: '',
                    transformOriginXin: 'center',
                    transformOriginYin: 'center',
                    custom_in_transform_perspective: '500',
                    custom_in_opacity: '1',
                    custom_out_transition_x: '',
                    custom_out_transition_y: '',
                    custom_out_scale_x: '',
                    custom_out_scale_y: '',
                    custom_out_rotation_x: '',
                    custom_out_rotation_y: '',
                    custom_out_rotation_z: '',
                    transformOriginXout: 'center',
                    transformOriginYout: 'center',
                    custom_out_transform_perspective: '500',
                    custom_out_opacity: '1',
                    speed: '',
                    start: '',
                    endspeed: '',
                    end: '',
                    status: 1,
                    sort_order: '',
                    link: {
                        menu_type: 'custom'
                    },
                    link_new_window: '0',
                    easing: 'easeInOutQuart',
                    endeasing: 'easeInOutQuart',
                    shadow: {},
                    shadow_hover: {},
                    shadow_active: {},
                    border: {},
                    bg_image: {}
                };
            },
            Transitions: function () {
                return [
                    {
                        type: 'Flat Transitions',
                        transitions: [
                            { name: 'Slide To Top', id: 'slideup' },
                            { name: 'Slide To Bottom', id: 'slidedown' },
                            { name: 'Slide To Right', id: 'slideright' },
                            { name: 'Slide To Left', id: 'slideleft' },
                            { name: 'Slide Horizontal (depending on Next/Previous)', id: 'slidehorizontal' },
                            { name: 'Slide Vertical (depending on Next/Previous)', id: 'slidevertical' },
                            { name: 'Slide Boxes', id: 'boxslide' },
                            { name: 'Slide Slots Horizontal', id: 'slotslide-horizontal' },
                            { name: 'Slide Slots Vertical', id: 'slotslide-vertical' },
                            { name: 'Fade Boxes', id: 'boxfade' },
                            { name: 'Fade Slots Horizontal', id: 'slotfade-horizontal' },
                            { name: 'Fade Slots Vertical', id: 'slotfade-vertical' },
                            { name: 'Fade and Slide from Right', id: 'fadefromright' },
                            { name: 'Fade and Slide from Left', id: 'fadefromleft' },
                            { name: 'Fade and Slide from Top', id: 'fadefromtop' },
                            { name: 'Fade and Slide from Bottom', id: 'fadefrombottom' },
                            { name: 'Fade To Left and Fade From Right', id: 'fadetoleftfadefromright' },
                            { name: 'Fade To Right and Fade From Left', id: 'fadetorightfadefromleft' },
                            { name: 'Fade To Top and Fade From Bottom', id: 'fadetotopfadefrombottom' },
                            { name: 'Fade To Bottom and Fade From Top', id: 'fadetobottomfadefromtop' },
                            { name: 'Parallax to Right', id: 'parallaxtoright' },
                            { name: 'Parallax to Left', id: 'parallaxtoleft' },
                            { name: 'Parallax to Top', id: 'parallaxtotop' },
                            { name: 'Parallax to Bottom', id: 'parallaxtobottom' },
                            { name: 'Zoom Out and Fade From Right', id: 'scaledownfromright' },
                            { name: 'Zoom Out and Fade From Left', id: 'scaledownfromleft' },
                            { name: 'Zoom Out and Fade From Top', id: 'scaledownfromtop' },
                            { name: 'Zoom Out and Fade From Bottom', id: 'scaledownfrombottom' },
                            { name: 'ZoomOut', id: 'zoomout' },
                            { name: 'ZoomIn', id: 'zoomin' },
                            { name: 'Zoom Slots Horizontal', id: 'slotzoom-horizontal' },
                            { name: 'Zoom Slots Vertical', id: 'slotzoom-vertical' },
                            { name: 'Fade', id: 'fade' },
                            { name: 'Random Flat', id: 'random-static' },
                            { name: 'Random Flat and Premium', id: 'random' }
                        ]
                    },
                    {
                        type: 'Premium Transitions',
                        transitions: [
                            { name: 'Curtain from Left', id: 'curtain-1' },
                            { name: 'Curtain from Right', id: 'curtain-2' },
                            { name: 'Curtain from Middle', id: 'curtain-3' },
                            { name: '3D Curtain Horizontal', id: '3dcurtain-horizontal' },
                            { name: '3D Curtain Vertical', id: '3dcurtain-vertical' },
                            { name: 'Cube Vertical', id: 'cube' },
                            { name: 'Cube Horizontal', id: 'cube-horizontal' },
                            { name: 'In Cube Vertical', id: 'incube' },
                            { name: 'In Cube Horizontal', id: 'incube-horizontal' },
                            { name: 'TurnOff Horizontal', id: 'turnoff' },
                            { name: 'TurnOff Vertical', id: 'turnoff-vertical' },
                            { name: 'Paper Cut', id: 'papercut' },
                            { name: 'Fly In', id: 'flyin' },
                            { name: 'Random Premium', id: 'random-premium' },
                            { name: 'Random Flat and Premium', id: 'random' }
                        ]
                    }
                ];
            },
            Easings: function () {
                return [
                    'Linear.easeNone', 'easeInQuad', 'easeOutQuad', 'easeInOutQuad', 'easeInCubic', 'easeOutCubic', 'easeInOutCubic', 'easeInQuart', 'easeOutQuart', 'easeInOutQuart', 'easeInQuint', 'easeOutQuint', 'easeInOutQuint', 'easeInSine', 'easeOutSine', 'easeInOutSine', 'easeInExpo', 'easeOutExpo', 'easeInOutExpo', 'easeInCirc', 'easeOutCirc', 'easeInOutCirc', 'easeInElastic', 'easeOutElastic', 'easeInOutElastic', 'easeInBack', 'easeOutBack', 'easeInOutBack', 'easeInBounce', 'easeOutBounce', 'easeInOutBounce'
                ];
            },
            IncomingCaptionAnimations: function () {
                return [
                    { id: 'sft', name: 'Short from Top' },
                    { id: 'sfb', name: 'Short from Bottom' },
                    { id: 'sfr', name: 'Short from Right' },
                    { id: 'sfl', name: 'Short from Left' },
                    { id: 'lft', name: 'Long from Top' },
                    { id: 'lfb', name: 'Long from Bottom' },
                    { id: 'lfr', name: 'Long from Right' },
                    { id: 'lfl', name: 'Long from Left' },
                    { id: 'skewfromleft', name: 'Skew from Left' },
                    { id: 'skewfromright', name: 'Skew from Right' },
                    { id: 'skewfromleftshort', name: 'Skew Short from Left' },
                    { id: 'skewfromrightshort', name: 'Skew Short from Right' },
                    { id: 'fade', name: 'Fading' },
                    { id: 'randomrotate', name: 'Fade in, Rotate from a Random position and Degree' },
                    { id: 'customin', name: 'Custom' }
                ];
            },
            OutgoingCaptionAnimations: function () {
                return [
                    { id: 'stt', name: 'Short to Top' },
                    { id: 'stb', name: 'Short to Bottom' },
                    { id: 'str', name: 'Short to Right' },
                    { id: 'stl', name: 'Short to Left' },
                    { id: 'ltt', name: 'Long to Top' },
                    { id: 'ltb', name: 'Long to Bottom' },
                    { id: 'ltr', name: 'Long to Right' },
                    { id: 'ltl', name: 'Long to Left' },
                    { id: 'skewtoleft', name: 'Skew to Left' },
                    { id: 'skewtoright', name: 'Skew to Right' },
                    { id: 'skewtoleftshort', name: 'Skew Short to Left' },
                    { id: 'skewtorightshort', name: 'Skew Short to Right' },
                    { id: 'fadeout', name: 'Fading' },
                    { id: 'randomrotateout', name: 'Fade in, Rotate from a Random position and Degree' },
                    { id: 'customout', name: 'Custom' }
                ];
            }
        };
    });

    module.controller('SliderFormController', ['$scope', '$routeParams', '$location', 'Rest', 'Spinner', 'SliderFactory', '$timeout', function ($scope, $routeParams, $location, Rest, Spinner, SliderFactory, $timeout) {
        /* opened modules */
        $scope.module_id = $routeParams.module_id || null;

        /* scope vars */
        $scope.module_type = 'slider';
        $scope.default_language = Journal2Config.languages.default;
        $scope.transitions = new SliderFactory.Transitions();
        $scope.easings = new SliderFactory.Easings();
        $scope.incoming_caption_animations = new SliderFactory.IncomingCaptionAnimations();
        $scope.outgoing_caption_animations = new SliderFactory.OutgoingCaptionAnimations();

        $scope.module_data = new SliderFactory.Slider();

        if ($scope.module_id) {
            Rest.getModule($scope.module_id).then(function (response) {
                $scope.module_data = _.extend($scope.module_data, response.module_data);
                $scope.module_data.slides = _.map($scope.module_data.slides, function (slide) {
                    var s = _.extend(new SliderFactory.Slide(), slide);
                    s.captions = _.map(s.captions, function (caption) {
                        return _.extend(new SliderFactory.Caption(), caption);
                    });
                    return s;
                });
                $timeout(function () {
                    Spinner.hide();
                }, 1);
            }, function (error) {
                Spinner.hide();
                console.error(error);
            });
        } else {
            $scope.module_data.general_is_open = true;
            $scope.module_data.navigation_is_open = true;
            Spinner.hide();
        }

        /* save data */
        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            if ($scope.module_id) {
                Rest.editModule($scope.module_id, $scope.module_data).then(function () {
                    Spinner.hide($src);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            } else {
                Rest.addModule($scope.module_type, $scope.module_data).then(function (response) {
                    $location.path('/module/' + $scope.module_type + '/form/' + response.module_id);
                    Spinner.hide($src);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            }
        };

        $scope.delete = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            if (!confirm('Delete module "' + $scope.module_data.module_name + '"?')) {
                Spinner.hide($src);
                return;
            }
            Rest.deleteModule($scope.module_id).then(function () {
                $location.path('/module/' + $scope.module_type + '/all');
                Spinner.hide($src);
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

        $scope.addSlide = function () {
            $scope.module_data.slides.push(new SliderFactory.Slide());
        };

        $scope.removeSlide = function ($index) {
            $scope.module_data.slides.splice($index, 1);
        };

        $scope.addCaption = function (slide) {
            slide.captions.push(new SliderFactory.Caption());
        };

        $scope.removeCaption = function (slide, $index) {
            slide.captions.splice($index, 1);
        };

        $scope.duplicateSlide = function (index) {
            $scope.module_data.slides.push(angular.copy($scope.module_data.slides[index]));
        };

        $scope.duplicateCaption = function (parent, index) {
            $scope.module_data.slides[parent].captions.push(angular.copy($scope.module_data.slides[parent].captions[index]));
        };

        $scope.toggleAccordion = function (items, value) {
            _.each(items, function (item) {
                item.is_open = value;
            });
            $scope.module_data.general_is_open = value;
            $scope.module_data.navigation_is_open = value;
            $scope.module_data.top_bottom_is_open = value;
            if (value) {
                $scope.module_data.close_others = false;
            }
        };

        $scope.toggleAccordion2 = function (slide, value) {
            _.each(slide.captions, function (item) {
                item.is_open = value;
            });
            if (value) {
                $scope.close_others = value;
            }
        };

    }]);

});