String.prototype.capitalize = function () {
    return this.charAt(0).toUpperCase() + this.slice(1);
};

require.config({
    paths: {
        'angular'           : '../lib/angular/angular.min',
        'angular-route'     : '../lib/angular/angular-route.min',
        'angular-ls'        : '../lib/angular/angular-local-storage',
        'angular-table'     : '../lib/angular-table/ng-table.min',
        'underscore'        : '../lib/underscore/underscore.min',
        'underscore.string' : '../lib/underscore/underscore-string.min',
        'idTabs'            : '../lib/idTabs/jquery.idTabs',
        'angular-strap'     : '../lib/angular-strap/angular-strap.min',
        'select2'           : '../lib/select2/select2.min',
        'angular-select2'   : '../lib/select2/select2-directive',
        'angular-bootstrap' : '../lib/ui.bootstrap/ui-bootstrap-tpls-0.6.0.min',
        'spin'              : '../lib/spin.js/spin.min',
        'simple-slider'     : '../lib/simple-slider/js/simple-slider'
    },
    shim: {
        'angular': {
            exports: 'angular'
        },
        'angular-route': {
            deps: ['angular']
        },
        'angular-ls': {
            deps: ['angular']
        },
        'angular-strap': {
            deps: ['angular']
        },
        'angular-table': {
            deps: ['angular']
        },
        'underscore': {
            exports: '_'
        },
        'underscore.string': {
            deps: ['underscore']
        },
        'idTabs': {
            exports: 'jQuery.fn.idTabs'
        },
        'angular-select2': {
            deps: ['angular', 'select2']
        },
        'angular-bootstrap': {
            deps: ['angular']
        }
    },
    urlArgs: "ver=" + Journal2Config.version
});

require(['angular', 'app'], function (ng, app) {
    ng.element(document).ready(function () {

        ng.bootstrap(document, ['journal']);
    });
});