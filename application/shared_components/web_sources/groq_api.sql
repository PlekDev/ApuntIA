prompt --application/shared_components/web_sources/groq_api
begin
--   Manifest
--     WEB SOURCE: GROQ_API
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.7'
,p_default_workspace_id=>8063091551209590
,p_default_application_id=>103
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WEB'
);
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(10951334281456447)
,p_name=>'GROQ_API'
,p_static_id=>'groq_api'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(10950263356456433)
,p_remote_server_id=>wwv_flow_imp.id(10950004808456429)
,p_url_path_prefix=>'/chat/completions'
,p_credential_id=>wwv_flow_imp.id(10948699476416753)
,p_version_scn=>44846799776841
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(10951509095456453)
,p_web_src_module_id=>wwv_flow_imp.id(10951334281456447)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(10951927884456458)
,p_web_src_module_id=>wwv_flow_imp.id(10951334281456447)
,p_operation=>'POST'
,p_database_operation=>'INSERT'
,p_url_pattern=>'.'
,p_request_body_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "model": "mixtral-8x7b-32768",',
'  "messages": [',
'    {',
'      "role": "user",',
'      "content": "#PROMPT#"',
'    }',
'  ],',
'  "max_tokens": 2000,',
'  "temperature": 0.7',
'}'))
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(10953423423506654)
,p_web_src_module_id=>wwv_flow_imp.id(10951334281456447)
,p_web_src_operation_id=>wwv_flow_imp.id(10951927884456458)
,p_name=>'PROMPT'
,p_param_type=>'BODY'
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(10952316250456459)
,p_web_src_module_id=>wwv_flow_imp.id(10951334281456447)
,p_operation=>'PUT'
,p_database_operation=>'UPDATE'
,p_url_pattern=>'/:id'
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(10952742415456460)
,p_web_src_module_id=>wwv_flow_imp.id(10951334281456447)
,p_operation=>'DELETE'
,p_database_operation=>'DELETE'
,p_url_pattern=>'/:id'
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp.component_end;
end;
/
