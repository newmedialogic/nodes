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
