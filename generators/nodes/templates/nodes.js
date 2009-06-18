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
  plugins : "-nodes",
  // content_css: "/stylesheets/application.css",
  theme_advanced_toolbar_location: "top",
  theme_advanced_statusbar_location: "bottom",
  theme_advanced_resizing: true,
  theme_advanced_disable : "cut,copy,help",
  theme_advanced_toolbar_align: "left",
  theme_advanced_buttons1: "bold,italic,underline,justifyleft,justifycenter,justifyright,bullist,numlist,link,unlink",
  theme_advanced_buttons2: "nodeImage,nodeLink,nodeVideo",
  theme_advanced_buttons3: "indent,outdent,formatselect,code,cleanup",
  mode : "specific_textareas",
  editor_selector: /nodesWYSIWYG/,
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

    ed.addCommand('openNodeLinkDialog', function() {
      // internal image object like a flash placeholder
      if(ed.dom.getAttrib(ed.selection.getNode(), 'class').indexOf('mceitem') != -1)
        return

      ed.windowManager.open({
        file: '/node_links',
        width: 480,
        height: 385,
        inline: 1
      }, { 
        plugin_url : url
      }); 
    });

    // Register buttons
    ed.addButton('nodeImage', {
      title:   'Node Image',
      cmd:     'openNodeImageDialog',
      'class': 'nodeButton nodeImageButton' 
    });

    ed.addButton('nodeVideo', {
      title:   'Node Video',
      cmd:     'openNodeVideoDialog',
      'class': 'nodeButton nodeVideoButton'
    });

    ed.addButton('nodeLink', {
      title:   'Node Link',
      cmd:     'openNodeLinkDialog',
      'class': 'nodeButton nodeLinkButton'
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
