define(['./module'], function(module){
    module.factory('Rest', ['Ajax', 'Url', '$q', function(Ajax, Url, $q){
        return {
            getLayouts: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/modules/layouts', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getLanguages: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/modules/languages', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getTopCategories: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/catalog/top_categories', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getFeaturedModules: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/catalog/get_featured', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getAllModules: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/modules/all', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getMultiModules: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/modules/multi_modules', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getModules: function(module_type) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/modules/all', 'module_type=' + module_type, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getModule: function(module_id) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/modules/get', 'module_id=' + module_id, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            addModule: function(module_type, module_data) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/modules/add', 'module_type=' + module_type, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token), {'module_data' : module_data});
            },
            editModule: function(module_id, module_data) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/modules/edit', 'module_id=' + module_id, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token), {'module_data' : module_data});
            },
            deleteModule: function(module_id) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/modules/remove', 'module_id=' + module_id, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            duplicateModule: function(module_id) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/modules/duplicate', 'module_id=' + module_id, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getModulePlacement: function(module_type) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/modules/load', 'module_type=' + module_type, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            saveModulePlacement: function(module_type, module_data) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/modules/save', 'module_type=' + module_type, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token), {'module_data' : module_data});
            },
            findProducts: function(filter_name) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/catalog/products', 'filter_name=' + filter_name, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            findCategories: function(filter_name) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/catalog/categories', 'filter_name=' + filter_name, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            findManufacturers: function(filter_name) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/catalog/manufacturers', 'filter_name=' + filter_name, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            findInformation: function(filter_name) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/catalog/information', 'filter_name=' + filter_name, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getTransitions: function() {
                return Ajax.get(Url.generateLink('view/journal2/tpl/slider2/transitions.json'));
            },
            getFonts: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/fonts/get', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getIcons: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/fonts/icons', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            loadSettings: function(category, theme_id) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/settings/load', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token, 'category=' + category, 'theme_id=' + theme_id));
            },
            loadDefaultSettings: function(category, theme_id) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/settings/load_default', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token, 'category=' + category, 'theme_id=' + theme_id));
            },
            getSiteWidth: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/settings/get_Site_width', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            saveSettings: function(settings, category, theme_id) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/settings/save', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token, 'category=' + category, 'theme_id=' + theme_id), {settings: settings});
            },
            saveSettingsAs: function(name, settings, category, theme_id) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/settings/save_as', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token, 'category=' + category, 'theme_id=' + theme_id), {settings: settings, name: name});
            },
            getSkins: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/settings/get_skins', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            deleteSkin: function(theme_id) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/settings/delete_skin', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token, 'theme_id=' + theme_id));
            },
            export: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/settings/export', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getSetting: function(key, store_id) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/settings/get', 'key=' + key, 'store_id=' + store_id, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            setSetting: function(key, store_id, value) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/settings/set', 'key=' + key, 'store_id=' + store_id, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token), {value : value});
            },
            getFilters: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/catalog/filters', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            clearCache: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/cache/clear_all', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            checkVersion: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/check_version', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getImageOptimisationStatus: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/image_optimisation/status', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getTableIndexesStatus: function() {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/optimisations/indexes', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            addTableIndexes: function() {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/optimisations/add_indexes', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token));
            },
            getSubscribers: function (data) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/newsletter/subscribers', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token), data)
            },
            unsubscribe: function (data) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/newsletter/unsubscribe', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token), data)
            },
            verifyCode: function(data) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/data/verify_code', (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token), data);
            },
            getBlog: function (url, data) {
                return Ajax.get(Url.generateLink('index.php?route=module/journal2/rest/blog/' + url, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token), data);
            },
            postBlog: function (url, data) {
                return Ajax.post(Url.generateLink('index.php?route=module/journal2/rest/blog/' + url, (Journal2Config.oc3 ? 'user_token=' : 'token=') + Journal2Config.token), data);
            },
            all: function(obj, success, error) {
                var promises = [];
                var response = {};

                angular.forEach(obj, function(o, i) {
                    promises.push(o.then(function(r){
                        response[i] = r;
                    }, function(e){
                        error(e);
                    }));
                });

                $q.all(promises).then(function(){
                    success(response);
                }, function(e){
                    error(e);
                });
            }
        };
    }]);

});
