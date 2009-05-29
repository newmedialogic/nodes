tinyMCE.init({
  theme : "advanced",
  // content_css: "/stylesheets/application.css",
  theme_advanced_toolbar_location: "top",
  theme_advanced_statusbar_location: "bottom",
  theme_advanced_resizing: true,
  theme_advanced_disable : "cut,copy,help",
  theme_advanced_toolbar_align: "left",
  theme_advanced_toolbar_buttons1: "bold,italic,underline,justifyleft,justifycenter,justifyright,bullist,numlist,link,unlink",
  theme_advanced_toolbar_buttons2: "indent,outdent,formatselect,code,cleanup",
  theme_advanced_toolbar_buttons3: "",
  mode : "specific_textareas",
  editor_selector: /nodesWYSIWYG/,
  width: "560"
});
