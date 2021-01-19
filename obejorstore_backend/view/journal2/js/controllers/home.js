define(['./module', 'underscore', 'underscore.string'], function (module, _, _S) {

    module.filter('linkName', function () {
        var NAMES = {
            'Productlist'   : 'Product List',
            'All'           : 'Layout',
            'Form'          : 'Edit',
            'Category'      : 'Category Page',
            'Productlabels'   : 'Product Labels',
            'Productgrid'   : 'Product Grid',
            'Quickview'   : 'QuickView',
            'Headermenus'   : 'Header / Menus',
            'Moduleslider'   : 'Slider',
            'Modulecarousel'   : 'Carousel',
            'Modulecustomsections'   : 'Custom Sections',
            'Modulesuperfilter'   : 'Super Filter',
            'Modulecmsblocks'   : 'CMS Blocks',
            'Moduleheadlinerotator'   : 'Headline Rotator',
            'Moduleflyout'   : 'Flyout Menu',
            'Modulephotogallery'   : 'Photo Gallery',
            'Journalcheckout'   : 'Quick Checkout',
            'Productpage'   : 'Product Page',
            'Side column_menu'   : 'Flyout Menu',
            'Sidecolumn'   : 'Side Column',
            'Custom code'   : 'Custom Code',
            'Super filter'   : 'Super Filter',
            'Header notice'   : 'Header Notice',
            'Static banners'   : 'Banners',
            'Custom sections'   : 'Custom Sections',
            'Custom code'   : 'Custom Code',
            'Cms blocks'   : 'CMS Blocks',
            'Side category'   : 'Side Category',
            'Text rotator'   : 'Text Rotator',
            'Headline rotator'   : 'Headline Rotator',
            'Photo gallery'   : 'Photo Gallery',
            'Fullscreen slider'   : 'Fulscreen Slider',
            'Side blocks'   : 'Side Blocks',
            'Product tabs'   : 'Product Tabs',
            'Side products'   : 'Side Products',
            'Moduletextrotator'   : 'Text Rotator',
            'Slider'   : 'Revolution Slider',
            'Simple slider'   : 'Journal Slider',
            'Advanced grid'   : 'Advanced Grid'


        };

        return function (name) {
            var names = name.split('/');
            names.splice(0, 1);
            names = _.filter(names, function (name) {
                return !$.isNumeric(name) && name !== 'module';
            });
            names = _.map(names, function (name) {
                var temp = name.capitalize().replace('_', ' ');
                return NAMES[temp] || temp;
            });
            return names.join(' / ');
        };
    });

    module.controller('HomeController', function ($scope, Spinner, History, Rest) {

        $scope.history = History.get();

        Spinner.hide();

        $scope.upgrade = false;
        $scope.new_version = null;

        Rest.checkVersion().then(function (response) {
            if (response && response.upgrade) {
                $scope.upgrade = true;
                $scope.new_version = response.latest;
            }
        });

    });

});
