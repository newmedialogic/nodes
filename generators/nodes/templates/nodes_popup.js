$(document).ready(function() {

  $('ul.NodeAttachments a').click(function() {


    var attachment_id    = this.id.replace(/\D+/, '');
    var attachment_path  = this.href
    var attachment_title = $(this).text();

    var ed = tinyMCEPopup.editor;
    tinyMCEPopup.restoreSelection();

    if(tinymce.isWebKit)
      ed.getWin().focus();

    var args = {};
    tinymce.extend(args, {
      href: attachment_path
    });

    var el = ed.selection.getNode();
    // ed.selection.select(el);
    ed.execCommand('mceInsertContent', false, '<a id="__mce_tmp">' + attachment_title + '</a>', {skip_undo: 1});
    ed.dom.setAttribs('__mce_tmp', args);
    ed.dom.setAttrib('__mce_tmp', 'id', 'NodeAttachment' + attachment_id);
    ed.undoManager.add();
    tinyMCEPopup.close();

    return false;
  });

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
    // ed.selection.select(el);
    ed.execCommand('mceInsertContent', false, '<img id="__mce_tmp" />', {skip_undo: 1});
    ed.dom.setAttribs('__mce_tmp', args);
    ed.dom.setAttrib('__mce_tmp', 'id', 'NodeImage' + image_id);
    ed.undoManager.add();
    tinyMCEPopup.close();

    return false;
  });
});
