prompt --application/shared_components/data_profiles/groq_api
begin
--   Manifest
--     DATA PROFILE: GROQ_API
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.7'
,p_default_workspace_id=>8063091551209590
,p_default_application_id=>103
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WEB'
);
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(10950263356456433)
,p_name=>'GROQ_API'
,p_format=>'JSON'
,p_row_selector=>'items'
,p_use_raw_json_selectors=>false
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(10950477392456441)
,p_data_profile_id=>wwv_flow_imp.id(10950263356456433)
,p_name=>'COLUMN_1_ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(10950746766456443)
,p_data_profile_id=>wwv_flow_imp.id(10950263356456433)
,p_name=>'COLUMN_2_NAME'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>2000
,p_has_time_zone=>false
,p_selector=>'name'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(10951040095456444)
,p_data_profile_id=>wwv_flow_imp.id(10950263356456433)
,p_name=>'COLUMN_3_HIREDATE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'DATE'
,p_format_mask=>'YYYY-MM-DD"T"HH24:MI:SS'
,p_has_time_zone=>false
,p_selector=>'hire-date'
);
wwv_flow_imp.component_end;
end;
/
