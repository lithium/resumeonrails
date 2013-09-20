CKEDITOR.editorConfig = function(config) {

  config.width = '520px';

  config.toolbar = 'Basic';
  config.toolbar_Basic = [
    { name: 'basicstyles', items : [ 'Format','Bold','Italic','Underline',
                                     '-', 'NumberedList','BulletedList','-','Outdent','Indent',
                                     '-', 'JustifyLeft','JustifyCenter','JustifyRight' ] },
    { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','Source' ] }

  ];

};