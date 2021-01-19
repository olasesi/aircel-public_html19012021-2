// Load some of the editor sub-tabs in the module
$(document).ready(function(e) {
    //Advanced Editor Products
    $.ajax({
        url: "index.php?route=" + modulePath + "/editor_products&" + token_string + "=" + token + "&store_id=" + storeId,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.editor-products').html(data);
        }
    });
    
    //Advanced Editor Categories
    $.ajax({
        url: "index.php?route=" + modulePath + "/editor_categories&" + token_string + "=" + token + "&store_id=" + storeId,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.editor-categories').html(data);
        }
    });
    
    //Advanced Editor Informations
    $.ajax({
        url: "index.php?route=" + modulePath + "/editor_informations&" + token_string + "=" + token + "&store_id=" + storeId,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.editor-informations').html(data);
        }
    });
    
    //Advanced Editor Informations
    $.ajax({
        url: "index.php?route=" + modulePath + "/editor_manufacturers&" + token_string + "=" + token + "&store_id=" + storeId,
        type: 'get',
        dataType: 'html',
        success: function(data) { 
            $('.editor-manufacturers').html(data);
        }
    });
    
});

// Pagination
$('document').ready(function() {
   
    // Products
    $('.editor-products').delegate('.pagination a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
               $('.editor-products').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.editor-products').html(data);
            }
        });
    })); 
    
    $('.editor-products').delegate('.nav-pills-languages a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
               $('.editor-products').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.editor-products').html(data);
            }
        });
    })); 
    
    // Categories
    $('.editor-categories').delegate('.pagination a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
               $('.editor-categories').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.editor-categories').html(data);
            }
        });
    })); 
    
    $('.editor-categories').delegate('.nav-pills-languages a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
               $('.editor-categories').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.editor-categories').html(data);
            }
        });
    })); 
    
    // Informations
    $('.editor-informations').delegate('.pagination a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
               $('.editor-informations').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.editor-informations').html(data);
            }
        });
    })); 
    
    $('.editor-informations').delegate('.nav-pills-languages a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
               $('.editor-informations').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.editor-informations').html(data);
            }
        });
    })); 
    
    // Manufacturers
    $('.editor-manufacturers').delegate('.pagination a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
               $('.editor-manufacturers').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.editor-manufacturers').html(data);
            }
        });
    })); 
    
    $('.editor-manufacturers').delegate('.nav-pills-languages a', 'click', (function(e){
        e.preventDefault();
        $.ajax({
            url: this.href,
            type: 'get',
            dataType: 'html',
            beforeSend: function() {
               $('.editor-manufacturers').html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
            },
            success: function(data) {				
                $('.editor-manufacturers').html(data);
            }
        });
    })); 
    
    $('body').delegate('.edit-field-input', 'keydown', (function(e) {
        if (e.keyCode == 13) {
			return false;
		}  
    }));
    
    $('body').delegate('.filter-form input', 'keydown', (function(e) {
        if (e.keyCode == 13) {
            var getFilterArea = $(this).parent().parent().data('view').replace('editor', 'filter');
			if (getFilterArea.length) {
                filterData('.' + getFilterArea);
            } else {
                return false;
            }
		}  
    }));
    
});

function editField(id, type, selector) {
    if ($(selector).find('textarea').length > 0) { return false; }

    var textValue = $(selector).find('span.editable').html().trim().replace(/'/g, "\\'").replace(/"/, "&quot;");
    var entityType = $(selector).parents('table.table-editor').data('type');
    var language_id = $(selector).parents('table.table-editor').data('language-id');
    var placement = $(selector).attr('id');

    var editableArea = '<div class="input-group-textarea">';
    editableArea += '<textarea style="resize: none"type="text"class="edit-field-input form-control">' + textValue.replace(/\\'/g, "'").replace(/"/, "&quot;") + '</textarea>';
    editableArea += '</div>';
    
    bootbox.confirm({
    title: "Edit Field",
    message: editableArea,
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
        var old_text = textValue;
        var newData = $('.input-group-textarea').find('textarea').val().trim();
        if(result){
            $.ajax({
            url: "index.php?route=" + modulePath + "/save_editor_field&" + token_string + "=" + token,
            type: 'post',
            data: {
                id: id, 
                field: type,
                language_id: language_id,
                entity_type: entityType,
                value: newData
            },
            dataType: 'JSON',
            beforeSend: function() {
                $('#' + placement).html('<div class="loader-small"></div>');
            },
            success: function(json) { 
                if (json['success']) {
                    $('#' + placement).html('<span class="editable">' + newData + '</span>'); 
                } else {
                    var Dialog = bootbox.alert({
                        title: text_error,
                        message: '<div class="text-left">' + json['error'] + '</div>'
                    });
                    $('#' + placement).html('<span class="editable">' + old_text + '</span>');
                }
            }
        });
        } else {
            return true;
        }
     
    }
});
    
}

function cancelField(placement, text) {
    $('#' + placement).html('<span class="editable">' + text + '</span>');
}

function saveField(id, type, placement, entityType, language_id, old_text, selector) {
    var newData = $(selector).parents('.input-group-textarea').find('textarea').val().trim();
    
    if (newData != old_text) {
        $.ajax({
            url: "index.php?route=" + modulePath + "/save_editor_field&" + token_string + "=" + token,
            type: 'post',
            data: {
                id: id, 
                field: type,
                language_id: language_id,
                entity_type: entityType,
                value: newData
            },
            dataType: 'JSON',
            beforeSend: function() {
                $('#' + placement).html('<div class="loader-small"></div>');
            },
            success: function(json) { 
                if (json['success']) {
                    $('#' + placement).html('<span class="editable">' + newData + '</span>'); 
                } else {
                    var Dialog = bootbox.alert({
                        title: text_error,
                        message: '<div class="text-left">' + json['error'] + '</div>'
                    });
                    $('#' + placement).html('<span class="editable">' + old_text + '</span>');
                }
            }
        });
    } else if (newData == old_text) {
        cancelField(placement, old_text);
    } else {
        var Dialog = bootbox.alert({
            title: text_error,
            message: '<div class="text-left">' + text_empty_field_alert + '</div>'
        });
    }
}

function filterData(selector) {
    var route = $(selector).data('route');
    var view = $(selector).data('view');
    
    var url = 'index.php?route=' + modulePath + '/' + route;

	var filter_name = $(selector + ' input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_keyword = $(selector + ' input[name=\'filter_keyword\']').val();

	if (filter_keyword) {
		url += '&filter_keyword=' + encodeURIComponent(filter_keyword);
	}

	var filter_meta_title = $(selector + ' input[name=\'filter_meta_title\']').val();

	if (filter_meta_title) {
		url += '&filter_meta_title=' + encodeURIComponent(filter_meta_title);
	}

	var filter_meta_description = $(selector + ' input[name=\'filter_meta_description\']').val();

	if (filter_meta_description) {
		url += '&filter_meta_description=' + encodeURIComponent(filter_meta_description);
	}

	var filter_meta_keywords = $(selector + ' input[name=\'filter_meta_keywords\']').val();

	if (filter_meta_keywords) {
		url += '&filter_meta_keywords=' + encodeURIComponent(filter_meta_keywords);
	}
    
    var filter_h1 = $(selector + ' input[name=\'filter_h1\']').val();

	if (filter_h1) {
		url += '&filter_h1=' + encodeURIComponent(filter_h1);
	}
    
    var filter_h2 = $(selector + ' input[name=\'filter_h2\']').val();

	if (filter_h2) {
		url += '&filter_h2=' + encodeURIComponent(filter_h2);
	}

    var language_id = $(selector + ' input[name=\'language_id\']').val();

    if (language_id) {
        url += '&language_id=' + encodeURIComponent(language_id);
    }
    
    var filter_limit = $(selector + ' select[name=\'filter_limit\'] option:selected').val();

    if (filter_limit) {
		url += '&filter_limit=' + encodeURIComponent(filter_limit);
	}

    $.ajax({
        url: url + "&" + token_string + "=" + token + "&store_id=" + storeId,
        type: 'get',
        dataType: 'html',
        beforeSend: function() {
            $('.' + view).html('<p><h2 class="text-center">' + text_loading_data + '</h2></p><br /><div class="loader"></div>');
        },
        success: function(data) { 
            $('.' + view).html(data);
        }
    });
}
