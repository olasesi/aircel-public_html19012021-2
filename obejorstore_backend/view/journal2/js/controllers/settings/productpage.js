define(['./../module', 'underscore'], function (module, _) {

    module.controller('ProductPageSettingsController', function ($scope, $routeParams, $location, localStorageService, Rest, Spinner, SkinManager) {

        $scope.skin_id = $routeParams.skin_id;
        $scope.category = 'productpage';
        $scope.settings = { };

        if (!$scope.skin_id) {
            $location.path('settings/' + $scope.category + '/' + SkinManager.getActiveSkin());
        } else {
            Rest.loadSettings($scope.category, $scope.skin_id).then(function (settings) {
                if (!_.isArray(settings)) {
                    $scope.settings = settings;
                }
                Spinner.hide();
            }, function (error) {
                alert(error);
                Spinner.hide();
            });
        }

        $scope.save = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            var promises = {
                settings: Rest.saveSettings($scope.settings, $scope.category, $scope.skin_id)
            };

//            if (Journal2Config.stores.length <= 1) {
//                promises.config = Rest.setSetting('active_skin', 0, $scope.skin_id);
//            }
            Rest.all(promises, function (response) {
                Spinner.hide($src);
                localStorageService.set('setting_' + $scope.category + '_accordion', $scope.accordion);
            }, function (error) {
                alert(error);
                Spinner.hide($src);
            });
        };

        $scope.saveAs = function ($event) {
            var skinName = prompt('Enter skin\'s name:');
            if (skinName !== null) {
                var $src = $($event.target || $event.srcElement);
                Spinner.show($src);
                Rest.saveSettingsAs(skinName, $scope.settings, $scope.category, $scope.skin_id).then(function (response) {
                    Spinner.hide($src);
                    $location.path('settings/' + $scope.category + '/' + response);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            }
        };

        $scope.saveDefault = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.saveSettings($scope.settings, $scope.category, $scope.skin_id).then(function (response) {
                Rest.export().then(function (response) {
                    Spinner.hide($src);
                }, function (error) {
                    alert(error);
                    Spinner.hide($src);
                });
            }, function (error) {
                alert(error);
                Spinner.hide($src);
            });

        };

        $scope.reset = function ($event) {
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.loadDefaultSettings($scope.category, $scope.skin_id).then(function (settings) {
                if (!_.isArray(settings)) {
                    $scope.settings = settings;
                } else {
                    $scope.settings = { };
                }
                Spinner.hide();
            }, function (error) {
                alert(error);
                Spinner.hide();
            });
        };

        $scope.delete = function ($event) {
            if (!confirm('Are you sure?')) {
                return;
            }
            var $src = $($event.target || $event.srcElement);
            Spinner.show($src);
            Rest.deleteSkin($scope.skin_id).then(function (settings) {
                Journal2Config.active_skin = 1;
                $location.path('settings/' + $scope.category + '/1');
                Spinner.hide();
            }, function (error) {
                alert(error);
                Spinner.hide();
            });
        };

        $scope.addButton = function () {
            $scope.settings.share_buttons = $scope.settings.share_buttons || [];
            $scope.settings.share_buttons.push({
                id: 'st_li_sharethis'
            });
        };

        $scope.removeButton = function ($index) {
            $scope.settings.share_buttons.splice($index, 1);
        };

        /* expand / collapse */
        $scope.accordion = {
            accordions: { },
            close_others: false
        };

        $scope.accordion = localStorageService.get('setting_' + $scope.category + '_accordion') || $scope.accordion;

        $scope.toggleAccordion = function (value) {
            var $accordions = $('#main-accordion > div > .accordion-group');
            for (var i=0; i<$accordions.length; i++) {
                $scope.accordion.accordions[i] = value;
            }
            if (value) {
                $scope.accordion.close_others = false;
            }
        };

        $scope.shareThisSelect = {
            formatResult: function format(data) {
                return '<img src="' + $(data.element).attr('data-img') + '" />' + data.text;
            }
        };

        $scope.shareThisButtons = {
            "st_li_email": {
                "id": "st_li_email",
                "name": "Email",
                "img": "https://ws.sharethis.com/images/email_32.png"
            },
            "st_li_pinterest": {
                "id": "st_li_pinterest",
                "name": "Pinterest",
                "img": "https://ws.sharethis.com/images/pinterest_32.png"
            },
            "st_li_linkedin": {
                "id": "st_li_linkedin",
                "name": "LinkedIn",
                "img": "https://ws.sharethis.com/images/linkedin_32.png"
            },
            "st_li_twitter": {
                "id": "st_li_twitter",
                "name": "Twitter",
                "img": "https://ws.sharethis.com/images/twitter_32.png"
            },
            "st_li_facebook": {
                "id": "st_li_facebook",
                "name": "Facebook",
                "img": "https://ws.sharethis.com/images/facebook_32.png"
            },
            "st_li_sharethis": {
                "id": "st_li_sharethis",
                "name": "ShareThis",
                "img": "https://ws.sharethis.com/images/sharethis_32.png"
            },
            "st_li_googleplus": {
                "id": "st_li_googleplus",
                "name": "Google +",
                "img": "https://ws.sharethis.com/images/googleplus_32.png"
            },
            "st_li_adfty": {
                "id": "st_li_adfty",
                "name": "Adfty",
                "img": "https://ws.sharethis.com/images/adfty_32.png"
            },
            "st_li_allvoices": {
                "id": "st_li_allvoices",
                "name": "Allvoices",
                "img": "https://ws.sharethis.com/images/allvoices_32.png"
            },
            "st_li_amazon_wishlist": {
                "id": "st_li_amazon_wishlist",
                "name": "Amazon Wishlist",
                "img": "https://ws.sharethis.com/images/amazon_wishlist_32.png"
            },
            "st_li_arto": {
                "id": "st_li_arto",
                "name": "Arto",
                "img": "https://ws.sharethis.com/images/arto_32.png"
            },
            "st_li_att": {
                "id": "st_li_att",
                "name": "AT&amp;T",
                "img": "https://ws.sharethis.com/images/att_32.png"
            },
            "st_li_baidu": {
                "id": "st_li_baidu",
                "name": "Baidu",
                "img": "https://ws.sharethis.com/images/baidu_32.png"
            },
            "st_li_blinklist": {
                "id": "st_li_blinklist",
                "name": "Blinklist",
                "img": "https://ws.sharethis.com/images/blinklist_32.png"
            },
            "st_li_blip": {
                "id": "st_li_blip",
                "name": "Blip",
                "img": "https://ws.sharethis.com/images/blip_32.png"
            },
            "st_li_blogmarks": {
                "id": "st_li_blogmarks",
                "name": "Blogmarks",
                "img": "https://ws.sharethis.com/images/blogmarks_32.png"
            },
            "st_li_blogger": {
                "id": "st_li_blogger",
                "name": "Blogger",
                "img": "https://ws.sharethis.com/images/blogger_32.png"
            },
            "st_li_buddymarks": {
                "id": "st_li_buddymarks",
                "name": "BuddyMarks",
                "img": "https://ws.sharethis.com/images/buddymarks_32.png"
            },
            "st_li_buffer": {
                "id": "st_li_buffer",
                "name": "Buffer",
                "img": "https://ws.sharethis.com/images/buffer_32.png"
            },
            "st_li_care2": {
                "id": "st_li_care2",
                "name": "Care2",
                "img": "https://ws.sharethis.com/images/care2_32.png"
            },
            "st_li_chiq": {
                "id": "st_li_chiq",
                "name": "chiq",
                "img": "https://ws.sharethis.com/images/chiq_32.png"
            },
            "st_li_citeulike": {
                "id": "st_li_citeulike",
                "name": "CiteULike",
                "img": "https://ws.sharethis.com/images/citeulike_32.png"
            },
            "st_li_corkboard": {
                "id": "st_li_corkboard",
                "name": "Corkboard",
                "img": "https://ws.sharethis.com/images/corkboard_32.png"
            },
            "st_li_dealsplus": {
                "id": "st_li_dealsplus",
                "name": "Dealspl.us",
                "img": "https://ws.sharethis.com/images/dealsplus_32.png"
            },
            "st_li_delicious": {
                "id": "st_li_delicious",
                "name": "Delicious",
                "img": "https://ws.sharethis.com/images/delicious_32.png"
            },
            "st_li_digg": {
                "id": "st_li_digg",
                "name": "Digg",
                "img": "https://ws.sharethis.com/images/digg_32.png"
            },
            "st_li_diigo": {
                "id": "st_li_diigo",
                "name": "Diigo",
                "img": "https://ws.sharethis.com/images/diigo_32.png"
            },
            "st_li_dzone": {
                "id": "st_li_dzone",
                "name": "DZone",
                "img": "https://ws.sharethis.com/images/dzone_32.png"
            },
            "st_li_edmodo": {
                "id": "st_li_edmodo",
                "name": "Edmodo",
                "img": "https://ws.sharethis.com/images/edmodo_32.png"
            },
            "st_li_embed_ly": {
                "id": "st_li_embed_ly",
                "name": "Embed.ly",
                "img": "https://ws.sharethis.com/images/embed_ly_32.png"
            },
            "st_li_evernote": {
                "id": "st_li_evernote",
                "name": "Evernote",
                "img": "https://ws.sharethis.com/images/evernote_32.png"
            },
            "st_li_fark": {
                "id": "st_li_fark",
                "name": "Fark",
                "img": "https://ws.sharethis.com/images/fark_32.png"
            },
            "st_li_fashiolista": {
                "id": "st_li_fashiolista",
                "name": "Fashiolista",
                "img": "https://ws.sharethis.com/images/fashiolista_32.png"
            },
            "st_li_flipboard": {
                "id": "st_li_flipboard",
                "name": "Flipboard",
                "img": "https://ws.sharethis.com/images/flipboard_32.png"
            },
            "st_li_folkd": {
                "id": "st_li_folkd",
                "name": "folkd.com",
                "img": "https://ws.sharethis.com/images/folkd_32.png"
            },
            "st_li_foodlve": {
                "id": "st_li_foodlve",
                "name": "FoodLve",
                "img": "https://ws.sharethis.com/images/foodlve_32.png"
            },
            "st_li_fresqui": {
                "id": "st_li_fresqui",
                "name": "Fresqui",
                "img": "https://ws.sharethis.com/images/fresqui_32.png"
            },
            "st_li_friendfeed": {
                "id": "st_li_friendfeed",
                "name": "FriendFeed",
                "img": "https://ws.sharethis.com/images/friendfeed_32.png"
            },
            "st_li_funp": {
                "id": "st_li_funp",
                "name": "Funp",
                "img": "https://ws.sharethis.com/images/funp_32.png"
            },
            "st_li_fwisp": {
                "id": "st_li_fwisp",
                "name": "fwisp",
                "img": "https://ws.sharethis.com/images/fwisp_32.png"
            },
            "st_li_google": {
                "id": "st_li_google",
                "name": "Google",
                "img": "https://ws.sharethis.com/images/google_32.png"
            },
            "st_li_google_bmarks": {
                "id": "st_li_google_bmarks",
                "name": "Bookmarks",
                "img": "https://ws.sharethis.com/images/google_bmarks_32.png"
            },
            "st_li_google_reader": {
                "id": "st_li_google_reader",
                "name": "Google Reader",
                "img": "https://ws.sharethis.com/images/google_reader_32.png"
            },
            "st_li_google_translate": {
                "id": "st_li_google_translate",
                "name": "Google Translate",
                "img": "https://ws.sharethis.com/images/google_translate_32.png"
            },
            "st_li_hatena": {
                "id": "st_li_hatena",
                "name": "Hatena",
                "img": "https://ws.sharethis.com/images/hatena_32.png"
            },
            "st_li_instapaper": {
                "id": "st_li_instapaper",
                "name": "Instapaper",
                "img": "https://ws.sharethis.com/images/instapaper_32.png"
            },
            "st_li_jumptags": {
                "id": "st_li_jumptags",
                "name": "Jumptags",
                "img": "https://ws.sharethis.com/images/jumptags_32.png"
            },
            "st_li_kaboodle": {
                "id": "st_li_kaboodle",
                "name": "Kaboodle",
                "img": "https://ws.sharethis.com/images/kaboodle_32.png"
            },
            "st_li_linkagogo": {
                "id": "st_li_linkagogo",
                "name": "linkaGoGo",
                "img": "https://ws.sharethis.com/images/linkagogo_32.png"
            },
            "st_li_livejournal": {
                "id": "st_li_livejournal",
                "name": "LiveJournal",
                "img": "https://ws.sharethis.com/images/livejournal_32.png"
            },
            "st_li_mail_ru": {
                "id": "st_li_mail_ru",
                "name": "mail.ru",
                "img": "https://ws.sharethis.com/images/mail_ru_32.png"
            },
            "st_li_meneame": {
                "id": "st_li_meneame",
                "name": "Meneame",
                "img": "https://ws.sharethis.com/images/meneame_32.png"
            },
            "st_li_messenger": {
                "id": "st_li_messenger",
                "name": "Messenger",
                "img": "https://ws.sharethis.com/images/messenger_32.png"
            },
            "st_li_mister_wong": {
                "id": "st_li_mister_wong",
                "name": "Mr Wong",
                "img": "https://ws.sharethis.com/images/mister_wong_32.png"
            },
            "st_li_moshare": {
                "id": "st_li_moshare",
                "name": "moShare",
                "img": "https://ws.sharethis.com/images/moshare_32.png"
            },
            "st_li_myspace": {
                "id": "st_li_myspace",
                "name": "MySpace",
                "img": "https://ws.sharethis.com/images/myspace_32.png"
            },
            "st_li_n4g": {
                "id": "st_li_n4g",
                "name": "N4G",
                "img": "https://ws.sharethis.com/images/n4g_32.png"
            },
            "st_li_netlog": {
                "id": "st_li_netlog",
                "name": "Netlog",
                "img": "https://ws.sharethis.com/images/netlog_32.png"
            },
            "st_li_netvouz": {
                "id": "st_li_netvouz",
                "name": "Netvouz",
                "img": "https://ws.sharethis.com/images/netvouz_32.png"
            },
            "st_li_newsvine": {
                "id": "st_li_newsvine",
                "name": "Newsvine",
                "img": "https://ws.sharethis.com/images/newsvine_32.png"
            },
            "st_li_nujij": {
                "id": "st_li_nujij",
                "name": "NUjij",
                "img": "https://ws.sharethis.com/images/nujij_32.png"
            },
            "st_li_odnoklassniki": {
                "id": "st_li_odnoklassniki",
                "name": "Odnoklassniki",
                "img": "https://ws.sharethis.com/images/odnoklassniki_32.png"
            },
            "st_li_oknotizie": {
                "id": "st_li_oknotizie",
                "name": "Oknotizie",
                "img": "https://ws.sharethis.com/images/oknotizie_32.png"
            },
            "st_li_pocket": {
                "id": "st_li_pocket",
                "name": "Pocket",
                "img": "https://ws.sharethis.com/images/pocket_32.png"
            },
            "st_li_print": {
                "id": "st_li_print",
                "name": "Print",
                "img": "https://ws.sharethis.com/images/print_32.png"
            },
            "st_li_raise_your_voice": {
                "id": "st_li_raise_your_voice",
                "name": "Raise Your Voice",
                "img": "https://ws.sharethis.com/images/raise_your_voice_32.png"
            },
            "st_li_reddit": {
                "id": "st_li_reddit",
                "name": "Reddit",
                "img": "https://ws.sharethis.com/images/reddit_32.png"
            },
            "st_li_segnalo": {
                "id": "st_li_segnalo",
                "name": "Segnalo",
                "img": "https://ws.sharethis.com/images/segnalo_32.png"
            },
            "st_li_sina": {
                "id": "st_li_sina",
                "name": "Sina",
                "img": "https://ws.sharethis.com/images/sina_32.png"
            },
            "st_li_sonico": {
                "id": "st_li_sonico",
                "name": "Sonico",
                "img": "https://ws.sharethis.com/images/sonico_32.png"
            },
            "st_li_startaid": {
                "id": "st_li_startaid",
                "name": "Startaid",
                "img": "https://ws.sharethis.com/images/startaid_32.png"
            },
            "st_li_startlap": {
                "id": "st_li_startlap",
                "name": "Startlap",
                "img": "https://ws.sharethis.com/images/startlap_32.png"
            },
            "st_li_stumbleupon": {
                "id": "st_li_stumbleupon",
                "name": "StumbleUpon",
                "img": "https://ws.sharethis.com/images/stumbleupon_32.png"
            },
            "st_li_stumpedia": {
                "id": "st_li_stumpedia",
                "name": "Stumpedia",
                "img": "https://ws.sharethis.com/images/stumpedia_32.png"
            },
            "st_li_typepad": {
                "id": "st_li_typepad",
                "name": "TypePad",
                "img": "https://ws.sharethis.com/images/typepad_32.png"
            },
            "st_li_tumblr": {
                "id": "st_li_tumblr",
                "name": "Tumblr",
                "img": "https://ws.sharethis.com/images/tumblr_32.png"
            },
            "st_li_viadeo": {
                "id": "st_li_viadeo",
                "name": "Viadeo",
                "img": "https://ws.sharethis.com/images/viadeo_32.png"
            },
            "st_li_virb": {
                "id": "st_li_virb",
                "name": "Virb",
                "img": "https://ws.sharethis.com/images/virb_32.png"
            },
            "st_li_vkontakte": {
                "id": "st_li_vkontakte",
                "name": "Vkontakte",
                "img": "https://ws.sharethis.com/images/vkontakte_32.png"
            },
            "st_li_voxopolis": {
                "id": "st_li_voxopolis",
                "name": "VOXopolis",
                "img": "https://ws.sharethis.com/images/voxopolis_32.png"
            },
            "st_li_whatsapp": {
                "id": "st_li_whatsapp",
                "name": "WhatsApp",
                "img": "https://ws.sharethis.com/images/whatsapp_32.png"
            },
            "st_li_weheartit": {
                "id": "st_li_weheartit",
                "name": "We Heart It",
                "img": "https://ws.sharethis.com/images/weheartit_32.png"
            },
            "st_li_wordpress": {
                "id": "st_li_wordpress",
                "name": "WordPress",
                "img": "https://ws.sharethis.com/images/wordpress_32.png"
            },
            "st_li_xerpi": {
                "id": "st_li_xerpi",
                "name": "Xerpi",
                "img": "https://ws.sharethis.com/images/xerpi_32.png"
            },
            "st_li_xing": {
                "id": "st_li_xing",
                "name": "Xing",
                "img": "https://ws.sharethis.com/images/xing_32.png"
            },
            "st_li_yammer": {
                "id": "st_li_yammer",
                "name": "Yammer",
                "img": "https://ws.sharethis.com/images/yammer_32.png"
            },
            "st_li_foursquarefollow": {
                "id": "st_li_foursquarefollow",
                "name": "Foursquare Follow",
                "img": "http://w.sharethis.com/images/foursquarefollow_32.png"
            },
            "st_li_foursquaresave": {
                "id": "st_li_foursquaresave",
                "name": "Foursquare Save",
                "img": "http://w.sharethis.com/images/foursquaresave_32.png"
            },
            "st_li_fbsub": {
                "id": "st_li_fbsub",
                "name": "Facebook Subscribe",
                "img": "http://w.sharethis.com/images/fbsub_32.png"
            },
            "st_li_fbsend": {
                "id": "st_li_fbsend",
                "name": "Facebook Send",
                "img": "http://w.sharethis.com/images/fbsend_32.png"
            },
            "st_li_fbrec": {
                "id": "st_li_fbrec",
                "name": "Facebook Recommend",
                "img": "http://w.sharethis.com/images/fbrec_32.png"
            },
            "st_li_fblike": {
                "id": "st_li_fblike",
                "name": "Facebook Like",
                "img": "http://w.sharethis.com/images/fblike_32.png"
            },
            "st_li_instagram": {
                "id": "st_li_instagram",
                "name": "Instagram Badge",
                "img": "http://w.sharethis.com/images/instagram_32.png"
            },
            "st_li_plusone": {
                "id": "st_li_plusone",
                "name": "Google +1",
                "img": "http://w.sharethis.com/images/plusone_32.png"
            },
            "st_li_pinterestfollow": {
                "id": "st_li_pinterestfollow",
                "name": "Pinterest Follow",
                "img": "http://w.sharethis.com/images/pinterestfollow_32.png"
            },
            "st_li_twitterfollow": {
                "id": "st_li_twitterfollow",
                "name": "Twitter Follow",
                "img": "http://w.sharethis.com/images/twitterfollow_32.png"
            },
            "st_li_youtube": {
                "id": "st_li_youtube",
                "name": "Youtube Subscribe",
                "img": "http://w.sharethis.com/images/youtube_32.png"
            }
        };

    });

});
