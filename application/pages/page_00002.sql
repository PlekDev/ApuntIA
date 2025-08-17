prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.7'
,p_default_workspace_id=>8063091551209590
,p_default_application_id=>103
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WEB'
);
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Gestion de documentos'
,p_alias=>'GESTION-DE-DOCUMENTOS'
,p_step_title=>'Gestion de documentos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8176731798235410)
,p_plug_name=>'Cargar Documento'
,p_title=>'Cargar Documento'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'APUNTIA_DOCUMENTS'
,p_query_where=>'document_id = -1'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8178516011235428)
,p_name=>'Documentos Cargados'
,p_title=>'Documentos Cargados'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    document_id,',
'    document_name,',
'    document_type,',
'    TO_CHAR(upload_date, ''DD/MM/YYYY HH24:MI'') as fecha_carga,',
'    user_id,',
'    CASE ',
unistr('        WHEN processed_text IS NOT NULL THEN ''\2705 Procesado'''),
unistr('        ELSE ''\274C Pendiente'''),
'    END as estado_procesamiento,',
'    LENGTH(processed_text) as caracteres_texto,',
'    CASE ',
unistr('        WHEN file_blob IS NOT NULL THEN ''\D83D\DCC4 ya los puedes probrar'''),
unistr('        ELSE ''\274C Sin archivo'''),
'    END as estado_archivo',
'FROM APUNTIA_DOCUMENTS',
'ORDER BY upload_date DESC'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8178657848235429)
,p_query_column_id=>1
,p_column_alias=>'DOCUMENT_ID'
,p_column_display_sequence=>10
,p_column_heading=>'Document Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8178755691235430)
,p_query_column_id=>2
,p_column_alias=>'DOCUMENT_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Document Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8178865582235431)
,p_query_column_id=>3
,p_column_alias=>'DOCUMENT_TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'Document Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8178954450235432)
,p_query_column_id=>4
,p_column_alias=>'FECHA_CARGA'
,p_column_display_sequence=>40
,p_column_heading=>'Fecha Carga'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8179074965235433)
,p_query_column_id=>5
,p_column_alias=>'USER_ID'
,p_column_display_sequence=>50
,p_column_heading=>'User Id'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8179167891235434)
,p_query_column_id=>6
,p_column_alias=>'ESTADO_PROCESAMIENTO'
,p_column_display_sequence=>60
,p_column_heading=>'Estado Procesamiento'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8179241567235435)
,p_query_column_id=>7
,p_column_alias=>'CARACTERES_TEXTO'
,p_column_display_sequence=>70
,p_column_heading=>'Caracteres Texto'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8179372527235436)
,p_query_column_id=>8
,p_column_alias=>'ESTADO_ARCHIVO'
,p_column_display_sequence=>80
,p_column_heading=>'Estado Archivo'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8180498371235447)
,p_plug_name=>'Mis Documentos'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    d.document_id,',
'    d.document_name,',
'    d.document_type,',
'    TO_CHAR(d.upload_date, ''DD/MM/YYYY HH24:MI'') as fecha_carga,',
'    CASE d.status',
'        WHEN ''PROCESSED'' THEN ''<span class="fa fa-check-circle" style="color: green;"></span> Procesado''',
'        WHEN ''PENDING'' THEN ''<span class="fa fa-clock-o" style="color: orange;"></span> Pendiente''',
'        WHEN ''ERROR'' THEN ''<span class="fa fa-times-circle" style="color: red;"></span> Error''',
'        ELSE d.status',
'    END as estado,',
'    (SELECT COUNT(*) FROM APUNTIA_CHUNKS c WHERE c.document_id = d.document_id) as fragmentos,',
unistr('    ROUND(LENGTH(d.processed_text)/1024, 2) || '' KB'' as tama\00F1o'),
'FROM APUNTIA_DOCUMENTS d',
'WHERE d.user_id = :APP_USER',
'ORDER BY d.upload_date DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(8180519769235448)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'WEB'
,p_internal_uid=>8180519769235448
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8180629209235449)
,p_db_column_name=>'DOCUMENT_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Document Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8180769033235450)
,p_db_column_name=>'DOCUMENT_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Document Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10840598762945501)
,p_db_column_name=>'DOCUMENT_TYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10840651228945502)
,p_db_column_name=>'FECHA_CARGA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Carga'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10840750463945503)
,p_db_column_name=>'ESTADO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10840845443945504)
,p_db_column_name=>'FRAGMENTOS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fragmentos'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10840948740945505)
,p_db_column_name=>unistr('TAMA\00D1O')
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Tama\00F1o')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10848408309958398)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'108485'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('DOCUMENT_ID:DOCUMENT_NAME:DOCUMENT_TYPE:FECHA_CARGA:ESTADO:FRAGMENTOS:TAMA\00D1O')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8993713211263782)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8126008590085522)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8178100904235424)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_button_name=>'Cargar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cargar Documento'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8176962573235412)
,p_name=>'P2_DOCUMENT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_source=>'DOCUMENT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8177083617235413)
,p_name=>'P2_FILE_UPLOAD'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_prompt=>'Selecciona archivo'
,p_source=>'DOCUMENT_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_multiple_files', 'Y',
  'display_as', 'INLINE',
  'file_types', '.pdf, .doc, .docx, .txt, .jpg, .png',
  'max_file_size', '10000',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8177107826235414)
,p_name=>'P2_DOCUMENT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_prompt=>'Document Type'
,p_source=>'DOCUMENT_TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8177205188235415)
,p_name=>'P2_UPLOAD_DATE'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_prompt=>'Upload Date'
,p_source=>'UPLOAD_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8177372354235416)
,p_name=>'P2_FILE_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_prompt=>'File Blob'
,p_source=>'FILE_BLOB'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8177469240235417)
,p_name=>'P2_PROCESSED_TEXT'
,p_data_type=>'CLOB'
,p_source_data_type=>'CLOB'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_prompt=>'Processed Text'
,p_source=>'PROCESSED_TEXT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8177593241235418)
,p_name=>'P2_METADATA'
,p_data_type=>'CLOB'
,p_source_data_type=>'CLOB'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_prompt=>'Metadata'
,p_source=>'METADATA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8177691444235419)
,p_name=>'P2_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_prompt=>'User Id'
,p_source=>'USER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8177704234235420)
,p_name=>'P2_COURSE_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_prompt=>'Course Id'
,p_source=>'COURSE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8177832178235421)
,p_name=>'P2_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_prompt=>'Status'
,p_source=>'STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8177907259235422)
,p_name=>'P2_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_item_source_plug_id=>wwv_flow_imp.id(8176731798235410)
,p_source=>'ROWID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8178039749235423)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar_Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_document_id NUMBER;',
'    v_blob BLOB;',
'    v_clob CLOB;',
'    v_filename VARCHAR2(500);',
'    v_mime_type VARCHAR2(200);',
'BEGIN',
'    SELECT blob_content, filename, mime_type',
'    INTO v_blob, v_filename, v_mime_type',
'    FROM apex_application_temp_files',
'    WHERE name = :P2_FILE_UPLOAD;',
'    ',
'    BEGIN',
'        v_clob := apex_util.blob_to_clob(v_blob);',
'    EXCEPTION',
'        WHEN OTHERS THEN',
'            v_clob := ''Contenido del archivo no disponible para procesamiento de texto.'';',
'    END;',
'    ',
'    v_clob := REGEXP_REPLACE(v_clob, ''[^[:print:][:space:]]'', '' '');',
'    ',
'    INSERT INTO APUNTIA_DOCUMENTS (',
'        document_name,',
'        document_type,',
'        file_blob,',
'        processed_text,',
'        user_id,',
'        status',
'    ) VALUES (',
'        v_filename,',
'        SUBSTR(v_mime_type, 1, 50),',
'        v_blob,',
'        v_clob,',
'        :APP_USER,',
'        ''PENDING''',
'    ) RETURNING document_id INTO v_document_id;',
'    ',
'    COMMIT;',
'    ',
'    BEGIN',
'        PKG_APUNTIA_RAG.process_document(v_document_id);',
'        apex_application.g_print_success_message := ',
'            ''Documento "'' || v_filename || ''" procesado exitosamente.'';',
'    EXCEPTION',
'        WHEN OTHERS THEN',
'            UPDATE APUNTIA_DOCUMENTS ',
'            SET status = ''ERROR''',
'            WHERE document_id = v_document_id;',
'            ',
'            apex_application.g_print_success_message := ',
'                ''Documento cargado pero hubo un problema al procesarlo: '' || SQLERRM;',
'    END;',
'    ',
'    DELETE FROM apex_application_temp_files WHERE name = :P2_FILE_UPLOAD;',
'    ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        apex_error.add_error(',
'            p_message => ''Error: '' || SQLERRM,',
'            p_display_location => apex_error.c_inline_in_notification',
'        );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Listo :D'
,p_internal_uid=>8178039749235423
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8176806359235411)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8176731798235410)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Gestion de documentos'
,p_internal_uid=>8176806359235411
);
wwv_flow_imp.component_end;
end;
/
