define(['./module', 'spin'], function (module, Spinner) {

    module.factory('Spinner', [function () {
        var opts = {
            lines: 11, // The number of lines to draw
            length: 5, // The length of each line
            width: 2, // The line thickness
            radius: 5, // The radius of the inner circle
            corners: 1, // Corner roundness (0..1)
            rotate: 0, // The rotation offset
            direction: 1, // 1: clockwise, -1: counterclockwise
            color: '#000', // #rgb or #rrggbb or array of colors
            speed: 1, // Rounds per second
            trail: 39, // Afterglow percentage
            shadow: false, // Whether to render a shadow
            hwaccel: false, // Whether to use hardware acceleration
            className: 'spinner', // The CSS class to assign to the spinner
            zIndex: 2e9, // The z-index (defaults to 2000000000)
            top: 'auto', // Top position relative to parent in px
            left: 'auto' // Left position relative to parent in px
        };
        var spinner = null;
        return {
            show: function ($element) {
                spinner = spinner || new Spinner(opts);
                if ($element) {
                    $element.addClass('loading');
                    spinner.spin($element[0]);
                } else {
                    var $loader = $('.journal-loading');
                    $loader.show();
                    spinner.spin($loader[0]);
                }
            },
            hide: function ($element) {
                if ($element) {
                    $element.removeClass('loading');
                } else {
                    $('.journal-loading').hide();
                }
                spinner.stop();
            }
        };
    }]);

});
