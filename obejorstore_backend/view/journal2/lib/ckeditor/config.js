/**
 * @license Copyright (c) 2003-2014, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

var allPlugins = ['a11yhelp','about','clipboard','codemirror','colordialog','dialog','div','fakeobjects','find','flash','forms','iframe','image','link','liststyle','magicline','pagebreak','pastefromword','preview','scayt','showblocks','smiley','sourcedialog','specialchar','syntaxhighlight','table','tabletools','templates','wsc'];
var plugins = ['a11yhelp','about','div','find','flash','forms','language','pagebreak','preview','print','newpage','save','smiley','sourcearea','templates'];

CKEDITOR.editorConfig = function( config ) {

    config.extraPlugins  = 'sourcedialog';

    config.removePlugins = eval('plugins.join(",")');

    config.allowedContent = true;

//    config.removePlugins = 'sourcearea,clipboard,forms,tools,others,about';

//    config.removePlugins = '';
//    config.removePlugins = 'others';
//    config.removePlugins = 'about';



//    config.toolbarGroups = [
//        { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
//        { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
//        { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
//        { name: 'forms' },
//        '/',
//        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
//        { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
//        { name: 'links' },
//        { name: 'insert' },
//        '/',
//        { name: 'styles' },

//    ];

//    config.removePlugins = 'forms';
//    config.removePlugins = 'sourcearea';
//    config.removePlugins = 'forms';
//    config.removePlugins = 'sourcearea';
//    config.removePlugins = 'forms';
//    config.removePlugins = 'sourcearea';
//    config.removePlugins = 'forms';

//    config.toolbar = 'Full';

//    config.toolbar_Full =
//        [
//            { name: 'document', items : [ 'Sourcedialog' ] },
//
//            { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
//
//            { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'] },
//
//            '/',
//            { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
//
//
//            { name: 'insert', items : [ 'Table','HorizontalRule','SpecialChar' ] },
//            { name: 'colors', items : [ 'TextColor','BGColor' ] },
//            '/',
//            { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
//            { name: 'links', items : [ 'Link'] },
//            { name: 'tools', items : [ 'ShowBlocks' ] }
//        ];



// Toolbar configuration generated automatically by the editor based on config.toolbarGroups.
//    config.toolbar = [
//        { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Sourcedialog'] },
//        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
//        { name: 'paragraph', groups: [ 'list', 'indent', 'blocks'], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent'] },
//        { name: 'paragraph', groups: [ 'align'], items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] },
//        { name: 'insert', items: ['SpecialChar'] },
//
////        { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
////        { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
////        { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
//        '/',
//        { name: 'clipboard', groups: [ 'undo' ], items: [ 'Undo', 'Redo' ] },
//        { name: 'styles', items: [ 'Font', 'FontSize' ] },
//        { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
//        { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
//        { name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule' ] },
////        '/',
//
//
////        { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
////        { name: 'others', items: [ '-' ] },
////        { name: 'about', items: [ 'About' ] }
//    ];
////
//////Toolbar groups configuration.
//    config.toolbarGroups = [
//        { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
//        { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
//        { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
//        { name: 'forms' },
//        '/',
//        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
//        { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
//        { name: 'links' },
//        { name: 'insert' },
//        '/',
//        { name: 'styles' },
//        { name: 'colors' },
//        { name: 'tools' },
//        { name: 'others' },
//        { name: 'about' }
//    ];
//    config.removePlugins = 'sourcearea';
//
//    config.extraPlugins = 'sourcedialog';
//    config.codemirror_theme = 'rubyblue';

};

CKEDITOR.dtd.$removeEmpty.span = 0;
CKEDITOR.dtd.$removeEmpty.i = 0;
CKEDITOR.dtd.$removeEmpty.ins = 0;
CKEDITOR.dtd.$removeEmpty.div = 0;
