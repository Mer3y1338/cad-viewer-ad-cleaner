window.menuTree = [
  { key: 'newFeatures', label: 'New Features', href: 'New Features.html', children: [] },
  { key: 'overview', label: 'Software overview', children: [
    { key: 'overview_intro', label: 'Introduction and System Requirements', href: 'Introduction.html' },
    { key: 'overview_account', label: 'Account and payment', href: 'Account and payment.html' },
    { key: 'overview_multiLang', label: 'Multi-language switching', href: './Multi-language switching.html' }
  ]},
  { key: 'ui', label: 'Interface', children: [
    { key: 'ui_home', label: 'Home', href: 'Home.html' },
    { key: 'ui_file', label: 'Files', href: 'Local.html' },
    { key: 'ui_cloud', label: 'My Cloud', href: 'My Cloud.html' },
    // { key: 'ui_project', label: 'Collaboration', href: './DwgChat.html' },
    { key: 'ui_new', label: '+', href: './New.html' },
    { key: 'ui_leftMenu', label: 'Menu', children: [
      { key: 'ui_leftMenu_menu', label: 'Menu', href: './Menu.html' },
      { key: 'ui_leftMenu_settings', label: 'Settings', href: './Settings/Setting.html' }
    ]}
  ]},
  { key: 'view2d', label: '2D Work Mode', children: [
    { key: 'view2d_view', label: 'View Mode', href: './Drawing mode (2D drawing)/View Mode.html' },
    { key: 'view2d_edit', label: 'Edit Mode', href: './Drawing mode (2D drawing)/Edit Mode.html' }
  ]},
  { key: 'view3d', label: 'View 3D models', href: 'View 3D models.html', children: [] },
  { key: 'gesture', label: 'Gesture and Auxiliary Display', children: [
    { key: 'gesture_gesture', label: 'Gesture', href: './View mode/Gesture.html' },
    { key: 'gesture_mouse', label: 'Simulated Mouse', href: './View mode/Simulated Mouse.html' },
    { key: 'gesture_display', label: 'Display', href: './View mode/Display.html' }
  ]},
  { key: 'drawEdit', label: 'Function Description', children: [
    { key: 'drawEdit_draw', label: 'Drafting in Edit Mode', href: './Function Description/Draw Steps.html' },
    { key: 'drawEdit_edit', label: 'Editing in Edit Mode', children: [
      { key: 'drawEdit_edit_select', label: 'Select and Deselect', href: './Function Description/Select and Deselect.html' },
      { key: 'drawEdit_edit_one', label: 'Edit One', href: './Function Description/Edit One.html' },
      { key: 'drawEdit_edit_multi', label: 'Multiple Edit', href: './Function Description/Multiple Edit.html' }
    ]}
  ]},
  { key: 'cmdCommon', label: 'General commands', children: [
    { key: 'cmdCommon_color', label: 'Color', href: './Command Reference/Color.html' },
    { key: 'cmdCommon_layout', label: 'Layout', href: './Command Reference/Layout.html' },
    { key: 'cmdCommon_style', label: 'Visual Style', href: './Command Reference/Visual Style.html' },
    { key: 'cmdCommon_export', label: 'Export', href: './Command Reference/Export.html' },
    { key: 'cmdCommon_regen', label: 'Regen', href: 'Command Reference/Regen.html' },
    { key: 'cmdCommon_split', label: 'Multiple DWG View', href: 'Command Reference/Split View.html' },
    { key: 'cmdCommon_words', label: 'Insert Userful Words', href: 'Command Reference/Useful Words.html' },
    { key: 'cmdCommon_pdf2cad', label: 'PDF to CAD', href: 'Command Reference/PDF to CAD.html' }
  ]},
  { key: 'cmdAnnot', label: 'Annotation Commands', children: [
    { key: 'cmdAnnot_anno', label: 'Annotation Description', href: 'Command Reference/Annotation.html' },
    { key: 'cmdAnnot_sketch', label: 'Sketch', href: 'Command Reference/Annotation_sketch.html' },
    { key: 'cmdAnnot_arrow', label: 'Arrow', href: 'Command Reference/Annotation_arrow.html' },
    { key: 'cmdAnnot_text', label: 'Text', href: 'Command Reference/Annotation_text.html' },
    { key: 'cmdAnnot_cloud', label: 'Revcloud', href: 'Command Reference/Annotation_revcloud.html' },
    { key: 'cmdAnnot_audio', label: 'Audio', href: 'Command Reference/Annotation_recording.html' },
    { key: 'cmdAnnot_image', label: 'Image', href: 'Command Reference/Annotation_image.html' },
    { key: 'cmdAnnot_video', label: 'Video', href: 'Command Reference/Annotation_video.html' },
    { key: 'cmdAnnot_leader', label: 'Leader', href: 'Command Reference/Annotation_leader.html' },
    { key: 'cmdAnnot_line', label: 'Line', href: 'Command Reference/Annotation_line.html' },
    { key: 'cmdAnnot_rect', label: 'Rectangle', href: 'Command Reference/Annotation_rectangle.html' },
    { key: 'cmdAnnot_ellipse', label: 'Ellipse', href: 'Command Reference/Annotation_ellipse.html' },
    { key: 'cmdAnnot_number', label: 'Number', href: 'Command Reference/Annotation_Number.html' }
  ]},
  { key: 'cmdDraw', label: 'Drafting Commands', children: [
    { key: 'cmdDraw_polyline', label: 'Polyline', href: './Command Reference/Polyline.html' },
    { key: 'cmdDraw_line', label: 'Line', href: './Command Reference/Line.html' },
    { key: 'cmdDraw_circle', label: 'Circle', href: './Command Reference/Circle.html' },
    { key: 'cmdDraw_arc', label: 'Arc', href: './Command Reference/Arc.html' },
    { key: 'cmdDraw_rect', label: 'Rectangle', href: './Command Reference/Rectangle.html' },
    { key: 'cmdDraw_ellipse', label: 'Ellipse', href: './Command Reference/Ellipse.html' },
    { key: 'cmdDraw_cloud', label: 'Revcloud', href: './Command Reference/Revcloud.html' },
    { key: 'cmdDraw_sketch', label: 'Sketch', href: './Command Reference/Sketch.html' },
    { key: 'cmdDraw_smartpen', label: 'Smart Pen', href: './Command Reference/Smart Pen.html' },
    { key: 'cmdDraw_text', label: 'Text', href: './Command Reference/Text.html' },
    { key: 'cmdDraw_note', label: 'Multileader', href: './Command Reference/Notation.html' },
    { key: 'cmdDraw_divide', label: 'Divide', href: './Command Reference/Divide.html' },
    { key: 'cmdDraw_hatch', label: 'Hatch', href: './Command Reference/Hatch.html' }
  ]},
  { key: 'cmdMeasure', label: 'Measure Commands', children: [
    { key: 'cmdMeasure_distance', label: 'Distance', href: './Command Reference/Distance.html' },
    { key: 'cmdMeasure_continuous', label: 'Continuous', href: './Command Reference/Distance_Continuous.html' },
    { key: 'cmdMeasure_batch', label: 'Batch', href: './Command Reference/Batch.html' },
    { key: 'cmdMeasure_area', label: 'Area', href: './Command Reference/Area.html' },
    { key: 'cmdMeasure_lateral', label: 'Facade', href: './Command Reference/Lateral Area.html' },
    { key: 'cmdMeasure_id', label: 'ID Point', href: './Command Reference/ID.html' },
    { key: 'cmdMeasure_arclen', label: 'Arc length', href: './Command Reference/Arc length.html' },
    { key: 'cmdMeasure_entity', label: 'Entity', href: './Command Reference/Entity.html' },
    { key: 'cmdMeasure_angle', label: 'Angle', href: './Command Reference/Angle.html' },
    { key: 'cmdMeasure_scale', label: 'Scale', href: './Command Reference/Scale.html' },
    { key: 'cmdMeasure_result', label: 'Result', href: './Command Reference/Result.html' },
    { key: 'cmdMeasure_stat', label: 'Statistic Result', href: './Command Reference/Statistic_Result.html' },
    { key: 'cmdMeasure_precision', label: 'Precision', href: './Command Reference/Precision.html' }
  ]},
  { key: 'cmdLayer', label: 'Layer Commands', children: [
    { key: 'cmdLayer_new', label: 'New Layer', href: './Command Reference/New Layer.html' },
    { key: 'cmdLayer_list', label: 'Layer List', href: './Command Reference/Layer List.html' },
    { key: 'cmdLayer_off', label: 'Layer Off', href: 'Command Reference/Layer Off.html' },
    { key: 'cmdLayer_offOther', label: 'Off Other layers', href: './Command Reference/Off Other layers.html' },
    { key: 'cmdLayer_prev', label: 'Layer Previous', href: './Command Reference/Layer Previous.html' },
    { key: 'cmdLayer_onAll', label: 'Turn All Layers On', href: './Command Reference/Turn All Layers On.html' },
    { key: 'cmdLayer_current', label: 'Make Layer Current', href: './Command Reference/Make Layer Current.html' }
  ]},
  { key: 'cmdDim', label: 'Dimension commands', children: [
    { key: 'cmdDim_aligned', label: 'Aligned', href: './Command Reference/Dimaligned.html' },
    { key: 'cmdDim_linear', label: 'Linear', href: 'Command Reference/Dimlinear.html' },
    { key: 'cmdDim_angular', label: 'Angular', href: 'Command Reference/Dimangular.html' },
    { key: 'cmdDim_radius', label: 'Radius', href: 'Command Reference/Dimradius.html' },
    { key: 'cmdDim_diameter', label: 'Diameter', href: 'Command Reference/Dimdiameter.html' },
    { key: 'cmdDim_arc', label: 'Arc Length', href: 'Command Reference/Dimarc.html' },
    { key: 'cmdDim_arc3pt', label: 'Arc Length by 3 points', href: 'Command Reference/Dimarc_3points.html' }
  ]},
  { key: 'cmdEdit', label: 'Editing Commands', children: [
    { key: 'cmdEdit_text', label: 'Edit Text', href: './Command Reference/Edit Text.html' },
    { key: 'cmdEdit_textHeight', label: 'Text Height', href: './Command Reference/Text_height.html' },
    { key: 'cmdEdit_delete', label: 'Delete', href: './Command Reference/Delete.html' },
    { key: 'cmdEdit_copy', label: 'Copy', href: './Command Reference/Copy.html' },
    { key: 'cmdEdit_move', label: 'Move', href: './Command Reference/Move.html' },
    { key: 'cmdEdit_explode', label: 'Explode', href: './Command Reference/Explode.html' },
    { key: 'cmdEdit_newBlock', label: 'New block', href: './Command Reference/New_block_Edit.html' },
    { key: 'cmdEdit_addBlock', label: 'Add block', href: './Command Reference/Add_block.html' },
    { key: 'cmdEdit_rotate', label: 'Rotate', href: './Command Reference/Rotate.html' },
    { key: 'cmdEdit_mirror', label: 'Mirror', href: './Command Reference/Mirror.html' },
    { key: 'cmdEdit_scale', label: 'Scale', href: './Command Reference/Scale_base_point.html' },
    { key: 'cmdEdit_color', label: 'Color', href: './Command Reference/Edit Color.html' },
    { key: 'cmdEdit_linetype', label: 'Modify Linetype', href: './Command Reference/Modify Linetype.html' },
    { key: 'cmdEdit_undo', label: 'Undo', href: './Command Reference/Undo.html' },
    { key: 'cmdEdit_redo', label: 'Redo', href: './Command Reference/Redo.html' },
    { key: 'cmdEdit_trim', label: 'Trim', href: './Command Reference/Trim.html' },
    { key: 'cmdEdit_extend', label: 'Extend', href: './Command Reference/Extend.html' },
    { key: 'cmdEdit_offset', label: 'Offset', href: './Command Reference/Offset.html' },
    { key: 'cmdEdit_fillet', label: 'Fillet', href: './Command Reference/Fillet.html' },
    { key: 'cmdEdit_chamfer', label: 'Chamfer', href: './Command Reference/Chamfer.html' },
    { key: 'cmdEdit_attr', label: 'Edit Block Attribute', href: './Command Reference/Edit Block Attribute.html' },
    { key: 'cmdEdit_linetypeSet', label: 'Linetype Settings', href: './Command Reference/Linetype.html' },
    { key: 'cmdEdit_ChangeLayer', label: 'Change Layer', href: './Command Reference/Change Layer.html' }
  ]},
  { key: 'toolbox', label: 'Toolbox', children: [
    { key: 'toolbox_find', label: 'Find Text', href: './Command Reference/Find.html' },
    { key: 'toolbox_incremental', label: 'Incremental Copy', href: 'Command Reference/Incremental_Copy.html' },
    { key: 'toolbox_count', label: 'Count Block', href: 'Command Reference/Count Block.html' },
    { key: 'toolbox_pattern', label: 'Find Graphic', href: 'Command Reference/CountPattern.html' },
    { key: 'toolbox_insert', label: 'Insert Block', href: 'Command Reference/Insert Block.html' },
    { key: 'toolbox_annoFind', label: 'Find Annotation', href: './Command Reference/Annotation_find.html' },
    { key: 'toolbox_bookmark', label: 'View Tag', href: 'Command Reference/Bookmark.html' },
    { key: 'toolbox_copy', label: 'Copy', href: 'Command Reference/Copy_C.html' },
    { key: 'toolbox_paste', label: 'Paste', href: 'Command Reference/Paste_C.html' }
  ]}
]; 