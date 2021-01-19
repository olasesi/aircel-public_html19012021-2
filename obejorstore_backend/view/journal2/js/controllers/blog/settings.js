define(['./../module', 'underscore'], function (module, _) {

    module.controller('GeneralBlogSettingsController', function ($scope, $routeParams, $timeout, localStorageService, Spinner, Rest) {

        $scope.store_id = $routeParams.store_id || Journal2Config.stores[0].store_id;

        $scope.blog_settings = {
            status: '1',
            feed: '1',
            posts_per_row: {
                "range": "1,10",
                "step": "1",
                "value": {
                    "mobile": {
                        "value": "1",
                        "range": "1,10",
                        "step": "1"
                    },
                    "mobile1": {
                        "value": "2",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet1": {
                        "value": "2",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet2": {
                        "value": "1",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop": {
                        "value": "4",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop1": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop2": {
                        "value": "2",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop": {
                        "value": "5",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop1": {
                        "value": "4",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop2": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    }
                }
            },
            related_products: '1',
            related_products_per_row: {
                "range": "1,10",
                "step": "1",
                "value": {
                    "mobile": {
                        "value": "1",
                        "range": "1,10",
                        "step": "1"
                    },
                    "mobile1": {
                        "value": "2",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet1": {
                        "value": "2",
                        "range": "1,10",
                        "step": "1"
                    },
                    "tablet2": {
                        "value": "1",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop": {
                        "value": "4",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop1": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    },
                    "desktop2": {
                        "value": "2",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop": {
                        "value": "5",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop1": {
                        "value": "4",
                        "range": "1,10",
                        "step": "1"
                    },
                    "large_desktop2": {
                        "value": "3",
                        "range": "1,10",
                        "step": "1"
                    }
                }
            },
            posts_display: 'grid',
            posts_sort: 'newest',
            author_name: 'username',
            posts_limit: 15
        };

        $scope.isLoading = true;
        $timeout(function () {
            Rest.all({
                blog_settings: Rest.getSetting('blog_settings', $scope.store_id)
            }, function (response) {
                $scope.blog_settings = _.extend($scope.blog_settings, response.blog_settings || {});

                $timeout(function () {
                    $scope.isLoading = false;
                    Spinner.hide();
                }, 1);
            }, function (error) {
                alert(error);
            });
        }, 500);

        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.setSetting('blog_settings', $scope.store_id, $scope.blog_settings).then(function (response) {
                Spinner.hide($src);
                localStorageService.set('blog_settings_accordion', $scope.accordion);
            }, function (error) {
                Spinner.hide($src);
                alert(error);
            });
        };

        /* expand / collapse */
        $scope.accordion = {
            accordions: { },
            close_others: false
        };

        $scope.accordion = localStorageService.get('blog_settings_accordion') || $scope.accordion;

        $scope.toggleAccordion = function (value) {
            var $accordions = $('#main-accordion > div > .accordion-group');
            for (var i=0; i<$accordions.length; i++) {
                $scope.accordion.accordions[i] = value;
            }
            if (value) {
                $scope.accordion.close_others = false;
            }
        };

    });

});
