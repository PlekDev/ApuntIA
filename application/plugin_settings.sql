prompt --application/plugin_settings
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.7'
,p_default_workspace_id=>8063091551209590
,p_default_application_id=>103
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WEB'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8121236056085508)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>44846239916673
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8121582783085509)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>44846239916709
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8121835845085510)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>44846239916736
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8122157941085510)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>44846239916769
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8122420049085511)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>44846239916807
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8122750693085512)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>44846239916842
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8123031195085512)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>44846239916874
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8123371594085513)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>44846239916913
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8123623852085514)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>44846239916953
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8123933408085514)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER',
  'show_coordinates', 'N')).to_clob
,p_version_scn=>44846239916989
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8124296059085515)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>44846239917013
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8124505477085516)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>44846239917042
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8124870679085516)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>44846239917068
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8125123164085517)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>44846239917092
);
wwv_flow_imp.component_end;
end;
/
