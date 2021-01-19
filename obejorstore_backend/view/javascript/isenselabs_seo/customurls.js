// Deletes an custom if ID is provided
function deleteCustomUrl(query) {
    if (query === undefined) {
        return false;
    }
    
    bootbox.confirm({
        title: text_delete,
        message: text_delete_confirmation,
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
                    url: "index.php?route=" + modulePath + "/remove_customurl&" + token_string + "=" + token + "&query=" + query + "&store_id=" + storeId,
                    type: 'get',
                    dataType: 'JSON',
                    beforeSend: function() {
                        $('.custom-urls-results').html('<br /><div class="loader"></div>');
                    },
                    success: function(json) { 
                        if (json['success']) {
                            $('.custom-urls-results').load("index.php?route=" + modulePath + "/tab_customurls&store_id=" + storeId + "&" + token_string + "=" + token);
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

// Add new custom URL
function addCustomUrl() {
    var form_data   =  '<div class="customurl-submit-form">';
    form_data       += '<div class="form-group"><label for="custom_query">' + text_opencart_route + '</label>';
    form_data       += '<div class="input-group">';
    form_data       += '    <div class="input-group-addon">' + store.url + 'index.php?route=</div>';
    form_data       += '    <input type="text" class="form-control" placeholder="account/login" id="custom_query" name="custom_query">';
    form_data       += '</div>';
    form_data       += '<div class="form-group"><label for="custom_keyword">' + text_url_address + '</label>';
    for (var langCode in languages) {
        form_data       += '<div class="input-group" style="margin:5px auto;">';
        form_data       += '    <div class="input-group-addon"><img src="language/' + languages[langCode]['code'] + '/' + languages[langCode]['code'] + '.png" alt="' + languages[langCode]['name'] + '" title="' + languages[langCode]['name'] + '"></div>';
        form_data       += '    <input type="text" class="form-control" placeholder="account_login" id="custom_keyword" name="custom_keyword[' + languages[langCode]['language_id'] + ']">';
        form_data       += '</div>';
    }
    form_data       += '</div>';
    form_data       += text_all_fields_filled_in_helper;
    
    bootbox.confirm({
        title: text_add_custom_url,
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
            
            $('.customurl-submit-form').find('input').each(function (index, element) {
               if ($(element).val() == '') fieldChecker = false;
            });
            
            if (result) {
                if (fieldChecker == false) {
                    return false;
                }
                
                $.ajax({
                    url: "index.php?route=" + modulePath + "/add_customurl&" + token_string + "=" + token + "&store_id=" + storeId,
                    type: 'get',
                    data: $('.customurl-submit-form').find('input').serialize(),
                    dataType: 'JSON',
                    beforeSend: function() {
                        $('.custom-urls-results').html('<br /><div class="loader"></div>');
                    },
                    success: function(json) { 
                        if (json['success']) {
                            $('.custom-urls-results').load("index.php?route=" + modulePath + "/tab_customurls&store_id=" + storeId + "&" + token_string + "=" + token);
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

// Edit custom URL
function editCustomUrl(query) {
    $.ajax({
        url: "index.php?route=" + modulePath + "/get_customurl&" + token_string + "=" + token + "&query=" + query + "&store_id=" + storeId,
        type: 'get',
        dataType: 'JSON',
        beforeSend: function() {
        },
        success: function(json) { 
            var form_data   =  '<div class="customurl-submit-form">';
            form_data       += '<div class="form-group"><label for="custom_query">' + text_opencart_route + '</label>';
            form_data       += '<div class="input-group">';
            form_data       += '    <div class="input-group-addon">' + store.url + 'index.php?route=</div>';
            form_data       += '    <input type="text" class="form-control" placeholder="account/login" id="custom_query" value="' + json['data']['query'] + '" name="custom_query">';
            form_data       += '</div>';
            form_data       += '<div class="form-group"><label for="custom_keyword">' + text_url_address + '</label>';
            for (var langCode in languages) {
                form_data       += '<div class="input-group" style="margin:5px auto;">';
                form_data       += '    <div class="input-group-addon"><img src="language/' + languages[langCode]['code'] + '/' + languages[langCode]['code'] + '.png" alt="' + languages[langCode]['name'] + '" title="' + languages[langCode]['name'] + '"></div>';
                form_data       += '    <input type="text" class="form-control" placeholder="account_login" id="custom_keyword" value="' + (json['data']['keyword'][languages[langCode]['language_id']] !== undefined ? json['data']['keyword'][languages[langCode]['language_id']] : '') + '" name="custom_keyword[' + languages[langCode]['language_id'] + ']">';
                form_data       += '</div>';
            }
            form_data       += '</div>';
            form_data       += text_all_fields_filled_in_helper;
            
            bootbox.confirm({
                title: text_edit_customurl,
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

                    $('.customurl-submit-form').find('input').each(function (index, element) {
                       if ($(element).val() == '') fieldChecker = false;
                    });

                    if (result) {
                        if (fieldChecker == false) {
                            return false;
                        }

                        $.ajax({
                            url: "index.php?route=" + modulePath + "/add_customurl&" + token_string + "=" + token + "&store_id=" + storeId,
                            type: 'get',
                            data: $('.customurl-submit-form').find('input').serialize(),
                            dataType: 'JSON',
                            beforeSend: function() {
                                $('.custom-urls-results').html('<br /><div class="loader"></div>');
                            },
                            success: function(json) { 
                                if (json['success']) {
                                    $('.custom-urls-results').load("index.php?route=" + modulePath + "/tab_customurls&store_id=" + storeId + "&" + token_string + "=" + token);
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
    });
}

// Pagination custom URLs
$('document').ready(function() {
   $('.custom-urls-results').delegate('.pagination a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
                $('.custom-urls-results').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.custom-urls-results').html(data);
            }
        });
    })); 
});

$('document').ready(function() {
    $('.custom-urls-results').delegate('input[name*="customurls_queries"]', 'change', (function(e){
        if ($('input[name*="customurls_queries"]:checked').length > 0) {
            $('.customurls-options').show(500);
        } else {
            $('.customurls-options').hide(500);
        }
       
        
    })); 
});
	
function deleteCustomUrls() {
    var links = $('input[name*="customurls_queries"]:checked');
    
    if (links.length > 0) {
        bootbox.confirm({
            title: text_delete,
            message: text_delete_confirmation,
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
                        url: "index.php?route=" + modulePath + "/remove_customurls&" + token_string + "=" + token + "&store_id=" + storeId,
                        type: 'POST',
                        data: { results : links.serializeArray() },
                        dataType: 'JSON',
                        beforeSend: function() {
                            $('.custom-urls-results').html('<br /><div class="loader"></div>');
                        },
                        success: function(json) { 
                            if (json['success']) {
                                $('.custom-urls-results').load("index.php?route=" + modulePath + "/tab_customurls&store_id=" + storeId + "&" + token_string + "=" + token);
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
