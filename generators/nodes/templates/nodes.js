/**
 * TinyMCE Support for the Nodes CMS
 *
 * This file contains the bulk of the code that enables TinyMCE and the Nodes server-side code to interact.
 * First, we initialize TinyMCE for all textarea.nodesWYSIWYG elements.
 * Secondly, we define a TinyMCE plugin that adds buttons to the interface.
 *
 * Once one of those buttons is clicked, we're mostly dealing with server-side code in a popup window.
 * The views of those controllers utilize some TinyMCE javascript helpers, but that code will not be found
 * in this file.
 */
tinyMCE.init({
  document_base_url: '/',
  relative_urls: false,
  theme : "advanced",
  media_strict: false,
  plugins : "-nodes,flash,media",
  // content_css: "/stylesheets/application.css",
  theme_advanced_toolbar_location: "top",
  theme_advanced_statusbar_location: "bottom",
  theme_advanced_resizing: true,
  theme_advanced_disable : "cut,copy,help",
  theme_advanced_toolbar_align: "left",
  theme_advanced_buttons1: "bold,italic,underline,justifyleft,justifycenter,justifyright,bullist,numlist,link,unlink",
  theme_advanced_buttons2: "nodeImage,nodeAttachment", // ",nodeVideo",
  theme_advanced_buttons3: "indent,outdent,formatselect,code,cleanup",
  mode : "specific_textareas",
  auto_cleanup_word : true,
  paste_auto_cleanup_on_paste : true,
  flash_wmode : "transparent",
  flash_quality : "high",
  flash_menu : "false",  
  remove_linebreaks : false,
  editor_selector: /nodesWYSIWYG/,
  extended_valid_elements: "style[type],object[width|height|classid|codebase],param[name|value],embed[src|type|width|height|flashvars|wmode]",
  width: "560"
});


/**
 * NodePlugin Definition
 */
tinymce.create('tinymce.plugins.NodePlugin', {
  init : function(ed, url) {

    // Register commands
    ed.addCommand('openNodeImageDialog', function() {
      // Internal image object like a flash placeholder
      if (ed.dom.getAttrib(ed.selection.getNode(), 'class').indexOf('mceItem') != -1)
        return;

      ed.windowManager.open({
        file : '/node_images',
        width : 480,
        height : 385,
        inline : 1
      }, {
        plugin_url : url
      });
    });

    ed.addCommand('openNodeVideoDialog', function() {
      // internal image object like a flash placeholder
      if(ed.dom.getAttrib(ed.selection.getNode(), 'class').indexOf('mceitem') != -1)
        return

      ed.windowManager.open({
        file: '/node_videos',
        width: 480,
        height: 385,
        inline: 1
      }, { 
        plugin_url : url
      }); 
    });

    ed.addCommand('openNodeAttachmentDialog', function() {
      // internal image object like a flash placeholder
      if(ed.dom.getAttrib(ed.selection.getNode(), 'class').indexOf('mceitem') != -1)
        return

      if(ed.dom.getAttrib(ed.selection.getNode(), 'id').indexOf('NodeAttachment') != -1) {

        var attachment_id = ed.dom.getAttrib(ed.selection.getNode(), 'id').replace(/\D+/, '');

        ed.windowManager.open({
          file: '/node_attachments/' + attachment_id + '/edit',
          width: 480,
          height: 385,
          inline: 1
        }, {
          plugin_url : url
        });
      } else {
        ed.windowManager.open({
          file: '/node_attachments',
          width: 480,
          height: 385,
          inline: 1
        }, { 
          plugin_url : url
        }); 
      }
    });

    // Register buttons
    ed.addButton('nodeImage', {
      title:   'Insert Image',
      cmd:     'openNodeImageDialog',
      'class': 'nodeButton nodeImageButton' 
    });

    ed.addButton('nodeVideo', {
      title:   'Embed Video',
      cmd:     'openNodeVideoDialog',
      'class': 'nodeButton nodeVideoButton'
    });

    ed.addButton('nodeAttachment', {
      title:   'Insert Attachment',
      cmd:     'openNodeAttachmentDialog',
      'class': 'nodeButton nodeAttachmentButton'
    });
  },

  getInfo : function() {
    return {
      longname : 'Advanced image',
      author : 'Moxiecode Systems AB',
      authorurl : 'http://tinymce.moxiecode.com',
      infourl : 'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/advimage',
      version : tinymce.majorVersion + "." + tinymce.minorVersion
    };
  }
});

// Register plugin
tinymce.PluginManager.add('nodes', tinymce.plugins.NodePlugin);

$(document).ready(function() {
  $('ul.NodeImageSizeLinks a').click(function() {

    var image_id   = this.id.replace(/\D+/, '');
    var image_path = this.href;

    var ed = tinyMCEPopup.editor;
    tinyMCEPopup.restoreSelection();

    if(tinymce.isWebKit)
      ed.getWin().focus();

    var args = {};
    tinymce.extend(args, {
      src: image_path 
    });

    var el = ed.selection.getNode();
    ed.execCommand('mceInsertContent', false, '<img id="__mce_tmp" />', {skip_undo: 1});
    ed.dom.setAttribs('__mce_tmp', args);
    ed.dom.setAttrib('__mce_tmp', 'id', 'NodeImage' + image_id);
    ed.undoManager.add();
    tinyMCEPopup.close();

    return false;
  });
});
