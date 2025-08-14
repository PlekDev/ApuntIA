prompt --workspace/credentials/groq_credential
begin
--   Manifest
--     CREDENTIAL: GROQ_CREDENTIAL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.7'
,p_default_workspace_id=>8063091551209590
,p_default_application_id=>103
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WEB'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(10948699476416753)
,p_name=>'GROQ_CREDENTIAL'
,p_static_id=>'groq_credential'
,p_authentication_type=>'HTTP_HEADER'
,p_valid_for_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://api.groq.com/openai/v1/chat/completions',
''))
,p_prompt_on_install=>false
);
wwv_flow_imp.component_end;
end;
/
