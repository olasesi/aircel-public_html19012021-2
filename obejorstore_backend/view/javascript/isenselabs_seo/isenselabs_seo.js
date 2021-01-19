// Some variables here
var Dialog;

// Button events in the module
function seoFixNow(eventType, language_id) {
    var message = '';
    var additional_data = '';
    if (language_id === undefined) {
        language_id = defaultLanguageId;
    }
    switch(eventType) {
        case 'htaccess_exists':
            $('a[href="#file-editor-tab"]').click();
            $('a[href="#tab-htaccess"]').click();
            break;
        case 'robots_exists':
            $('a[href="#file-editor-tab"]').click();
            $('a[href="#tab-robots"]').click();
            break;
        default:
            $.ajax({
                url: fixIssuesAjaxURL + "&event_type=" + eventType + "&language_id=" + language_id + "&store_id=" + storeId,
                dataType: 'JSON',
                beforeSend: function() {
                    Dialog = bootbox.alert({
                        title: text_performing_operation,
                        message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> ' + text_loading_please_wait + '</div>'
                    });
                    Dialog.find('.modal-footer button').hide();  
                },
                success: function(data) {
                    if (data['success']) {
                        message = data['message'];
                        if (data['items']) {
                            additional_data = data['items'];
                        }
                    }

                    if (data['reload']) {
                        location.reload();
                    }
                    
                    if (data['error']) {
                        Dialog.init(function(){
                            setTimeout(function(){
                                Dialog.find('.modal-title').html(text_error);
                                Dialog.find('.modal-footer button').show();
                                Dialog.find('.bootbox-body').html(data['error']);
                            }, 1500);
                        });
                    }
                },
                complete: function() {
                    if (message!='') {
                        var text_to_display = message;
                        if (additional_data != '') {
                            text_to_display += '<br /><br /><div class="result-list"><ul>';
                            $.each(additional_data, function(key, val) {
                                    text_to_display += "<li><strong>" + val['name'] + "</strong> > " + val['result'] + "</li>";
                                }
                            );
                            text_to_display += '</ul></div>';
                        }
                        Dialog.init(function(){
                            setTimeout(function(){
                                Dialog.find('.modal-title').html(text_complete);
                                Dialog.find('.modal-footer button').show();
                                Dialog.find('.bootbox-body').html(text_to_display);
                            }, 1500);
                        }); 
                    }
                }
            });
            break;
    }
}

// Button events in the module
function seoFixQuick(eventType, event, language_id) {
    var message = '';
    if (language_id === undefined) {
        language_id = defaultLanguageId;
    }
        
    switch(eventType) {
        case 'htaccess_exists':
            $('a[href="#file-editor-tab"]').click();
            $('a[href="#tab-htaccess"]').click();
            break;
        case 'robots_exists':
            $('a[href="#file-editor-tab"]').click();
            $('a[href="#tab-robots"]').click();
            break;
        default:
            $.ajax({
                url: fixIssuesAjaxURL + "&event_type=" + eventType + "&language_id=" + language_id + "&store_id=" + storeId,
                dataType: 'JSON',
                beforeSend: function() {
                    Dialog = bootbox.alert({
                        title: text_performing_operation,
                        message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> ' + text_loading_please_wait + '</div>'
                    });
                    Dialog.find('.modal-footer button').hide();  
                },
                success: function(data) {
                    if (data['success']) {
                        message = data['message'];
                        var element = $(event).parent().parent();
                        element.hide(1000);
                    }

                    if (data['reload']) {
                        location.reload();
                    }
                    
                    if (data['error']) {
                        Dialog.init(function(){
                            setTimeout(function(){
                                Dialog.find('.modal-title').html(text_error);
                                Dialog.find('.modal-footer button').show();
                                Dialog.find('.bootbox-body').html(data['error']);
                            }, 1500);
                        });
                    }
                },
                complete: function() {
                    if (message!='') {
                        Dialog.init(function(){
                            setTimeout(function(){
                                Dialog.find('.modal-title').html(text_complete);
                                Dialog.find('.modal-footer button').show();
                                Dialog.find('.bootbox-body').html(message);
                            }, 1500);
                        }); 
                    }
                }
            });
            $('.improved_count').html($('.list-group-fixes:first .list-group-item').length-1);
            break;
    }
}

// Image Zoom
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});

// Initialize the main tabs
$(document).ready(function() {
    $('.mainMenuTabs a:first').tab('show'); // Select first tab
	if (window.localStorage && window.localStorage['currentTab']) {
		$('.mainMenuTabs a[href="'+window.localStorage['currentTab']+'"]').tab('show');
	}
	
	$('.mainMenuTabs a[data-toggle="tab"]').click(function() {
		if (window.localStorage) {
			window.localStorage['currentTab'] = $(this).attr('href');
		}
	});
}); 

// Initialize the main tabs
$(document).ready(function() {
    $('.mainMenuTabs a[data-toggle="tab"][href="#home-tab"]').on('shown.bs.tab', function (e) {
        seo_score.resize();
    })
}); 
    


// Load some of the main sub-tabs in the module
$(document).ready(function(e) {
    //SEO Basics sub-tabs
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_titles&" + token_string + "=" + token + "&store_id=" + storeId,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-titles').html(data);
        }
    });
    
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_descriptions&" + token_string + "=" + token + "&store_id=" + storeId,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-descriptions').html(data);
        }
    });
    
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_keywords&" + token_string + "=" + token + "&store_id=" + storeId,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-keywords').html(data);
        }
    });

    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_product_heading_tags&" + token_string + "=" + token + "&store_id=" + storeId,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-product-heading-tags').html(data);
        }
    });
    
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_seo_links&" + token_string + "=" + token + "&store_id=" + storeId,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-seo-links').html(data);
        }
    });
    
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_image_titles&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        beforeSend: function() {
            
        },
        success: function(data) { 
            $('.tab-image-titles').html(data);
            if (window.location.href.indexOf('&seo_image_results=true') != -1) {
                setTimeout(function(){
                    $('div.image_renaming_results').addClass('focused_element');
                }, 500);
                setTimeout(function(){
                    $('div.image_renaming_results').removeClass('focused_element');
                }, 5000);
            }
        }
    });
    
    //Home tab
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_home&store_id=" + storeId + "&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.seo-home-tab').html(data);
        }
    });
    
    //Advanced SEO -> Auto Links sub-tab
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_autolinks&store_id=" + storeId + "&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.auto-links-results').html(data);
        }
    });
    
    //Advanced SEO -> Rich Snippets sub-tab
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_richsnippets&store_id=" + storeId + "&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-richsnippets').html(data);
        }
    });
    
    //Advanced SEO -> Social Links sub-tab
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_sociallinks&store_id=" + storeId + "&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-sociallinks').html(data);
        }
    });
    
    //Advanced SEO -> Custom URLs sub-tab
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_customurls&store_id=" + storeId + "&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.custom-urls-results').html(data);
        }
    });
    
    //Advanced SEO -> htaccess sub-tab
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_htaccess&store_id=" + storeId + "&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-htaccess').html(data);
        }
    });
    
    //Advanced SEO -> robots sub-tab
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_robots&store_id=" + storeId + "&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-robots').html(data);
        }
    });
    
    //SEO Analysis tab
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_seo_analysis&store_id=" + storeId + "&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.seo-analysis-tab').html(data);
        }
    });
    
    //404 Manager -> Detected Missing Pages sub-tab
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_detected_missing_pages&store_id=" + storeId + "&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-detected-pages-results').html(data);
        }
    });
    
    //404 Manager -> 404 redirects sub-tab
    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_redirects&store_id=" + storeId + "&" + token_string + "=" + token,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.tab-redirects-results').html(data);
        }
    });
    
});

// When clicking on Save Changes in the Advanced Settings in the any of the tabs
function saveChanges(selector) {
    var settings = $(selector).find('input, select, textarea').serialize();

    $.ajax({
        url: saveSettingsAjaxURL,
        dataType: 'JSON',
        type: 'post',
        data: settings,
        success: function(data) {
           if (data['success']) {
               message = data['message'];
           }
        },
        beforeSend: function() {
            Dialog = bootbox.alert({
                title: text_performing_operation,
                message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> ' + text_loading_please_wait + '</div>'
            });
            Dialog.find('.modal-footer button').hide();
        },
        complete: function() {
            Dialog.init(function(){
                setTimeout(function(){
                    Dialog.find('.modal-title').html(text_complete);
                    Dialog.find('.modal-footer button').show();
                    Dialog.find('.bootbox-body').html(message);
                }, 1500);
            });
        }
    });
    
    return false;
}

// Generate image names via AJAX
function generateImageNames() {
    bootbox.confirm({
        title: text_confirm_action,
        message: text_confirm_image_rename,
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> ' + text_cancel
            },
            confirm: {
                label: '<i class="fa fa-check"></i> ' + text_confirm
            }
        },
        callback: function (result) {
            var rename_additional_images = $('input[name="rename_additional_images"]').is(":checked");
            if (result) {
                $.ajax({
                    url: "index.php?route=" + modulePath + "/generate_image_names&" + token_string + "=" + token + "&rename_additional_images=" + rename_additional_images,
                    type: 'get',
                    dataType: 'JSON',
                    beforeSend: function() {
                        Dialog = bootbox.alert({
                            title: text_performing_operation,
                            message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> ' + text_loading_please_wait +  '</div>'
                        });  
                    },
                    success: function(data) { 
                        if (data['success']) {
                            location = data['redirect'] + '&' + token_string + '=' + token + '&store_id=' + storeId + '&seo_image_results=true';
                        } else {
                            alert(text_unexpected_error_id + 'ERR_IMG_GEN');
                        }
                    }
                });
            } else {
                return true;
            }
        }
    });
    
}

// When the image renamer is finished, to be redirected to the image results
$(document).ready(function(e) {
    if (window.location.href.indexOf('&seo_image_results=true') != -1) {
        setTimeout(function(){
            $('a[href="#settings-tab"]').click();
            $('a[href="#tab-image-titles"]').tab('show');
        }, 100);
    }
});

// Show the SEO helper information
function showSeoScoreHelper() {
    $('a[href="#faq-tab"]').click();
    setTimeout(function(){
        $('a[href="#collapseEleven"]').click();
    }, 300);
}

// Getting the SEO score
function getSEOScore() {
    $.ajax({
        url: "index.php?route=" + modulePath + "/calculate_seo_score&" + token_string + "=" + token,
        type: 'get',
        dataType: 'JSON',
        beforeSend: function() {
            //$('.btn-retest').button('loading');
            $('.seo-home-tab').html('<p><h2 class="text-center">' + text_running_tests + '</h2></p><br /><div class="loader"></div>');
        },
        success: function(data) { 
           setTimeout(function() {
               $.ajax({
                    url: "index.php?route=" + modulePath + "/tab_home&store_id=" + storeId + "&" + token_string + "=" + token,
                    type: 'get',
                    dataType: 'html',
                    success: function(data) { 
                        $('.seo-home-tab').html(data);
                    }
                });
            }, 1500);
        },
        complete: function() {}
    });
}

function showHideList() {
    if($('.show-hide-list').is(':visible')) {
        $('.show-hide-list').hide(400);
        $('.btn-show-hide-list').html(text_show_more);
    } else {
        $('.show-hide-list').show(400);
        $('.btn-show-hide-list').html(text_show_less);

    }
}

function crawlerAnalyze(element) {
    var left_url = $(element).parent().parent().find('select:first').val();
    var url = left_url + $(element).parent().parent().find('input:first').val();
    var flag = true;
    
    if (url == '' || !isUrlValid(url)) {
        var Dialog = bootbox.alert({
            title: text_crawler_error_heading,
            message: '<div class="text-left">' + text_crawler_url_error + '</div>'
        });
        flag = false;
    }
    
    if (flag) {
        $.ajax({
            url: "index.php?route=" + modulePath + "/get_crawler_data&" + token_string + "=" + token,
            type: 'get',
            data: { url : url },
            beforeSend: function() {
                $('.seo_crawler_results').html('<p><h2 class="text-center">' + text_running_tests + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) { 
                $('.seo_crawler_results').html(data);
            },
            complete: function() {}
        });
    }

}

function isUrlValid(userInput) {
    var regexQuery = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$";
    var url = new RegExp(regexQuery,"i");
    if (url.test(userInput)) {
        return true;
    }
    return false;
}

function addUrl(element) {
    var url = $(element).data('url');
    $('.seo_crawler_input').val(url);
}

// Crawler input button auto-send query
$(document).ready(function() {
    $('.seo_crawler_input').on('keydown', function(e) {
		if (e.keyCode == 13) {
            e.preventDefault();
            e.stopImmediatePropagation();
			$('.btn-crawler-analyze').trigger('click');
		}
	});
    
});

function filterSeoAnalysis(selector, event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    
    var filter_data = $(selector).parents('.seo-analysis-filter-row').find('input, select, textarea').serialize();

    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_seo_analysis&" + token_string + "=" + token,
        dataType: 'html',
        type: 'get',
        data: filter_data,
        success: function(data) {
           $('.seo-analysis-tab').html(data);
        },
        beforeSend: function() {
           $('.seo-analysis-tab').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
        }
    });
    
    return false;
}

function clearMissingPagesResults() {
    bootbox.confirm({
        title: text_confirm_action,
        message: text_confirm_clear_analysis,
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> ' + text_cancel
            },
            confirm: {
                label: '<i class="fa fa-check"></i> ' + text_confirm
            }
        },
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: "index.php?route=" + modulePath + "/clear_missing_pages&store_id=" + storeId + "&" + token_string + "=" + token,
                    type: 'get',
                    dataType: 'JSON',
                    beforeSend: function() {
                        Dialog = bootbox.alert({
                            title: text_performing_operation,
                            message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> ' + text_loading_please_wait +  '</div>'
                        });  
                    },
                    success: function(data) { 
                        if (data['success']) {
                            $.ajax({
                                url: "index.php?route=" + modulePath + "/tab_detected_missing_pages&store_id=" + storeId + "&" + token_string + "=" + token,
                                type: 'get',
                                dataType: 'html',
                                success: function(data) { 
                                    $('.tab-detected-pages-results').html(data);
                                    Dialog.modal('hide');
                                }
                            });
                        } else {
                            alert(text_unexpected_error_id + 'ERR_SMP');
                        }
                    }
                });
            } else {
                return true;
            }
        }
    });
}

function clearAnalysisResults() {
    bootbox.confirm({
        title: text_confirm_action,
        message: text_confirm_clear_analysis,
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> ' + text_cancel
            },
            confirm: {
                label: '<i class="fa fa-check"></i> ' + text_confirm
            }
        },
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: "index.php?route=" + modulePath + "/clear_seo_analysis&" + token_string + "=" + token,
                    type: 'get',
                    dataType: 'JSON',
                    beforeSend: function() {
                        Dialog = bootbox.alert({
                            title: text_performing_operation,
                            message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> ' + text_loading_please_wait +  '</div>'
                        });  
                    },
                    success: function(data) { 
                        if (data['success']) {
                            $.ajax({
                                url: "index.php?route=" + modulePath + "/tab_seo_analysis&store_id=" + storeId + "&" + token_string + "=" + token,
                                type: 'get',
                                dataType: 'html',
                                success: function(data) { 
                                    $('.seo-analysis-tab').html(data);
                                    Dialog.modal('hide');
                                }
                            });
                        } else {
                            alert(text_unexpected_error_id + 'ERR_SAC');
                        }
                    }
                });
            } else {
                return true;
            }
        }
    });
}

// Pagination SEO-Analysis
$('document').ready(function() {
   $('.seo-analysis-tab').delegate('.pagination a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
               $('.seo-analysis-tab').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.seo-analysis-tab').html(data);
            }
        });
    })); 
});

// Detected pages  URLs
$('document').ready(function() {
   $('.tab-detected-pages-results').delegate('.pagination a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
                $('.tab-detected-pages-results').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.tab-detected-pages-results').html(data);
            }
        });
    })); 
});

function filterDetectedPages(selector, event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    
    var filter_data = $(selector).parents('.detected-pages-filter-row').find('input, select, textarea').serialize();

    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_detected_missing_pages&store_id=" + storeId + "&" + token_string + "=" + token,
        dataType: 'html',
        type: 'get',
        data: filter_data,
        success: function(data) {
           $('.tab-detected-pages-results').html(data);
        },
        beforeSend: function() {
           $('.tab-detected-pages-results').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
        }
    });
    
    return false;
}

$('document').ready(function() {
    $('.tab-detected-pages-results').delegate('input[name*="detectedpages_ids"]', 'change', (function(e){
        if ($('input[name*="detectedpages_ids"]:checked').length > 0) {
            $('.detectedpages-options').show(500);
        } else {
            $('.detectedpages-options').hide(500);
        }
    })); 
});

// Deletes an custom if ID is provided
function deleteDetectedPage(id) {
    if (id === undefined) {
        return false;
    }
    
    bootbox.confirm({
        title: text_delete,
        message: text_remove_selected_row,
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> ' + text_cancel
            },
            confirm: {
                label: '<i class="fa fa-check"></i> ' + text_confirm
            }
        },
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: "index.php?route=" + modulePath + "/remove_detected_page&store_id=" + storeId + "&" + token_string + "=" + token + "&id=" + id,
                    type: 'get',
                    dataType: 'JSON',
                    beforeSend: function() {
                        $('.tab-detected-pages-results').html('<br /><div class="loader"></div>');
                    },
                    success: function(json) { 
                        if (json['success']) {
                            $('.tab-detected-pages-results').load("index.php?route=" + modulePath + "/tab_detected_missing_pages&store_id=" + storeId + "&" + token_string + "=" + token);
                        } else {
                            alert(json['error']);
                        }
                    }
                });
            } else {
                return true;
            }
        }
    });
}

// Deletes multiple detected pages
function deleteDetectedPages() {
    var links = $('input[name*="detectedpages_ids"]:checked');
    
    if (links.length > 0) {
        bootbox.confirm({
            title: text_delete,
            message: text_remove_selected_row,
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times"></i> ' + text_cancel
                },
                confirm: {
                    label: '<i class="fa fa-check"></i> ' + text_confirm
                }
            },
            callback: function (result) {
                if (result) {
                    $.ajax({
                        url: "index.php?route=" + modulePath + "/remove_detected_pages&store_id=" + storeId + "&" + token_string + "=" + token,
                        type: 'POST',
                        data: { results : links.serializeArray() },
                        dataType: 'JSON',
                        beforeSend: function() {
                            $('.tab-detected-pages-results').html('<br /><div class="loader"></div>');
                        },
                        success: function(json) { 
                            if (json['success']) {
                                $('.tab-detected-pages-results').load("index.php?route=" + modulePath + "/tab_detected_missing_pages&store_id=" + storeId + "&" + token_string + "=" + token);
                            } else {
                                alert(json['error']);
                            }
                        }
                    });
                } else {
                    return true;
                }
            }
        });
    }
}

// Add 404 redirect
function addRedirectForMissingPage(route, tab) {
    var tab_url;
    if (tab == '.tab-detected-pages-results') {
        tab_url = 'tab_detected_missing_pages';
    } else if (tab = '.tab-redirects-results') {
        tab_url = 'tab_redirects';
    } else if (tab === undefined) {
        tab = '.tab-detected-pages-results';
        tab_url = 'tab_detected_missing_pages';
    }
    
    var form_data   =  '<div class="missingpage-submit-form">';
    form_data       += '<div class="form-group"><label for="route_from">' + text_old_address + '</label>';
    form_data       += '<input type="text" value="' + route + '" class="form-control" placeholder="account/login" id="route_from" name="route_from"></div>';
    form_data       += '<div class="form-group"><label for="route_to">' + text_new_address + '</label>';
    form_data       += '<input type="text" class="form-control" placeholder="account_login" id="route_to" name="route_to"></div>';
    form_data       += '</div>';
    form_data       += '<br />' + text_fields_filled_in_helper;
    
    bootbox.confirm({
        title: text_add_new_redirect,
        message: form_data,
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> ' + text_cancel
            },
            confirm: {
                label: '<i class="fa fa-plus"></i> ' + text_submit
            }
        },
        callback: function (result) {
            var fieldChecker = true;
            
            $('.missingpage-submit-form').find('input').each(function (index, element) {
               if ($(element).val() == '') fieldChecker = false;
            });
            
            if (result) {
                if (fieldChecker == false) {
                    return false;
                }
                
                $.ajax({
                    url: "index.php?route=" + modulePath + "/add_missing_page_redirect&store_id=" + storeId + "&" + token_string + "=" + token,
                    type: 'get',
                    data: $('.missingpage-submit-form').find('input').serialize(),
                    dataType: 'JSON',
                    beforeSend: function() {
                        $(tab).html('<br /><div class="loader"></div>');
                    },
                    success: function(json) { 
                        if (json['success']) {
                            $(tab).load("index.php?route=" + modulePath + "/" + tab_url + "&store_id=" + storeId + "&" + token_string + "=" + token);
                        } else {
                            alert(json['error']);
                        }
                    }
                });
            } else {
                return true;
            }
        }
    });
}

// Redirects pages  URLs
$('document').ready(function() {
   $('.tab-redirects-results').delegate('.pagination a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
                $('.tab-redirects-results').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.tab-redirects-results').html(data);
            }
        });
    })); 
});

function filterMissingRedirects(selector, event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    
    var filter_data = $(selector).parents('.missing-redirects-filter-row').find('input, select, textarea').serialize();

    $.ajax({
        url: "index.php?route=" + modulePath + "/tab_redirects&store_id=" + storeId + "&" + token_string + "=" + token,
        dataType: 'html',
        type: 'get',
        data: filter_data,
        success: function(data) {
           $('.tab-redirects-results').html(data);
        },
        beforeSend: function() {
           $('.tab-redirects-results').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
        }
    });
    
    return false;
}

$('document').ready(function() {
    $('.tab-redirects-results').delegate('input[name*="redirects_ids"]', 'change', (function(e){
        if ($('input[name*="redirects_ids"]:checked').length > 0) {
            $('.redirects-options').show(500);
        } else {
            $('.redirects-options').hide(500);
        }
    })); 
});

// Deletes redirect  if ID is provided
function deleteRedirect(id) {
    if (id === undefined) {
        return false;
    }
    
    bootbox.confirm({
        title: text_delete,
        message: text_remove_selected_row,
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> ' + text_cancel
            },
            confirm: {
                label: '<i class="fa fa-check"></i> ' + text_confirm
            }
        },
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: "index.php?route=" + modulePath + "/remove_redirect&store_id=" + storeId + "&" + token_string + "=" + token + "&id=" + id,
                    type: 'get',
                    dataType: 'JSON',
                    beforeSend: function() {
                        $('.tab-redirects-results').html('<br /><div class="loader"></div>');
                    },
                    success: function(json) { 
                        if (json['success']) {
                            $('.tab-redirects-results').load("index.php?route=" + modulePath + "/tab_redirects&store_id=" + storeId + "&" + token_string + "=" + token);
                        } else {
                            alert(json['error']);
                        }
                    }
                });
            } else {
                return true;
            }
        }
    });
}

// Deletes multiple detected pages
function deleteRedirects() {
    var links = $('input[name*="redirects_ids"]:checked');
    
    if (links.length > 0) {
        bootbox.confirm({
            title: text_delete,
            message: text_remove_selected_row,
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times"></i> ' + text_cancel
                },
                confirm: {
                    label: '<i class="fa fa-check"></i> ' + text_confirm
                }
            },
            callback: function (result) {
                if (result) {
                    $.ajax({
                        url: "index.php?route=" + modulePath + "/remove_redirects&store_id=" + storeId + "&" + token_string + "=" + token,
                        type: 'POST',
                        data: { results : links.serializeArray() },
                        dataType: 'JSON',
                        beforeSend: function() {
                            $('.tab-redirects-results').html('<br /><div class="loader"></div>');
                        },
                        success: function(json) { 
                            if (json['success']) {
                                $('.tab-redirects-results').load("index.php?route=" + modulePath + "/tab_redirects&store_id=" + storeId + "&" + token_string + "=" + token);
                            } else {
                                alert(json['error']);
                            }
                        }
                    });
                } else {
                    return true;
                }
            }
        });
    }
}
