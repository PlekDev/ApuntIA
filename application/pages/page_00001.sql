prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Dashboard'
,p_alias=>'DASHBOARD'
,p_step_title=>'Sistema RAG - Apuntes'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8139196270085597)
,p_plug_name=>'Sistema RAG - Apuntes'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8176437356235407)
,p_plug_name=>unistr('Estad\00EDsticas')
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Estad\00EDsticas (Cards Region)'),
'SELECT ',
'    ''Documentos'' as title,',
'    COUNT(*) as value,',
'    ''fa-file-text'' as icon',
'FROM APUNTIA_DOCUMENTS',
'UNION ALL',
'SELECT ',
'    ''Flashcards'',',
'    COUNT(*),',
'    ''fa-clone''',
'FROM APUNTIA_FLASHCARDS',
'UNION ALL',
'SELECT ',
'    ''Conversaciones'',',
'    COUNT(*),',
'    ''fa-comments''',
'FROM APUNTIA_CONVERSATIONS;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(8176678681235409)
,p_region_id=>wwv_flow_imp.id(8176437356235407)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'VALUE'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'DYNAMIC_CLASS'
,p_icon_class_column_name=>'ICON'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8180238081235445)
,p_plug_name=>unistr('Estad\00EDsticas del Sistema')
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>4
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ''Documentos Totales'' as CARD_TITLE,',
'    COUNT(*) as CARD_TEXT,',
'    ''fa-file-text-o'' as CARD_ICON,',
'    ''u-color-1'' as CARD_CSS_CLASSES,',
'    NULL as CARD_LINK',
'FROM APUNTIA_DOCUMENTS',
'WHERE user_id = :APP_USER',
'UNION ALL',
'SELECT ',
'    ''Documentos Procesados'',',
'    COUNT(*),',
'    ''fa-check-circle'',',
'    ''u-color-9'',',
'    NULL',
'FROM APUNTIA_DOCUMENTS',
'WHERE status = ''PROCESSED'' ',
'AND user_id = :APP_USER',
'UNION ALL',
'SELECT ',
'    ''Fragmentos de Texto'',',
'    COUNT(*),',
'    ''fa-puzzle-piece'',',
'    ''u-color-14'',',
'    NULL',
'FROM APUNTIA_CHUNKS c',
'JOIN APUNTIA_DOCUMENTS d ON c.document_id = d.document_id',
'WHERE d.user_id = :APP_USER',
'UNION ALL',
'SELECT ',
'    ''Conversaciones'',',
'    COUNT(*),',
'    ''fa-comments'',',
'    ''u-color-20'',',
'    NULL',
'FROM APUNTIA_CONVERSATIONS',
'WHERE user_id = :APP_USER'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(8180305070235446)
,p_region_id=>wwv_flow_imp.id(8180238081235445)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp.component_end;
end;
/
