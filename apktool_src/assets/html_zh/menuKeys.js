window.menuTree = [
  {
    key: 'newFeatures', label: '新版必读', href: 'New Features.html', children: []
  },
  {
    key: 'overview', label: '软件概况', children: [
      { key: 'overview_intro', label: '软件介绍及系统要求', href: 'Introduction.html' },
      { key: 'overview_account', label: '账户及收费', href: 'Account and payment.html' },
      { key: 'overview_multiLang', label: '多语言', href: './Multi-language switching.html' }
    ]
  },
  {
    key: 'ui', label: '用户界面', children: [
      { key: 'ui_home', label: '首页', href: 'Home.html' },
      { key: 'ui_file', label: '文件', href: 'Local.html' },
      { key: 'ui_cloud', label: '云图', href: 'My Cloud.html' },
      { key: 'ui_project', label: '项目', href: './DwgChat.html' },
      { key: 'ui_new', label: '+', href: './New.html' },
      {
        key: 'ui_leftMenu', label: '左侧菜单', children: [
          { key: 'ui_leftMenu_menu', label: '菜单', href: './Menu.html' },
          { key: 'ui_leftMenu_settings', label: '设置', href: './Settings/Setting.html' }
        ]
      }
    ]
  },
  {
    key: 'view2d', label: '2D览图及功能介绍', children: [
      { key: 'view2d_view', label: '看图模式及其功能介绍', href: './Drawing mode (2D drawing)/View Mode.html' },
      { key: 'view2d_edit', label: '编辑模式及其功能介绍', href: './Drawing mode (2D drawing)/Edit Mode.html' }
    ]
  },
  {
    key: 'view3d', label: '3D览图及功能介绍', href: 'View 3D models.html', children: []
  },
  {
    key: 'gesture', label: '手势及辅助显示', children: [
      { key: 'gesture_gesture', label: '手势', href: './View mode/Gesture.html' },
      { key: 'gesture_mouse', label: '模拟鼠标', href: './View mode/Simulated Mouse.html' },
      { key: 'gesture_display', label: '辅助显示', href: './View mode/Display.html' }
    ]
  },
  {
    key: 'drawEdit', label: '绘图及编辑', children: [
      { key: 'drawEdit_draw', label: '绘制图形', href: './Function Description/Draw Steps.html' },
      {
        key: 'drawEdit_edit', label: '编辑图形', children: [
          { key: 'drawEdit_edit_select', label: '选择与弃选', href: './Function Description/Select and Deselect.html' },
          { key: 'drawEdit_edit_one', label: '编辑单个实体', href: './Function Description/Edit One.html' },
          { key: 'drawEdit_edit_multi', label: '编辑多个实体', href: './Function Description/Multiple Edit.html' }
        ]
      }
    ]
  },
  {
    key: 'cmdCommon', label: '通用命令', children: [
      { key: 'cmdCommon_color', label: '颜色', href: './Command Reference/Color.html' },
      { key: 'cmdCommon_layout', label: '布局', href: './Command Reference/Layout.html' },
      { key: 'cmdCommon_style', label: '视觉样式', href: './Command Reference/Visual Style.html' },
      { key: 'cmdCommon_export', label: '导出', href: './Command Reference/Export.html' },
      { key: 'cmdCommon_regen', label: '重生成', href: 'Command Reference/Regen.html' },
      { key: 'cmdCommon_split', label: '多图查看', href: 'Command Reference/Split View.html' },
      { key: 'cmdCommon_words', label: '常用词', href: 'Command Reference/Useful Words.html' },
      { key: 'cmdCommon_pdf2cad', label: 'PDF 转 CAD', href: 'Command Reference/PDF to CAD.html' }
    ]
  },
  {
    key: 'cmdAnnot', label: '批注命令', children: [
      { key: 'cmdAnnot_anno', label: '批注功能说明', href: 'Command Reference/Annotation.html' },
      { key: 'cmdAnnot_sketch', label: '手绘线', href: 'Command Reference/Annotation_sketch.html' },
      { key: 'cmdAnnot_arrow', label: '箭头', href: 'Command Reference/Annotation_arrow.html' },
      { key: 'cmdAnnot_text', label: '文字', href: 'Command Reference/Annotation_text.html' },
      { key: 'cmdAnnot_cloud', label: '云线', href: 'Command Reference/Annotation_revcloud.html' },
      { key: 'cmdAnnot_audio', label: '音频', href: 'Command Reference/Annotation_recording.html' },
      { key: 'cmdAnnot_image', label: '图片', href: 'Command Reference/Annotation_image.html' },
      { key: 'cmdAnnot_video', label: '视频', href: 'Command Reference/Annotation_video.html' },
      { key: 'cmdAnnot_leader', label: '引线', href: 'Command Reference/Annotation_leader.html' },
      { key: 'cmdAnnot_line', label: '直线', href: 'Command Reference/Annotation_line.html' },
      { key: 'cmdAnnot_rect', label: '矩形', href: 'Command Reference/Annotation_rectangle.html' },
      { key: 'cmdAnnot_ellipse', label: '椭圆', href: 'Command Reference/Annotation_ellipse.html' },
      { key: 'cmdAnnot_number', label: '编号', href: 'Command Reference/Annotation_number.html' }
    ]
  },
  {
    key: 'cmdDraw', label: '绘制命令', children: [
      { key: 'cmdDraw_polyline', label: '多段线', href: './Command Reference/Polyline.html' },
      { key: 'cmdDraw_line', label: '单段线', href: './Command Reference/Line.html' },
      { key: 'cmdDraw_circle', label: '圆', href: './Command Reference/Circle.html' },
      { key: 'cmdDraw_arc', label: '圆弧', href: './Command Reference/Arc.html' },
      { key: 'cmdDraw_rect', label: '矩形', href: './Command Reference/Rectangle.html' },
      { key: 'cmdDraw_ellipse', label: '椭圆', href: './Command Reference/Ellipse.html' },
      { key: 'cmdDraw_cloud', label: '云线', href: './Command Reference/Revcloud.html' },
      { key: 'cmdDraw_sketch', label: '手绘线', href: './Command Reference/Sketch.html' },
      { key: 'cmdDraw_smartpen', label: '智能笔', href: './Command Reference/Smart Pen.html' },
      { key: 'cmdDraw_text', label: '文字', href: './Command Reference/Text.html' },
      { key: 'cmdDraw_note', label: '注释', href: './Command Reference/Notation.html' },
      { key: 'cmdDraw_divide', label: '定数等分', href: './Command Reference/Divide.html' },
      { key: 'cmdDraw_hatch', label: '填充', href: './Command Reference/Hatch.html' }
    ]
  },
  {
    key: 'cmdMeasure', label: '测量命令', children: [
      { key: 'cmdMeasure_distance', label: '测长度', href: './Command Reference/Distance.html' },
      { key: 'cmdMeasure_continuous', label: '连续测', href: './Command Reference/Distance_Continuous.html' },
      { key: 'cmdMeasure_batch', label: '批量测线', href: './Command Reference/Batch.html' },
      { key: 'cmdMeasure_area', label: '测面积', href: './Command Reference/Area.html' },
      { key: 'cmdMeasure_lateral', label: '测立面', href: './Command Reference/Lateral Area.html' },
      { key: 'cmdMeasure_id', label: '测坐标', href: './Command Reference/ID.html' },
      { key: 'cmdMeasure_arclen', label: '测弧长', href: './Command Reference/Arc length.html' },
      { key: 'cmdMeasure_entity', label: '测实体', href: './Command Reference/Entity.html' },
      { key: 'cmdMeasure_angle', label: '测角度', href: './Command Reference/Angle.html' },
      { key: 'cmdMeasure_scale', label: '设比例', href: './Command Reference/Scale.html' },
      { key: 'cmdMeasure_result', label: '看结果', href: './Command Reference/Result.html' },
      { key: 'cmdMeasure_stat', label: '结果统计', href: './Command Reference/Statistic_Result.html' },
      { key: 'cmdMeasure_precision', label: '精度', href: './Command Reference/Precision.html' }
    ]
  },
  {
    key: 'cmdLayer', label: '图层命令', children: [
      { key: 'cmdLayer_new', label: '新建图层', href: './Command Reference/New Layer.html' },
      { key: 'cmdLayer_list', label: '图层列表', href: './Command Reference/Layer List.html' },
      { key: 'cmdLayer_off', label: '关闭图层', href: 'Command Reference/Layer Off.html' },
      { key: 'cmdLayer_offOther', label: '关闭其它', href: './Command Reference/Off Other layers.html' },
      { key: 'cmdLayer_prev', label: '上一图层', href: './Command Reference/Layer Previous.html' },
      { key: 'cmdLayer_onAll', label: '全部打开', href: './Command Reference/Turn All Layers On.html' },
      { key: 'cmdLayer_current', label: '置为当前', href: './Command Reference/Make Layer Current.html' }
    ]
  },
  {
    key: 'cmdDim', label: '标注命令', children: [
      { key: 'cmdDim_aligned', label: '对齐标注', href: './Command Reference/Dimaligned.html' },
      { key: 'cmdDim_linear', label: '线性标注', href: 'Command Reference/Dimlinear.html' },
      { key: 'cmdDim_angular', label: '角度标注', href: 'Command Reference/Dimangular.html' },
      { key: 'cmdDim_radius', label: '半径标注', href: 'Command Reference/Dimradius.html' },
      { key: 'cmdDim_diameter', label: '直径标注', href: 'Command Reference/Dimdiameter.html' },
      { key: 'cmdDim_arc', label: '弧长标注', href: 'Command Reference/Dimarc.html' },
      { key: 'cmdDim_arc3pt', label: '三点圆弧', href: 'Command Reference/Dimarc_3points.html' }
    ]
  },
  {
    key: 'cmdEdit', label: '编辑命令', children: [
      { key: 'cmdEdit_text', label: '编辑文字', href: './Command Reference/Edit Text.html' },
      { key: 'cmdEdit_textHeight', label: '字高', href: './Command Reference/Text_height.html' },
      { key: 'cmdEdit_delete', label: '删除', href: './Command Reference/Delete.html' },
      { key: 'cmdEdit_copy', label: '复制', href: './Command Reference/Copy.html' },
      { key: 'cmdEdit_move', label: '移动', href: './Command Reference/Move.html' },
      { key: 'cmdEdit_explode', label: '分解', href: './Command Reference/Explode.html' },
      { key: 'cmdEdit_newBlock', label: '新建图块', href: './Command Reference/New_block_Edit.html' },
      { key: 'cmdEdit_addBlock', label: '图块入库', href: './Command Reference/Add_block.html' },
      { key: 'cmdEdit_rotate', label: '旋转', href: './Command Reference/Rotate.html' },
      { key: 'cmdEdit_mirror', label: '镜像', href: './Command Reference/Mirror.html' },
      { key: 'cmdEdit_scale', label: '缩放', href: './Command Reference/Scale_base_point.html' },
      { key: 'cmdEdit_color', label: '颜色', href: './Command Reference/Edit Color.html' },
      { key: 'cmdEdit_linetype', label: '线型', href: './Command Reference/Modify Linetype.html' },
      { key: 'cmdEdit_undo', label: '撤销', href: './Command Reference/Undo.html' },
      { key: 'cmdEdit_redo', label: '重做', href: './Command Reference/Redo.html' },
      { key: 'cmdEdit_trim', label: '修剪', href: './Command Reference/Trim.html' },
      { key: 'cmdEdit_extend', label: '延伸', href: './Command Reference/Extend.html' },
      { key: 'cmdEdit_offset', label: '偏移', href: './Command Reference/Offset.html' },
      { key: 'cmdEdit_fillet', label: '圆角', href: './Command Reference/Fillet.html' },
      { key: 'cmdEdit_chamfer', label: '倒角', href: './Command Reference/Chamfer.html' },
      { key: 'cmdEdit_attr', label: '编辑属性', href: './Command Reference/Edit Block Attribute.html' },
      { key: 'cmdEdit_linetypeSet', label: '线型设置', href: './Command Reference/Linetype.html' },
      { key: 'cmdEdit_changelayer', label: '改图层', href: './Command Reference/Change Layer.html' }
    ]
  },
  {
    key: 'toolbox', label: '工具箱', children: [
      { key: 'toolbox_find', label: '文字查找', href: './Command Reference/Find.html' },
      { key: 'toolbox_incremental', label: '文字递增', href: 'Command Reference/Incremental_Copy.html' },
      { key: 'toolbox_annoFind', label: '批注查找', href: './Command Reference/Annotation_find.html' },
      { key: 'toolbox_label', label: '标坐标', href: 'Command Reference/Label Coordinate.html' },
      { key: 'toolbox_insert', label: '插入图块', href: 'Command Reference/Insert Block.html' },
      { key: 'toolbox_count', label: '块统计', href: 'Command Reference/Count Block.html' },
      { key: 'toolbox_pattern', label: '图形查找', href: 'Command Reference/CountPattern.html' },
      { key: 'toolbox_bookmark', label: '书签', href: 'Command Reference/Bookmark.html' },
      { key: 'toolbox_copy', label: '跨图复制', href: 'Command Reference/Copy_C.html' },
      { key: 'toolbox_paste', label: '跨图粘贴', href: 'Command Reference/Paste_C.html' }
    ]
  }
]; 