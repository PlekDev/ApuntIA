prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 103
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.7'
,p_default_workspace_id=>8063091551209590
,p_default_application_id=>103
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WEB'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(8125484166085518)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>44846239917093
);
wwv_flow_imp.component_end;
end;
/
