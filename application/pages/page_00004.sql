prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
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
 p_id=>4
,p_name=>'Flashcards'
,p_alias=>'FLASHCARDS'
,p_step_title=>'Flashcards'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function mostrarRespuesta() {',
'    apex.item(''P200_MOSTRAR_RESPUESTA'').setValue(''S'');',
'    apex.submit();',
'}',
'',
'function calificar(resultado) {',
'    apex.server.process(''GUARDAR_RESULTADO'', {',
'        x01: apex.item(''P200_FLASHCARD_ID'').getValue(),',
'        x02: resultado',
'    }, {',
'        success: function() {',
'            siguienteFlashcard();',
'        }',
'    });',
'}',
'',
'function siguienteFlashcard() {',
'    apex.server.process(''OBTENER_SIGUIENTE'', {}, {',
'        success: function(data) {',
'            apex.item(''P200_FLASHCARD_ID'').setValue(data.id);',
'            apex.item(''P200_MOSTRAR_RESPUESTA'').setValue(''N'');',
'            apex.submit();',
'        }',
'    });',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9152940911978372)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10841081294945506)
,p_name=>unistr('Estad\00EDsticas')
,p_title=>unistr('EEstad\00EDsticas')
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>'SELECT ''Total: '' || COUNT(*) || '' tarjetas'' as stat1, ''Estudiadas hoy: '' || SUM(CASE WHEN ya_respondida != ''N'' THEN 1 ELSE 0 END) as stat2, ''Promedio: '' || ROUND(AVG(porcentaje_acierto), 1) || ''%'' as stat3 FROM V_FLASHCARDS_STATS;'
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
 p_id=>wwv_flow_imp.id(10841118151945507)
,p_query_column_id=>1
,p_column_alias=>'STAT1'
,p_column_display_sequence=>10
,p_column_heading=>'Stat1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10841254072945508)
,p_query_column_id=>2
,p_column_alias=>'STAT2'
,p_column_display_sequence=>20
,p_column_heading=>'Stat2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10841320855945509)
,p_query_column_id=>3
,p_column_alias=>'STAT3'
,p_column_display_sequence=>30
,p_column_heading=>'Stat3'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10841448041945510)
,p_plug_name=>'Flashcard'
,p_title=>'Flashcard'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_id NUMBER;',
'    v_pregunta VARCHAR2(500);',
'    v_respuesta CLOB;',
'    v_categoria VARCHAR2(100);',
'    v_mostrar VARCHAR2(1);',
'    v_html CLOB; -- Variable para almacenar el HTML generado',
'BEGIN',
'    -- Inicializar el HTML',
'    v_html := '''';',
'',
'    -- Obtener el ID de la flashcard actual (o una aleatoria si no hay)',
'    v_id := NVL(:P200_FLASHCARD_ID, 0);',
'    v_mostrar := NVL(:P200_MOSTRAR_RESPUESTA, ''N'');',
'    ',
'    -- Si no hay ID, obtener una flashcard aleatoria',
'    IF v_id = 0 THEN',
'        SELECT id INTO v_id',
'        FROM (',
'            SELECT id FROM FLASHCARDS_SIMPLE ',
'            ORDER BY DBMS_RANDOM.VALUE',
'        ) WHERE ROWNUM = 1;',
'        ',
'        :P200_FLASHCARD_ID := v_id;',
'    END IF;',
'    ',
'    -- Obtener los datos de la flashcard',
'    SELECT pregunta, respuesta, categoria',
'    INTO v_pregunta, v_respuesta, v_categoria',
'    FROM FLASHCARDS_SIMPLE',
'    WHERE id = v_id;',
'    ',
'    -- Construir el HTML',
'    v_html := v_html || ''<div style="background: white; padding: 30px; border-radius: 15px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); max-width: 600px; margin: 20px auto;">'';',
'    ',
unistr('    -- Categor\00EDa'),
'    v_html := v_html || ''<div style="text-align: center; margin-bottom: 20px;">'';',
'    v_html := v_html || ''<span style="background: #e3f2fd; color: #1976d2; padding: 5px 15px; border-radius: 20px; font-size: 14px;">'' || v_categoria || ''</span>'';',
'    v_html := v_html || ''</div>'';',
'    ',
'    -- Pregunta',
'    v_html := v_html || ''<h2 style="text-align: center; color: #333; margin: 20px 0;">'' || v_pregunta || ''</h2>'';',
'    ',
'    -- Respuesta',
'    IF v_mostrar = ''S'' THEN',
'        v_html := v_html || ''<div style="border-top: 2px solid #f0f0f0; margin-top: 20px; padding-top: 20px;">'';',
'        v_html := v_html || ''<p style="color: #666; line-height: 1.6;">'' || v_respuesta || ''</p>'';',
'        v_html := v_html || ''</div>'';',
'        ',
unistr('        -- Botones de calificaci\00F3n'),
'        v_html := v_html || ''<div style="display: flex; gap: 10px; justify-content: center; margin-top: 30px;">'';',
unistr('        v_html := v_html || ''<button onclick="calificar(''''I'''')" style="background: #ffcdd2; color: #c62828; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">\274C Incorrecta</button>'';'),
unistr('        v_html := v_html || ''<button onclick="calificar(''''C'''')" style="background: #c8e6c9; color: #2e7d32; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">\2705 Correcta</button>'';'),
'        v_html := v_html || ''</div>'';',
'    ELSE',
unistr('        -- Bot\00F3n para mostrar respuesta'),
'        v_html := v_html || ''<div style="text-align: center; margin-top: 30px;">'';',
'        v_html := v_html || ''<button onclick="mostrarRespuesta()" style="background: linear-gradient(135deg, #667eea, #764ba2); color: white; border: none; padding: 15px 40px; border-radius: 30px; font-size: 16px; cursor: pointer;">Ver Respuesta</but'
||'ton>'';',
'        v_html := v_html || ''</div>'';',
'    END IF;',
'    ',
'    v_html := v_html || ''</div>'';',
'    ',
unistr('    -- Bot\00F3n siguiente (siempre visible)'),
'    v_html := v_html || ''<div style="text-align: center; margin-top: 20px;">'';',
unistr('    v_html := v_html || ''<button onclick="siguienteFlashcard()" style="background: #2196F3; color: white; border: none; padding: 10px 30px; border-radius: 5px; cursor: pointer;">\27A1\FE0F Siguiente Tarjeta</button>'';'),
'    v_html := v_html || ''</div'';',
'    ',
'    RETURN v_html; -- Devolver el HTML generado',
'EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'        RETURN ''<div style="text-align: center; color: red;">No se encontraron flashcards disponibles.</div>'';',
'    WHEN OTHERS THEN',
'        RETURN ''<div style="text-align: center; color: red;">Error al cargar la flashcard: '' || SQLERRM || ''</div>'';',
'END;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10841655152945512)
,p_plug_name=>'Todas las Flashcards'
,p_title=>'Todas las Flashcards'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    id,',
'    pregunta,',
'    categoria,',
'    CASE ',
unistr('        WHEN porcentaje_acierto >= 80 THEN ''\D83D\DFE2'''),
unistr('        WHEN porcentaje_acierto >= 50 THEN ''\D83D\DFE1'''),
unistr('        WHEN porcentaje_acierto > 0 THEN ''\D83D\DD34'''),
unistr('        ELSE ''\26AA'''),
'    END as nivel,',
'    porcentaje_acierto || ''%'' as acierto,',
'    veces_correcta || ''/'' || (veces_correcta + veces_incorrecta) as intentos',
'FROM V_FLASHCARDS_STATS',
'ORDER BY categoria, pregunta;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Todas las Flashcards'
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
 p_id=>wwv_flow_imp.id(10841739816945513)
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
,p_internal_uid=>10841739816945513
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10841849699945514)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10841972499945515)
,p_db_column_name=>'PREGUNTA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Pregunta'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10842069131945516)
,p_db_column_name=>'CATEGORIA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Categoria'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10842162209945517)
,p_db_column_name=>'NIVEL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nivel'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10842212481945518)
,p_db_column_name=>'ACIERTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Acierto'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10842338134945519)
,p_db_column_name=>'INTENTOS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Intentos'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11962045250633367)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'119621'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:PREGUNTA:CATEGORIA:NIVEL:ACIERTO:INTENTOS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10841582192945511)
,p_name=>'P200_FLASHCARD_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10841448041945510)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10842431548945520)
,p_name=>'P200_MOSTRAR_RESPUESTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10841448041945510)
,p_item_default=>'''N'''
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8179659939235439)
,p_name=>'voltear tarjetas'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.flashcard'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8179762459235440)
,p_event_id=>wwv_flow_imp.id(8179659939235439)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Flip Flashcard'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const $card = $(this.triggeringElement);',
'if ($card.hasClass(''flipped'')) {',
'    $card.find(''.card-text'').text($card.data(''question''));',
'    $card.removeClass(''flipped'');',
'} else {',
'    $card.find(''.card-text'').text($card.data(''answer''));',
'    $card.addClass(''flipped'');',
'}',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10842640761945522)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GUARDAR_RESULTADO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_flashcard_id NUMBER := APEX_APPLICATION.g_x01;',
'    v_resultado VARCHAR2(1) := APEX_APPLICATION.g_x02;',
'BEGIN',
'    -- Guardar el progreso',
'    INSERT INTO FLASHCARDS_PROGRESO (flashcard_id, user_id, ultima_respuesta)',
'    VALUES (v_flashcard_id, :APP_USER, v_resultado);',
'    ',
unistr('    -- Actualizar estad\00EDsticas'),
'    IF v_resultado = ''C'' THEN',
'        UPDATE FLASHCARDS_SIMPLE ',
'        SET veces_correcta = veces_correcta + 1',
'        WHERE id = v_flashcard_id;',
'    ELSE',
'        UPDATE FLASHCARDS_SIMPLE ',
'        SET veces_incorrecta = veces_incorrecta + 1',
'        WHERE id = v_flashcard_id;',
'    END IF;',
'    ',
'    COMMIT;',
'    ',
'    APEX_JSON.open_object;',
'    APEX_JSON.write(''success'', true);',
'    APEX_JSON.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>10842640761945522
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10842736901945523)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OBTENER_SIGUIENTE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_next_id NUMBER;',
'BEGIN',
'    -- Obtener una flashcard aleatoria que no se haya respondido hoy',
'    BEGIN',
'        SELECT id INTO v_next_id',
'        FROM (',
'            SELECT f.id ',
'            FROM FLASHCARDS_SIMPLE f',
'            WHERE NOT EXISTS (',
'                SELECT 1 FROM FLASHCARDS_PROGRESO p',
'                WHERE p.flashcard_id = f.id ',
'                AND p.user_id = :APP_USER',
'                AND TRUNC(p.fecha_estudio) = TRUNC(SYSDATE)',
'            )',
'            ORDER BY DBMS_RANDOM.VALUE',
'        ) WHERE ROWNUM = 1;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
unistr('            -- Si ya respondi\00F3 todas, mostrar cualquiera'),
'            SELECT id INTO v_next_id',
'            FROM (',
'                SELECT id FROM FLASHCARDS_SIMPLE ',
'                ORDER BY DBMS_RANDOM.VALUE',
'            ) WHERE ROWNUM = 1;',
'    END;',
'    ',
'    APEX_JSON.open_object;',
'    APEX_JSON.write(''id'', v_next_id);',
'    APEX_JSON.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>10842736901945523
);
wwv_flow_imp.component_end;
end;
/
