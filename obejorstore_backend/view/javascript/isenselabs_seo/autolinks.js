// Deletes an autolink if ID is provided
function deleteAutoLink(id) {
    if (id === undefined) {
        return false;
    }
    
    bootbox.confirm({
        title: text_delete,
        message: text_delete_a_confirmation,
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
                    url: "index.php?route=" + modulePath + "/remove_autolink&store_id=" + storeId + "&" + token_string + "=" + token + "&id=" + id,
                    type: 'get',
                    dataType: 'JSON',
                    beforeSend: function() {
                        $('.auto-links-results').html('<br /><div class="loader"></div>');
                    },
                    success: function(json) { 
                        if (json['success']) {
                            $('.auto-links-results').load("index.php?route=" + modulePath + "/tab_autolinks&store_id=" + storeId + "&" + token_string + "=" + token);
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

// Add new autolink
function addAutoLink() {
    var form_data   =  '<div class="autolink-submit-form">';
    form_data       += '<div class="form-group"><label for="autolink_keyword">' + text_keyword_field + '</label>';
    form_data       += '<input type="text" class="form-control" id="autolink_keyword" name="autolink_keyword"></div>';
    form_data       += '<div class="form-group"><label for="autolink_url">' + text_url_address + '</label>';
    form_data       += '<input type="text" class="form-control" id="autolink_url" name="autolink_url"></div>';
    form_data       += '</div>';
    form_data       += '<br />' + text_fields_filled_in_helper;
    
    bootbox.confirm({
        title: text_add_new_autolink,
        message: form_data,
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> ' + text_cancel
            },
            confirm: {
                label: '<i class="fa fa-check"></i> ' + text_submit
            }
        },
        callback: function (result) {
            var fieldChecker = true;
            
            $('.autolink-submit-form').find('input').each(function (index, element) {
               if ($(element).val() == '') fieldChecker = false;
            });
            
            if (result) {
                if (fieldChecker == false) {
                    return false;
                }
                
                $.ajax({
                    url: "index.php?route=" + modulePath + "/add_autolink&store_id=" + storeId + "&" + token_string + "=" + token,
                    type: 'get',
                    data: $('.autolink-submit-form').find('input').serialize(),
                    dataType: 'JSON',
                    beforeSend: function() {
                        $('.auto-links-results').html('<br /><div class="loader"></div>');
                    },
                    success: function(json) { 
                        if (json['success']) {
                            $('.auto-links-results').load("index.php?route=" + modulePath + "/tab_autolinks&store_id=" + storeId + "&" + token_string + "=" + token);
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

// Edit autolink
function editAutoLink(id, page) {
    $.ajax({
        url: "index.php?route=" + modulePath + "/get_autolink&store_id=" + storeId + "&" + token_string + "=" + token + "&id=" + id,
        type: 'get',
        dataType: 'JSON',
        beforeSend: function() {
        },
        success: function(json) { 
            var form_data   =  '<div class="autolink-submit-form">';
            form_data       += '<div class="form-group"><label for="autolink_keyword">' + text_keyword_field + '</label>';
            form_data       += '<input type="text" class="form-control" id="autolink_keyword" value="' + json['data']['keyword'] + '" name="autolink_keyword"></div>';
            form_data       += '<div class="form-group"><label for="autolink_url">' + text_url_address + '</label>';
            form_data       += '<input type="text" class="form-control" id="autolink_url" value="' + json['data']['url'] + '" name="autolink_url"></div>';
            form_data       += '</div>';
            form_data       += '<br />' + text_fields_filled_in_helper;
            
            bootbox.confirm({
                title: text_edit_autolink,
                message: form_data,
                buttons: {
                    cancel: {
                        label: '<i class="fa fa-times"></i> ' + text_cancel
                    },
                    confirm: {
                        label: '<i class="fa fa-check"></i> ' + text_submit
                    }
                },
                callback: function (result) {
                    var fieldChecker = true;

                    $('.autolink-submit-form').find('input').each(function (index, element) {
                       if ($(element).val() == '') fieldChecker = false;
                    });

                    if (result) {
                        if (fieldChecker == false) {
                            return false;
                        }

                        $.ajax({
                            url: "index.php?route=" + modulePath + "/edit_autolink&store_id=" + storeId + "&" + token_string + "=" + token + "&id=" + id,
                            type: 'get',
                            data: $('.autolink-submit-form').find('input').serialize(),
                            dataType: 'JSON',
                            beforeSend: function() {
                                $('.auto-links-results').html('<br /><div class="loader"></div>');
                            },
                            success: function(json) { 
                                if (json['success']) {
                                    $('.auto-links-results').load("index.php?route=" + modulePath + "/tab_autolinks&store_id=" + storeId + "&" + token_string + "=" + token);
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

// Pagination auto-links
$('document').ready(function() {
   $('.auto-links-results').delegate('.pagination a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
                $('.auto-links-results').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.auto-links-results').html(data);
            }
        });
    })); 
});

$('document').ready(function() {
    $('.auto-links-results').delegate('input[name*="autolinks_ids"]', 'change', (function(e){
        if ($('input[name*="autolinks_ids"]:checked').length > 0) {
            $('.autolinks-options').show(500);
        } else {
            $('.autolinks-options').hide(500);
        }
       
        
    })); 
});

function deleteAutoLinks() {
    var links = $('input[name*="autolinks_ids"]:checked');
    
    if (links.length > 0) {
        bootbox.confirm({
            title: text_delete,
            message: text_delete_a_confirmation,
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
                        url: "index.php?route=" + modulePath + "/remove_autolinks&store_id=" + storeId + "&" + token_string + "=" + token,
                        type: 'POST',
                        data: { results : links.serializeArray() },
                        dataType: 'JSON',
                        beforeSend: function() {
                            $('.auto-links-results').html('<br /><div class="loader"></div>');
                        },
                        success: function(json) { 
                            if (json['success']) {
                                $('.auto-links-results').load("index.php?route=" + modulePath + "/tab_autolinks&store_id=" + storeId + "&" + token_string + "=" + token);
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
	
