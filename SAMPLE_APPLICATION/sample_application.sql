set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 26483 - Sample Application
--
-- Application Export:
--   Application:     26483
--   Name:            Sample Application
--   Date and Time:   14:16 Thursday August 14, 2014
--   Exported By:     GPV
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.2.5.00.08
--   Instance ID:     69407370551712
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
-- Application Statistics:
--   Pages:                      2
--     Items:                    3
--     Processes:                5
--     Regions:                  2
--     Buttons:                  1
--   Shared Components:
--     Logic:
--     Navigation:
--       Breadcrumbs:            1
--       NavBar Entries:         1
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                19
--         Region:              36
--         Label:                6
--         List:                19
--         Popup LOV:            1
--         Calendar:             3
--         Breadcrumb:           2
--         Button:              10
--         Report:              11
--       LOVs:                   1
--       Plug-ins:               1
--     Globalization:
--     Reports:
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,2226724507504475));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,26483);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,26483));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,26483));
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,26483),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,26483),
  p_owner => nvl(wwv_flow_application_install.get_schema,'GPV'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Sample Application'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'F_1022648226483'),
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt_last_reset => '20140814141626',
  p_max_session_length_sec=> null,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'en',
  p_flow_language_derived_from=> '0',
  p_allow_feedback_yn=> 'N',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 98831290160231464509 + wwv_flow_api.g_id_offset,
  p_logout_url=> '',
  p_application_tab_set=> 0,
  p_logo_image => 'TEXT:Plugin Demonstration',
  p_public_url_prefix => '',
  p_public_user=> 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_flow_version=> 'release 1.0',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'N',
  p_browser_frame=>'D',
  p_deep_linking=>'Y',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_authorize_public_pages_yn=>'N',
  p_csv_encoding=> 'Y',
  p_auto_time_zone=> 'N',
  p_include_legacy_javascript=> 'Y',
  p_error_handling_function=> 'apex_error_custom',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_substitution_string_01 => 'AUTOLOGIN_USER_NAME',
  p_substitution_value_01  => '',
  p_substitution_string_02 => 'AUTOLOGIN_PASSWORD',
  p_substitution_value_02  => '',
  p_last_updated_by => 'GPV',
  p_last_upd_yyyymmddhh24miss=> '20140814141626',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

----------------
--package app map
--
prompt  ...user interfaces
--
 
begin
 
--application/user interface/desktop
wwv_flow_api.create_user_interface (
  p_id => 98831289962476464508 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_ui_type_name => 'DESKTOP'
 ,p_display_name => 'Desktop'
 ,p_display_seq => 10
 ,p_use_auto_detect => false
 ,p_is_default => true
 ,p_theme_id => 26
 ,p_home_url => 'f?p=&APP_ID.:1:&SESSION.'
 ,p_login_url => 'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
--application/plug-in setting/item_type_native_yes_no
wwv_flow_api.create_plugin_setting (
  p_id => 98831279067325464488 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_03 => 'N'
  );
null;
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
null;
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id => 98831290063300464509 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 200,
  p_icon_image => '',
  p_icon_subtext=> 'Logout',
  p_icon_target=> '&LOGOUT_URL.',
  p_icon_image_alt=> 'Logout',
  p_icon_height=> 32,
  p_icon_width=> 32,
  p_icon_height2=> 24,
  p_icon_width2=> 24,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> '',
  p_begins_on_new_line=> '',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
prompt  ...application items
--
prompt  ...application level computations
--
 
begin
 
null;
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
--application/shared_components/user_interface/lov/statuses
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 98831693886250362508 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'STATUSES',
  p_lov_query=> '.'||to_char(98831693886250362508 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>98831694189028362508 + wwv_flow_api.g_id_offset,
  p_lov_id=>98831693886250362508 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'OPN',
  p_lov_return_value=>'Open',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>98831694474369362510 + wwv_flow_api.g_id_offset,
  p_lov_id=>98831693886250362508 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'CLS',
  p_lov_return_value=>'Closed',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>98831694781930362510 + wwv_flow_api.g_id_offset,
  p_lov_id=>98831693886250362508 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'OHLD',
  p_lov_return_value=>'On-Hold',
  p_lov_data_comment=> '');
 
null;
 
end;
/

prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00001
prompt  ...PAGE 1: Plugin Demonstration
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 98831289962476464508 + wwv_flow_api.g_id_offset
 ,p_name => 'Plugin Demonstration'
 ,p_alias => 'LANDING_PAGE'
 ,p_step_title => 'Plugin Demonstration'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 98831279281638464491 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'GPV'
 ,p_last_upd_yyyymmddhh24miss => '20140813150248'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select	--ROWID,'||unistr('\000a')||
'       ID,'||unistr('\000a')||
'       PROJECT,'||unistr('\000a')||
'       TASK_NAME,'||unistr('\000a')||
'       START_DATE,'||unistr('\000a')||
'       END_DATE,'||unistr('\000a')||
'       STATUS,'||unistr('\000a')||
'       ASSIGNED_TO,'||unistr('\000a')||
'       COST,'||unistr('\000a')||
'       BUDGET       '||unistr('\000a')||
'from EBA_DEMO_IR_PROJECTS';

wwv_flow_api.create_page_plug (
  p_id=> 98831293871554528254 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Sample Interactive Report',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 98831282683820464498+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_rest_enabled=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select	--ROWID,'||unistr('\000a')||
'       ID,'||unistr('\000a')||
'       PROJECT,'||unistr('\000a')||
'       TASK_NAME,'||unistr('\000a')||
'       START_DATE,'||unistr('\000a')||
'       END_DATE,'||unistr('\000a')||
'       STATUS,'||unistr('\000a')||
'       ASSIGNED_TO,'||unistr('\000a')||
'       COST,'||unistr('\000a')||
'       BUDGET       '||unistr('\000a')||
'from EBA_DEMO_IR_PROJECTS';

wwv_flow_api.create_worksheet(
  p_id=> 98831293964528528254+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_region_id=> 98831293871554528254+wwv_flow_api.g_id_offset,
  p_name=> 'Sample Interactive Report',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '1000000',
  p_max_row_count_message=> 'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'GPV',
  p_internal_uid=> 2527305827880841);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 98831687871489589135+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ID',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Id',
  p_report_label           =>'Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 98831687978597589135+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'PROJECT',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Project',
  p_report_label           =>'Project',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 98831688077907589135+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'TASK_NAME',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Task Name',
  p_report_label           =>'Task Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 98831688159576589135+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'START_DATE',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Start Date',
  p_report_label           =>'Start Date',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 98831688273265589136+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'END_DATE',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'End Date',
  p_report_label           =>'End Date',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 98831688374971589136+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'STATUS',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Status',
  p_report_label           =>'Status',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_named_lov          =>98831693886250362508+wwv_flow_api.g_id_offset,
  p_rpt_show_filter_lov    =>'1',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 98831688487548589136+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ASSIGNED_TO',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'Assigned To',
  p_report_label           =>'Assigned To',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 98831688578861589136+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COST',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'Cost',
  p_report_label           =>'Cost',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 98831688689976589136+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'BUDGET',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'Budget',
  p_report_label           =>'Budget',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'PROJECT:TASK_NAME:STATUS:ASSIGNED_TO:BUDGET:COST:APXWS_CC_001';

wwv_flow_api.create_worksheet_rpt(
  p_id => 98831294472939528612+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'25279',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_break_on                =>'PROJECT',
  p_break_enabled_on        =>'PROJECT',
  p_sum_columns_on_break    =>'COST',
  p_count_columns_on_break  =>'TASK_NAME',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_computation(
  p_id => 2980003479077956+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 98831293964528528254+wwv_flow_api.g_id_offset,
  p_report_id => 98831294472939528612+wwv_flow_api.g_id_offset,
  p_db_column_name    =>'APXWS_CC_001',
  p_column_identifier =>'C01',
  p_computation_expr  =>'J - I',
  p_format_mask       =>'',
  p_column_type       =>'NUMBER',
  p_column_label      =>'Available Budget',
  p_report_label      =>'Available Budget');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 4805923074338671 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 20,
  p_button_plug_id => 98831293871554528254+wwv_flow_api.g_id_offset,
  p_button_name    => 'P1_GET_EXCEL_FROM_IR',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(98831288371888464505+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Get Result as Excel File',
  p_button_position=> 'RIGHT_OF_IR_SEARCH_BAR',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:GET_EXCEL:&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p := null;
wwv_flow_api.create_page_process(
  p_id     => 4806750231354603 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLUGIN_GPV_IR_TO_MSEXCEL',
  p_process_name=> 'Get Excel',
  p_process_sql_clob => p,
  p_attribute_05=> '1000',
  p_attribute_06=> 'Report refreshed. Please try download again.',
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'GET_EXCEL',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00011
prompt  ...PAGE 11: Login Page
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 11
 ,p_user_interface_id => 98831289962476464508 + wwv_flow_api.g_id_offset
 ,p_name => 'Login Page'
 ,p_alias => 'LOGIN_DESKTOP'
 ,p_step_title => 'Login Page'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 98831279174362464489 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'TODANTE@GMAIL.COM'
 ,p_last_upd_yyyymmddhh24miss => '20140630135428'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 49415610931823190887 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Login Page',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 98831282274108464497+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49415611142219190889 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_USERNAME',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 49415610931823190887+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Username',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 98831287865392464505+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49415611349462190889 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_PASSWORD',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 49415610931823190887+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Password',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 98831287865392464505+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>49415611526560190890 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_LOGIN',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 49415610931823190887+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default=> 'Login',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(98831288262132464505 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_authentication.send_login_username_cookie ('||unistr('\000a')||
'    p_username => lower(:P11_USERNAME) );';

wwv_flow_api.create_page_process(
  p_id     => 49415613944866190891 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 11,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_authentication.login('||unistr('\000a')||
'    p_username => :P11_USERNAME,'||unistr('\000a')||
'    p_password => :P11_PASSWORD );';

wwv_flow_api.create_page_process(
  p_id     => 49415611741008190890 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 11,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'11';

wwv_flow_api.create_page_process(
  p_id     => 49415614323100190891 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 11,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear Page(s) Cache',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P11_USERNAME := apex_authentication.get_login_username_cookie;';

wwv_flow_api.create_page_process(
  p_id     => 49415614120828190891 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 11,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 11
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 98831291279174464511 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> ' Breadcrumb');
 
null;
 
end;
/

prompt  ...page templates for application: 26483
--
--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 98831279174362464489
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831279174362464489 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'Login'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD# id="uLogin">'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<div id="uLoginContainer">'||unistr('\000a')||
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'  #REGION_POSITION_02#'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'  #REGION_POSITION_03#'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_notification_message => '<section class="uSingleAlertMessage red" id="uNotificationMessage">'||unistr('\000a')||
'	<p>#MESSAGE#</p>'||unistr('\000a')||
'	<a href="javascript:void(0)" class="closeMessage" onclick="$x_Remove(''uNotificationMessage'')"></a>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0"'
 ,p_theme_class_id => 6
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
 ,p_template_comment => '18'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/minimal_page
prompt  ......Page template 98831279281638464491
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831279281638464491 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'Minimal Page'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer" class="minimalPage">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <!-- hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#TITLE#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup -->'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATI'||
'ON#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'  #REGION_POSITION_02#'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'  #REGION_POSITION_03#'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #APP_VERSION#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 3
 ,p_error_page_template => '<section class="uRegion uNoHeading uErrorRegion">'||unistr('\000a')||
'  <div class="uRegionContent">'||unistr('\000a')||
'    <p><strong>#MESSAGE#</strong></p>'||unistr('\000a')||
'    <p>#ADDITIONAL_INFO#</p>'||unistr('\000a')||
'    <div class="uErrorTechInfo">#TECHNICAL_INFO#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      <a href="#BACK_LINK#" class="uButtonLarge uHotButton"><span>#OK#</span></a>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_left_sidebar
prompt  ......Page template 98831279381502464491
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831279381502464491 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'No Tabs - Left Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<tab'||
'le id="uPageCols" class="uTwoCol"><tr>'||unistr('\000a')||
'  <td id="uLeftCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_02#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    #REGION_POSITION_03#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr></table>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => 'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 17
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_left_and_right_sidebar
prompt  ......Page template 98831279461176464491
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831279461176464491 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'No Tabs - Left and Right Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<tab'||
'le id="uPageCols" class="uThreeCol"><tr>'||unistr('\000a')||
'  <td id="uLeftCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_02#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uRightCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_03#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr></table>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => 'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 17
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_no_sidebar
prompt  ......Page template 98831279565012464491
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831279565012464491 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'No Tabs - No Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div'||
' id="uOneCol">'||unistr('\000a')||
'  #REGION_POSITION_02#'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'  #REGION_POSITION_03#'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 3
 ,p_error_page_template => '<section class="uRegion uNoHeading uErrorRegion">'||unistr('\000a')||
'  <div class="uRegionContent">'||unistr('\000a')||
'    <p><strong>#MESSAGE#</strong></p>'||unistr('\000a')||
'    <p>#ADDITIONAL_INFO#</p>'||unistr('\000a')||
'    <div class="uErrorTechInfo">#TECHNICAL_INFO#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      <a href="#BACK_LINK#" class="uButtonLarge uHotButton"><span>#OK#</span></a>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_right_sidebar
prompt  ......Page template 98831279684519464491
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831279684519464491 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'No Tabs - Right Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<tab'||
'le id="uPageCols" class="uTwoCol"><tr>'||unistr('\000a')||
'  <td id="uMidCol">'||unistr('\000a')||
'    #REGION_POSITION_02#'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uRightCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_03#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr></table>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 3
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_content_frame
prompt  ......Page template 98831279762342464492
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831279762342464492 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'One Level Tabs - Content Frame'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION'||
'_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'<section class="uRegion uRegionNoPadding clearfix uRegionFrame">'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'		#REGION_POSITION_02#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFrameContent">'||unistr('\000a')||
'	<div class="uFrameMain">'||unistr('\000a')||
'		#BOX_BODY#'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="uFrameSide">'||unistr('\000a')||
'		#REG'||
'ION_POSITION_03#'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 9
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_left_sidebar
prompt  ......Page template 98831279889552464492
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831279889552464492 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'One Level Tabs - Left Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION'||
'_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uTwoColumns">'||unistr('\000a')||
'<table id="uPageCols" class="uTwoCol"><tr>'||unistr('\000a')||
'  <td id="uLeftCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_02#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    #REGION_POSITION_03#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr></table>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_left_and_right_sidebar
prompt  ......Page template 98831279975618464492
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831279975618464492 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'One Level Tabs - Left and Right Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION'||
'_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uThreeColumns">'||unistr('\000a')||
'<table id="uPageCols" class="uThreeCol"><tr>'||unistr('\000a')||
'  <td id="uLeftCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_02#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uRightCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_03#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr></table>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_current_tab => '<li><a class="active" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_no_sidebar
prompt  ......Page template 98831280065018464492
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831280065018464492 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'One Level Tabs - No Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'  #REGION_POSITION_02#'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'  #REGION_POSITION_03#'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => 'class="regionColumns"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 1
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_right_sidebar
prompt  ......Page template 98831280172431464492
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831280172431464492 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'One Level Tabs - Right Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION'||
'_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uTwoColumns">'||unistr('\000a')||
'<table id="uPageCols" class="uTwoCol"><tr>'||unistr('\000a')||
'  <td id="uMidCol">'||unistr('\000a')||
'    #REGION_POSITION_02#'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uRightCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_03#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr></table>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_search_filter_bar
prompt  ......Page template 98831280287750464494
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831280287750464494 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'One Level Tabs - Search Filter Bar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
''||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION'||
'_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="body" class="uSearchContainer">'||unistr('\000a')||
'  <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary=""  width="100%">'||unistr('\000a')||
'    <tbody>'||unistr('\000a')||
'      <tr>'||unistr('\000a')||
'        <td class="tbl-sidebar" style="vertical-align:top">'||unistr('\000a')||
'          <div class="ebaSearchFilterBar">#REGION_POSITION_02#</div>'||unistr('\000a')||
'        </td>'||unistr('\000a')||
'        <td class="tbl-'||
'main">#BOX_BODY##REGION_POSITION_03#</td>'||unistr('\000a')||
'      </tr>'||unistr('\000a')||
'    </tbody>'||unistr('\000a')||
'  </table>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'||unistr('\000a')||
''
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 9
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_wizard_page
prompt  ......Page template 98831280360639464494
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831280360639464494 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'One Level Tabs - Wizard Page'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION'||
'_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
''||unistr('\000a')||
'<div class="cWizard">'||unistr('\000a')||
'	<div class="cWizardHeader">'||unistr('\000a')||
'		#REGION_POSITION_02#'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'    <div class="cWizardContentContainer">'||unistr('\000a')||
'    <div class="cWizardContent">'||unistr('\000a')||
'        #BOX_BODY##REGION_POSITION_03#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="clear"></div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 8
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 98831280473860464494
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831280473860464494 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'Popup'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD# id="uPopup">'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<table id="uPageCols" class="uTwoCol"><tr>'||unistr('\000a')||
'  <td id="uMidCol">'||unistr('\000a')||
'  #REGION_POSITION_01#'||unistr('\000a')||
'  #REGION_POSITION_02#'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'  #REGION_POSITION_06#'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uRightCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_03#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr></table>'
 ,p_footer_template => 
'<div id="uHiddenItems">'||unistr('\000a')||
'  #REGION_POSITION_08#'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 4
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 98831280575871464494
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831280575871464494 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'Printer Friendly'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD# id="uPrinterFriendly">'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div'||
' id="uOneCol">'||unistr('\000a')||
'  #REGION_POSITION_02#'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'  #REGION_POSITION_03#'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'||unistr('\000a')||
''
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 5
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
 ,p_template_comment => '3'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_left_sidebar
prompt  ......Page template 98831280686061464494
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831280686061464494 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'Two Level Tabs - Left Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <div class="uParentTabs">'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #PARENT_TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'   '||
' </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uTwoColumns">'||unistr('\000a')||
'<table id="uPageCols" class="uTwoCol"><tr>'||unistr('\000a')||
'  <td id="uLeftCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_02#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'    #REGION_POSITION_03#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr></table>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_non_curr_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 18
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_left_and_right_sidebar
prompt  ......Page template 98831280790722464495
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831280790722464495 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'Two Level Tabs - Left and Right Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <div class="uParentTabs">'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #PARENT_TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'   '||
' </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uThreeColumns">'||unistr('\000a')||
'<table id="uPageCols" class="uThreeCol"><tr>'||unistr('\000a')||
'  <td id="uLeftCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_02#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uMidCol">'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uRightCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITI'||
'ON_03#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr></table>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_current_tab => '<li><a class="active" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_current_tab => '<li><a class="active" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_non_curr_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 18
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_no_sidebar
prompt  ......Page template 98831280888119464495
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831280888119464495 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'Two Level Tabs - No Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <div class="uParentTabs">'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #PARENT_TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'   '||
' </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uOneCol">'||unistr('\000a')||
'  #REGION_POSITION_02#'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'  #REGION_POSITION_03#'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_non_curr_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 2
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_right_sidebar
prompt  ......Page template 98831280987888464495
 
begin
 
wwv_flow_api.create_template (
  p_id => 98831280987888464495 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 26
 ,p_name => 'Two Level Tabs - Right Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<!--[if HTML5]><![endif]-->'||unistr('\000a')||
'<!doctype html>'||unistr('\000a')||
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->'||unistr('\000a')||
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<!--[if !HTML5]>'||unistr('\000a')||
'  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">'||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#?v=2">'||unistr('\000a')||
'  <script src="#IMAGE_PREFIX#themes/theme_26/js/4_2.js?v=#APEX_VERSION#"></script>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'  #FORM_OPEN#'||unistr('\000a')||
'  <div id="uBodyContainer">'
 ,p_box => 
'<header id="uHeader">'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <hgroup>'||unistr('\000a')||
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>'||unistr('\000a')||
'    <div class="userBlock">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="navIcon user" alt="">'||unistr('\000a')||
'      <span>&APP_USER.</span>'||unistr('\000a')||
'      #NAVIGATION_BAR#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </hgroup>'||unistr('\000a')||
'  <div class="uParentTabs">'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #PARENT_TAB_CELLS#'||unistr('\000a')||
'    </ul>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <nav>'||unistr('\000a')||
'    <ul>'||unistr('\000a')||
'      #TAB_CELLS#'||unistr('\000a')||
'   '||
' </ul>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </nav>'||unistr('\000a')||
'  #REGION_POSITION_04#'||unistr('\000a')||
'</header>'||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'<div id="uTwoColumns">'||unistr('\000a')||
'<table id="uPageCols" class="uTwoCol"><tr>'||unistr('\000a')||
'  <td id="uMidCol">'||unistr('\000a')||
'    #REGION_POSITION_02#'||unistr('\000a')||
'    #BOX_BODY#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td id="uRightCol">'||unistr('\000a')||
'    <aside>'||unistr('\000a')||
'    #REGION_POSITION_03#'||unistr('\000a')||
'    </aside>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr></table>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<footer id="uFooter">'||unistr('\000a')||
'  <div class="uFooterContent">'||unistr('\000a')||
'    <div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'    #SCREEN_READER_TOGGLE#'||unistr('\000a')||
'    <span class="uFooterVersion">'||unistr('\000a')||
'      #APP_VERSION#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uFooterBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVAS'||
'CRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #SUCCESS_MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_non_current_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_current_tab => '<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_top_non_curr_tab => '<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
 ,p_notification_message => '<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>'||unistr('\000a')||
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />'||unistr('\000a')||
'    <div class="uMessageText">'||unistr('\000a')||
'      #MESSAGE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 2
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 98831288262132464505
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 98831288262132464505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button'
 ,p_template => 
'<a href="#LINK#" class="uButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
 ,p_hot_template => 
'<a href="#LINK#" class="uButton uHotButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 26
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/interactive_report_button
prompt  ......Button Template 98831288371888464505
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 98831288371888464505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Interactive Report Button'
 ,p_template => 
'<a href="#LINK#" class="uButtonIR #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
 ,p_hot_template => 
'<a href="#LINK#" class="uButtonIR uHotButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 2
 ,p_theme_id => 26
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/interactive_report_button_next
prompt  ......Button Template 98831288483732464505
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 98831288483732464505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Interactive Report Button (Next)'
 ,p_template => 
'<a href="#LINK#" class="uButtonIR nextButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#<img src="#IMAGE_PREFIX#f_spacer.gif" class="uButtonIcon nextIcon" alt=""></span></a> '
 ,p_hot_template => 
'<a href="#LINK#" class="uButtonIR uHotButton nextButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#<img src="#IMAGE_PREFIX#f_spacer.gif" class="uButtonIcon nextIcon" alt=""></span></a> '
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 26
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/large_button
prompt  ......Button Template 98831288575721464505
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 98831288575721464505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Large Button'
 ,p_template => 
'<a href="#LINK#" class="uButtonLarge #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
 ,p_hot_template => 
'<a href="#LINK#" class="uButtonLarge uHotButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 26
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/large_button_next
prompt  ......Button Template 98831288677087464505
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 98831288677087464505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Large Button (Next)'
 ,p_template => 
'<a href="#LINK#" class="uButtonLarge nextButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#<img src="#IMAGE_PREFIX#f_spacer.gif" class="uButtonIcon nextIcon" alt=""></span></a> '
 ,p_hot_template => 
'<a href="#LINK#" class="uButtonLarge uHotButton nextButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#<img src="#IMAGE_PREFIX#f_spacer.gif" class="uButtonIcon nextIcon" alt=""></span></a> '
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 26
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/large_button_previous
prompt  ......Button Template 98831288764888464505
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 98831288764888464505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Large Button (Previous)'
 ,p_template => 
'<a href="#LINK#" class="uButtonLarge prevButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button" title="#LABEL#"><span><img src="#IMAGE_PREFIX#f_spacer.gif" class="uButtonIcon prevIcon" alt="#LABEL#"></span></a> '
 ,p_hot_template => 
'<a href="#LINK#" class="uButtonLarge utHotButton prevButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button" title="#LABEL#"><span><img src="#IMAGE_PREFIX#f_spacer.gif" class="uButtonIcon prevIcon" alt="#LABEL#"></span></a> '
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 26
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/small_button
prompt  ......Button Template 98831288879697464505
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 98831288879697464505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Small Button'
 ,p_template => 
'<a href="#LINK#" class="uButtonSmall #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
 ,p_hot_template => 
'<a href="#LINK#" class="uButtonSmall uHotButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 4
 ,p_theme_id => 26
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/add_button
prompt  ......Button Template 98831288991006464505
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 98831288991006464505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => '[ + ] Add Button'
 ,p_template => 
'<a href="#LINK#" class="uIconButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# title="#LABEL#" role="button"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#LABEL#" class="addIcon" /></a>'
 ,p_hot_template => 
'<a href="#LINK#" class="uIconButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# title="#LABEL#" role="button"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#LABEL#"  class="addIcon"/></a>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 26
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/go_to_button
prompt  ......Button Template 98831289061099464505
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 98831289061099464505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => '[ > ] Go To Button'
 ,p_template => 
'<a href="#LINK#" class="uIconButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# title="#LABEL#" role="button"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#LABEL#" class="gotoIcon" /></a>'
 ,p_hot_template => 
'<a href="#LINK#" class="uIconButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# title="#LABEL#" role="button"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#LABEL#" class="gotoIcon"/></a>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 26
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/text_button
prompt  ......Button Template 98831289172767464505
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 98831289172767464505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => '[ Text ] Button'
 ,p_template => 
'<a href="#LINK#" class="uIconButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a>'
 ,p_hot_template => 
'<a href="#LINK#" class="uIconButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 26
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/accessible_region_with_heading
prompt  ......region template 98831281079348464495
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831281079348464495 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#BUTTON_CSS_CLASSES#">'||unistr('\000a')||
'  <h1 class="visuallyhidden">#TITLE#</h1>'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Accessible Region with Heading'
 ,p_theme_id => 26
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/alert_region
prompt  ......region template 98831281169823464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831281169823464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uWhiteRegion uAlertRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Alert Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 26
 ,p_theme_class_id => 10
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Used for alerts and confirmations.  Please use a region image for the success/warning icon'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 98831281277313464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831281277313464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uBorderlessRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Borderless Region'
 ,p_theme_id => 26
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template when you want to contain content without a border.'||unistr('\000a')||
''||unistr('\000a')||
'TITLE=YES'||unistr('\000a')||
'BUTTONS=YES'||unistr('\000a')||
'100% WIDTH=NO'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/borderless_region_no_heading
prompt  ......region template 98831281367082464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831281367082464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uBorderlessRegion clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Borderless Region (no heading)'
 ,p_theme_id => 26
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template when you want to contain content without a border.'||unistr('\000a')||
''||unistr('\000a')||
'TITLE=YES'||unistr('\000a')||
'BUTTONS=YES'||unistr('\000a')||
'100% WIDTH=NO'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/bracketed_region
prompt  ......region template 98831281485617464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831281485617464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uBracketedRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Bracketed Region'
 ,p_theme_id => 26
 ,p_theme_class_id => 18
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template when you want to contain content with a bracket UI.'||unistr('\000a')||
''||unistr('\000a')||
'TITLE=YES'||unistr('\000a')||
'BUTTONS=YES'||unistr('\000a')||
'100% WIDTH=NO'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 98831281564475464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831281564475464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="uBreadcrumbs" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'  <div class="uBreadcrumbsBG">'||unistr('\000a')||
'    <div class="uLeft"></div>'||unistr('\000a')||
'    <div class="uRight"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Breadcrumb Region'
 ,p_theme_id => 26
 ,p_theme_class_id => 6
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template to contain breadcrumb menus.  Breadcrumb menus are implemented using breadcrumbs.  Breadcrumb menus are designed to displayed in #REGION_POSITION_01#'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_with_title
prompt  ......region template 98831281673653464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831281673653464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uButtonRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uButtonRegionContentContainer">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Button Region with Title'
 ,p_theme_id => 26
 ,p_theme_class_id => 4
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_without_title
prompt  ......region template 98831281760929464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831281760929464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uButtonRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uButtonRegionContentContainer">'||unistr('\000a')||
'    <div class="uButtonRegionContent">#BODY#</div>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Button Region without Title'
 ,p_theme_id => 26
 ,p_theme_class_id => 17
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_list
prompt  ......region template 98831281860784464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831281860784464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Chart List'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 26
 ,p_theme_class_id => 29
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_region
prompt  ......region template 98831281989135464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831281989135464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Chart Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 26
 ,p_theme_class_id => 30
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/content_frame_body_container
prompt  ......region template 98831282085689464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831282085689464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'#SUB_REGION_HEADERS#'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'<div class="uFrameContainer" class="#REGION_CSS_CLASSES#">'||unistr('\000a')||
'#SUB_REGIONS#'||unistr('\000a')||
'</div>'
 ,p_sub_plug_header_template => '<div class="uFrameRegionSelector clearfix">'||unistr('\000a')||
'  <ul>'||unistr('\000a')||
'    <li><a href="javascript:void(0);" class="showAllLink active"><span>Show All</span></a></li>'||unistr('\000a')||
'    #ENTRIES#'||unistr('\000a')||
'  </ul>'||unistr('\000a')||
'</div>'
 ,p_sub_plug_header_entry_templ => '<li><a href="javascript:void(0);" id="sub_#SUB_REGION_ID#"><span>#SUB_REGION_TITLE#</span></a></li>'
 ,p_page_plug_template_name => 'Content Frame Body Container'
 ,p_theme_id => 26
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/div_region_with_id
prompt  ......region template 98831282179217464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831282179217464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> '||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'DIV Region with ID'
 ,p_theme_id => 26
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region
prompt  ......region template 98831282274108464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831282274108464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Form Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 26
 ,p_theme_class_id => 8
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region
prompt  ......region template 98831282375648464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831282375648464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uHideShowRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>'||unistr('\000a')||
'      <a href="javascript:void(0)" class="uRegionControl"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="Hide/Show"/></a>'||unistr('\000a')||
'      #TITLE#'||unistr('\000a')||
'    </h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE'||
'2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Hide and Show Region'
 ,p_theme_id => 26
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region_hidden_first_borderless
prompt  ......region template 98831282471409464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831282471409464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uBorderlessRegion uHideShowRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>'||unistr('\000a')||
'      <a href="javascript:void(0)" class="uRegionControl uRegionCollapsed"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="Hide/Show"/></a>'||unistr('\000a')||
'      #TITLE#'||unistr('\000a')||
'    </h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##D'||
'ELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix" style="display: none;">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Hide and Show Region (Hidden First) - Borderless'
 ,p_theme_id => 26
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region_borderless
prompt  ......region template 98831282571224464497
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831282571224464497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uBorderlessRegion uHideShowRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>'||unistr('\000a')||
'      <a href="javascript:void(0)" class="uRegionControl"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="Hide/Show"/></a>'||unistr('\000a')||
'      #TITLE#'||unistr('\000a')||
'    </h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHAN'||
'GE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Hide and Show Region - Borderless'
 ,p_theme_id => 26
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/interactive_report_region
prompt  ......region template 98831282683820464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831282683820464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uIRRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">'||unistr('\000a')||
'  <h1 class="visuallyhidden">#TITLE#</h1>'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Interactive Report Region'
 ,p_theme_id => 26
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/login_region
prompt  ......region template 98831282783164464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831282783164464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uRegionNoPadding uLoginRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uLoginHeading">'||unistr('\000a')||
'    <span class="bgArrow"></span>'||unistr('\000a')||
'    <div class="appIcon">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="appIcon #REGION_STATIC_ID#" alt=""/>'||unistr('\000a')||
'    </div> '||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uLoginBody clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'   '||
' <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Login Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 26
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/modal_region
prompt  ......region template 98831282872172464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831282872172464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uWhiteRegion uModalRegion uAlertRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'</s'||
'ection>'
 ,p_page_plug_template_name => 'Modal Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 26
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region
prompt  ......region template 98831282971155464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831282971155464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Navigation Region'
 ,p_theme_id => 26
 ,p_theme_class_id => 5
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region_heading_inside
prompt  ......region template 98831283077874464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831283077874464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uWhiteRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Navigation Region - Heading Inside'
 ,p_theme_id => 26
 ,p_theme_class_id => 16
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_buttons_and_titles
prompt  ......region template 98831283167545464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831283167545464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uNoHeading #REGION_CSS_CLASSES# clearfix">'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Region without Buttons and Titles'
 ,p_theme_id => 26
 ,p_theme_class_id => 19
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_title
prompt  ......region template 98831283268174464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831283268174464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uNoHeading #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Region without Title'
 ,p_theme_id => 26
 ,p_theme_class_id => 11
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_filter_single_row
prompt  ......region template 98831283368445464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831283368445464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uButtonRegion uNoHeading uReportFilter #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    <div class="uReportFilterRow">'||unistr('\000a')||
'    <img src="#IM'||
'AGE_PREFIX#f_spacer.gif" class="uSearchIcon" alt="" />'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Report Filter - Single Row'
 ,p_theme_id => 26
 ,p_theme_class_id => 31
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_list
prompt  ......region template 98831283483168464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831283483168464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Report List'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 26
 ,p_theme_class_id => 29
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region
prompt  ......region template 98831283585770464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831283585770464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Reports Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 26
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_100_width
prompt  ......region template 98831283682813464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831283682813464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uRegionNoPadding #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Reports Region - 100% Width'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 26
 ,p_theme_class_id => 13
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_heading_inside
prompt  ......region template 98831283760644464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831283760644464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uWhiteRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Reports Region - Heading Inside'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 26
 ,p_theme_class_id => 10
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/scrollable_content_region
prompt  ......region template 98831283887291464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831283887291464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix"  style="height: 400px; overflow:scroll">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</'||
'section>'
 ,p_page_plug_template_name => 'Scrollable Content Region'
 ,p_theme_id => 26
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 1826089610826571714
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/search_filter_region
prompt  ......region template 98831283990562464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831283990562464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uFilterRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'    <span class="uButtonContainer">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Search Filter Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 26
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 98831284063888464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831284063888464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Sidebar Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 26
 ,p_theme_class_id => 2
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => '<table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tl_img.gif" border="0" width="4" height="18" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#000000" height="1"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tr_img.gif" border="0" width="4" height="18" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#FF0000" height="16">'||unistr('\000a')||
'            <table border="0" cellpadding="0" cellspacing="0" width="100%">'||unistr('\000a')||
'              <tr>'||unistr('\000a')||
'                <td align=middle valign="top">'||unistr('\000a')||
'                  <div align="center">'||unistr('\000a')||
'                     <font color="#ffffff" face="Arial, Helvetica, sans-serif" size="1">'||unistr('\000a')||
'                      <b>#TITLE# </b></font></div>'||unistr('\000a')||
'                </td>'||unistr('\000a')||
'              </tr>'||unistr('\000a')||
'            </table>'||unistr('\000a')||
'          </td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'   <tr>'||unistr('\000a')||
'   <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'   <td valign="top" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="146" height="1" border="0" alt="" /><br />'||unistr('\000a')||
'            <table border="0" cellpadding="1" cellspacing="0" width="146" summary="">'||unistr('\000a')||
'              <tr>'||unistr('\000a')||
'                <td colspan="2">'||unistr('\000a')||
'                  <table border="0" cellpadding="2" cellspacing="0" width="124" summary="">'||unistr('\000a')||
'                    <tr>'||unistr('\000a')||
'                      <td>&nbsp;</td>'||unistr('\000a')||
'                      <td valign="top" width="106">'||unistr('\000a')||
'                        <P><FONT face="arial, helvetica" size="1">'||unistr('\000a')||
'                            #BODY#'||unistr('\000a')||
'                           </font>'||unistr('\000a')||
'                        </P>'||unistr('\000a')||
'                      </td>'||unistr('\000a')||
'                    </tr>'||unistr('\000a')||
'                  </table>'||unistr('\000a')||
'            </table>'||unistr('\000a')||
'          </td>'||unistr('\000a')||
'          <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#9a9c9a" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#b3b4b3" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'      </table>'||unistr('\000a')||
'      <table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#bl_img.gif" border="0" width="4" height="6" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#ffffff" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#br_img.gif" border="0" width="4" height="6" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#000000" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#9a9c9a" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#b3b4b3" width="1" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_heading_inside
prompt  ......region template 98831284174893464498
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831284174893464498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion uWhiteRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Sidebar Region - Heading Inside'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 26
 ,p_theme_class_id => 3
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_buttons
prompt  ......region template 98831284264261464500
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831284264261464500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="cWizardButtons cWizardButtonsLeft">'||unistr('\000a')||
'#PREVIOUS##CLOSE#'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div class="cWizardButtons cWizardButtonsRight">'||unistr('\000a')||
'#NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Wizard Buttons'
 ,p_theme_id => 26
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region
prompt  ......region template 98831284359660464500
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831284359660464500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Wizard Region'
 ,p_theme_id => 26
 ,p_theme_class_id => 12
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region_with_icon
prompt  ......region template 98831284468980464500
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831284468980464500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="uRegionHeading">'||unistr('\000a')||
'    <h1>#TITLE#</h1>'||unistr('\000a')||
'    <span class="uButtonContainer">'||unistr('\000a')||
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="uRegionContent clearfix">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</section>'
 ,p_page_plug_template_name => 'Wizard Region with Icon'
 ,p_theme_id => 26
 ,p_theme_class_id => 20
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/jquery_modal_region_template
prompt  ......region template 98831284591402464500
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 98831284591402464500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" style="display:none" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'jQuery Modal Region Template'
 ,p_theme_id => 26
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/button_list
prompt  ......list template 98831285759141464502
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="uButtonSmall uHotButton" #A01# role="button"><span>#TEXT#</span></a> ';

t2:=t2||'<a href="#LINK#" class="uButtonSmall" #A01# role="button"><span>#TEXT#</span></a> ';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831285759141464502 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 26,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="uButtonList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_tree
prompt  ......list template 98831285860576464502
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>98831285860576464502 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => 26,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/featured_list_with_subtext
prompt  ......list template 98831285960749464502
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li>'||unistr('\000a')||
'  <a href="#LINK#">'||unistr('\000a')||
'    <h3>#TEXT#</h3>'||unistr('\000a')||
'    <p>#A01#</p>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'</li>';

t2:=t2||'<li>'||unistr('\000a')||
'  <a href="#LINK#">'||unistr('\000a')||
'    <h3>#TEXT#</h3>'||unistr('\000a')||
'    <p>#A01#</p>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'</li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831285960749464502 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Featured List with Subtext',
  p_theme_id  => 26,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="featuredLinksList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/hierarchical_expanding
prompt  ......list template 98831286060004464502
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>98831286060004464502 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Hierarchical Expanding',
  p_theme_id  => 26,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
prompt  ......list template 98831286168691464502
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'    <li class="active">'||unistr('\000a')||
'      <a href="#LINK#">'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />'||unistr('\000a')||
'        <span>#TEXT#</span>'||unistr('\000a')||
'      </a>'||unistr('\000a')||
'    </li>';

t2:=t2||'    <li>'||unistr('\000a')||
'      <a href="#LINK#">'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />'||unistr('\000a')||
'        <span>#TEXT#</span>'||unistr('\000a')||
'      </a>'||unistr('\000a')||
'    </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831286168691464502 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 26,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<div class="uImagesList uHorizontalImagesList clearfix">'||unistr('\000a')||
'  <ul>',
  p_list_template_after_rows=>'  </ul>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_links_list
prompt  ......list template 98831286288094464502
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li> ';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li> ';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831286288094464502 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 26,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<ul class="uHorizontalLinksList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_wizard_progress_list
prompt  ......list template 98831286362943464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'    <li class="#LIST_STATUS#">'||unistr('\000a')||
'      <span>#TEXT#</span>'||unistr('\000a')||
'    </li>';

t2:=t2||'    <li class="#LIST_STATUS#">'||unistr('\000a')||
'      <span>#TEXT#</span>'||unistr('\000a')||
'    </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831286362943464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Wizard Progress List',
  p_theme_id  => 26,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="uHorizontalProgressList">'||unistr('\000a')||
'  <ul>',
  p_list_template_after_rows=>'  </ul>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/page_level_tabs_list
prompt  ......list template 98831286487752464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#" class="active">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831286487752464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Page Level Tabs List',
  p_theme_id  => 26,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<nav class="uPageTabs">'||unistr('\000a')||
'<ul>',
  p_list_template_after_rows=>'</ul>'||unistr('\000a')||
'</nav>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu
prompt  ......list template 98831286564652464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#f_spacer.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#arrow_down_gray_dark.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" />'||unistr('\000a')||
'</li>';

t6:=t6||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#arrow_down_gray_dark.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" / ></a></li>';

wwv_flow_api.create_list_template (
  p_id=>98831286564652464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu',
  p_theme_id  => 26,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image
prompt  ......list template 98831286690463464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  "/></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt="" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom3(this,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false)" />'||unistr('\000a')||
'<a href="#LINK#" class="dhtmlBottom">#TEXT#</a>'||unistr('\000a')||
'</div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom3(this,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false)" />'||unistr('\000a')||
'<a href="#LINK#" class="dhtmlBottom">#TEXT#</a>'||unistr('\000a')||
'</div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''S#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''S#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>98831286690463464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image',
  p_theme_id  => 26,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="S#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/search_filter_tabs
prompt  ......list template 98831286789628464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831286789628464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Search Filter Tabs',
  p_theme_id  => 26,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<ul class="ebaViewTabs">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tabbed_navigation_list
prompt  ......list template 98831286875168464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831286875168464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 26,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div class="uHorizontalTabs">'||unistr('\000a')||
'<ul>',
  p_list_template_after_rows=>'</ul>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list
prompt  ......list template 98831286959337464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'    <li class="active">'||unistr('\000a')||
'      <a href="#LINK#">'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />'||unistr('\000a')||
'        <span>#TEXT#</span>'||unistr('\000a')||
'      </a>'||unistr('\000a')||
'    </li>';

t2:=t2||'    <li>'||unistr('\000a')||
'      <a href="#LINK#">'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />'||unistr('\000a')||
'        <span>#TEXT#</span>'||unistr('\000a')||
'      </a>'||unistr('\000a')||
'    </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831286959337464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 26,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<div class="uImagesList uVerticalImagesList clearfix">'||unistr('\000a')||
'  <ul>',
  p_list_template_after_rows=>'  </ul>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_list_with_subtext_and_icon
prompt  ......list template 98831287070682464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'  <li>'||unistr('\000a')||
'    <a href="#LINK#">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="#A02#" alt="#LIST_LABEL#"/>'||unistr('\000a')||
'      <h3>#TEXT#</h3>'||unistr('\000a')||
'      <h4>#A01#</h4>'||unistr('\000a')||
'    </a>'||unistr('\000a')||
'  </li>';

t2:=t2||'  <li>'||unistr('\000a')||
'    <a href="#LINK#">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="#A02#" alt="#LIST_LABEL#"/>'||unistr('\000a')||
'      <h3>#TEXT#</h3>'||unistr('\000a')||
'      <h4>#A01#</h4>'||unistr('\000a')||
'    </a>'||unistr('\000a')||
'  </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831287070682464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical List with Subtext and Icon',
  p_theme_id  => 26,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="largeLinkList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_ordered_list
prompt  ......list template 98831287173647464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831287173647464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 26,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="uNumberedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 98831287291045464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831287291045464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 26,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<ul class="uVerticalSidebarList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
prompt  ......list template 98831287360825464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831287360825464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 26,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="uVerticalList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_without_bullets
prompt  ......list template 98831287476897464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831287476897464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullets',
  p_theme_id  => 26,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="uVerticalList noBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list_vertical
prompt  ......list template 98831287586751464503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="#LIST_STATUS#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /><span>#TEXT#</span></li>';

t2:=t2||'<li class="#LIST_STATUS#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /><span>#TEXT#</span></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>98831287586751464503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List - Vertical',
  p_theme_id  => 26,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="uVerticalProgressList" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><ul>',
  p_list_template_after_rows=>'</ul></div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/borderless_report
prompt  ......report template 98831284682757464500
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831284682757464500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless Report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportContainer uBorderlessReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<table summary="#REGION_TITLE#" class="uReport uReportBorderless">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_mouse_over=>'#F0F0F0',
  p_row_style_checked=>'#E8E8E8',
  p_theme_id  => 26,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 98831284682757464500 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/comment_bubbles
prompt  ......report template 98831284773706464500
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li class="#1#">'||unistr('\000a')||
'<div>'||unistr('\000a')||
'	<em>#2#</em>'||unistr('\000a')||
'	#3##4##5##6##7#'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<span>'||unistr('\000a')||
'	#8# (#9#) #10#'||unistr('\000a')||
'</span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831284773706464500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Comment Bubbles',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="commentBubbles">',
  p_row_template_after_rows =>'</ul>'||unistr('\000a')||
'<table class="uPaginationTable">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 26,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/fixed_headers
prompt  ......report template 98831284886368464500
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831284886368464500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Fixed Headers',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<div class="uFixedHeadersContainer">'||unistr('\000a')||
'<table summary="#REGION_TITLE#" class="uReport uReportFixedHeaders">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>'||unistr('\000a')||
'',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>'||unistr('\000a')||
'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_mouse_over=>'#F0F0F0',
  p_row_style_checked=>'#E8E8E8',
  p_theme_id  => 26,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 98831284886368464500 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>'||unistr('\000a')||
'');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 98831284980921464500
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831284980921464500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<table summary="#REGION_TITLE#" class="uReport uReportHorizontal">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_mouse_over=>'#F0F0F0',
  p_row_style_checked=>'#E8E8E8',
  p_theme_id  => 26,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 98831284980921464500 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/one_column_unordered_list
prompt  ......report template 98831285065753464500
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831285065753464500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportList" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<ul class="uReportList">',
  p_row_template_after_rows =>'</ul>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'NOT_CONDITIONAL',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'NOT_CONDITIONAL',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 26,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 98831285065753464500 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'OMIT');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/search_results_report_select_link_text_link_target_detail1_detail2_last_modified
prompt  ......report template 98831285171374464500
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>'||unistr('\000a')||
'<span class="title"><a href="#2#">#1#</a></span>'||unistr('\000a')||
'<span class="description"><span class="last_modified">#5#</span>#3#</span>'||unistr('\000a')||
'<span class="type">#4#</span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831285171374464500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Search Results Report (SELECT link_text, link_target, detail1, detail2, last_modified)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="sSearchResultsReport">',
  p_row_template_after_rows =>'</ul>'||unistr('\000a')||
'<table class="uPaginationTable">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 26,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 98831285284348464500
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831285284348464500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<table summary="#REGION_TITLE#" class="uReport uReportStandard">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_mouse_over=>'#F0F0F0',
  p_row_style_checked=>'#E8E8E8',
  p_theme_id  => 26,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 98831285284348464500 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternative
prompt  ......report template 98831285389631464502
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3:=c3||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="uOddRow">#COLUMN_VALUE#</td>';

c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831285389631464502 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard - Alternative',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportBody">'||unistr('\000a')||
'<tr><td>'||unistr('\000a')||
'<table summary="#REGION_TITLE#" class="uReport uReportAlternative">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tbody class="uReportPagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 26,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 98831285389631464502 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>'||unistr('\000a')||
'');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/two_column_portlet
prompt  ......report template 98831285464767464502
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>'||unistr('\000a')||
'  <span class="uValueHeading">'||unistr('\000a')||
'    #1#'||unistr('\000a')||
'  </span>'||unistr('\000a')||
'  <span class="uValue">'||unistr('\000a')||
'    #2#'||unistr('\000a')||
'  </span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831285464767464502 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Two Column Portlet',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="uValuePairs" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
  p_row_template_after_rows =>'</ul>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 26,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs
prompt  ......report template 98831285575351464502
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>'||unistr('\000a')||
'  <span class="uValueHeading">'||unistr('\000a')||
'    #COLUMN_HEADER#'||unistr('\000a')||
'  </span>'||unistr('\000a')||
'  <span class="uValue">'||unistr('\000a')||
'    #COLUMN_VALUE#'||unistr('\000a')||
'  </span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831285575351464502 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="uValuePairs" #REPORT_ATTRIBUTES#>',
  p_row_template_after_rows =>'</ul>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 26,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs_left_aligned
prompt  ......report template 98831285679053464502
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>'||unistr('\000a')||
'  <label>'||unistr('\000a')||
'    #COLUMN_HEADER#'||unistr('\000a')||
'  </label>'||unistr('\000a')||
'  <span>'||unistr('\000a')||
'    #COLUMN_VALUE#'||unistr('\000a')||
'  </span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 98831285679053464502 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs - Left Aligned',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="vapList tableBased" #REPORT_ATTRIBUTES# id="report_#REPORT_STATIC_ID#">',
  p_row_template_after_rows =>'</ul>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 26,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> 'shrahman 03/12/2012 Making table based ');
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/hidden_label_read_by_screen_reader
prompt  ......label template 98831287674951464503
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 98831287674951464503 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Hidden label, read by screen reader',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999" class="hideMeButHearMe">',
  p_template_body2=>'</label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#',
  p_theme_id  => 26,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 98831287760440464505
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 98831287760440464505 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="uNoLabel">',
  p_template_body2=>'</span>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 26,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional
prompt  ......label template 98831287865392464505
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 98831287865392464505 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uOptional">',
  p_template_body2=>'</label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 26,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_with_help
prompt  ......label template 98831287967782464505
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 98831287967782464505 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uOptional"><a class="uHelpLink" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 26,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required
prompt  ......label template 98831288064158464505
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 98831288064158464505 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uRequired">',
  p_template_body2=>' <img src="#IMAGE_PREFIX#f_spacer.gif" alt="#VALUE_REQUIRED#" class="uAsterisk" /></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 26,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_with_help
prompt  ......label template 98831288160493464505
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 98831288160493464505 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="uRequired"><a class="uHelpLink" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a> <img src="#IMAGE_PREFIX#f_spacer.gif" alt="#VALUE_REQUIRED#" class="uAsterisk" /></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>',
  p_theme_id  => 26,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 98831289262183464505
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 98831289262183464505 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<ul>',
  p_current_page_option=>'<li class="active"><span>#NAME#</span></li> ',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li> ',
  p_menu_link_attributes=>'',
  p_between_levels=>'<li class="uSeparator"><img src="#IMAGE_PREFIX#f_spacer.gif" class="uBreadcrumbSeparator" alt="" /></li> ',
  p_after_last=>'</ul>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 26,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu
prompt  ......template 98831289372669464506
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 98831289372669464506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t1HierarchicalMenu">',
  p_current_page_option=>'<li class="t1current">#NAME#</li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => 26,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 98831289781460464506
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 98831289781460464506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#f_spacer.gif',
  p_popup_icon_attr=>'alt="#LIST_OF_VALUES#" title="#LIST_OF_VALUES#" class="uPopupLOVIcon"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge" /><![endif]-->'||unistr('\000a')||
'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#" type="text/css" media="all"/>'||unistr('\000a')||
'#THEME_CSS#',
  p_page_body_attr=>'class="uPopUpLOV"',
  p_before_field_text=>'<div class="uActionBar">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'class="searchField"',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'class="smallButton"',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'class="smallButton hotButton"',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'class="smallButton"',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'class="smallButton"',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<div class="lovPagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="lovLinks">',
  p_theme_id  => 26,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 98831289480429464506
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 98831289480429464506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th valign="bottom" class="DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="CalendarAlternative1Holder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="Day" valign="top" height="100" height="100">#TITLE_FORMAT##DATA#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="Today">#TITLE_FORMAT##DATA#',
  p_weekend_title_format=> '<div class="WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="WeekendDay">#TITLE_FORMAT##DATA#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="WeekCalendarAlternative1Holder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="MonthTitle">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="WeekCalendarAlternative1">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="DayCalendarAlternative1Holder"> <tr><td class="MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="DayCalendarAlternative1">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="Today">',
  p_daily_time_open_format => '<th class="Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '',
  p_agenda_past_day_format => '',
  p_agenda_today_day_format => '',
  p_agenda_future_day_format => '',
  p_agenda_past_entry_format => '',
  p_agenda_today_entry_format => '',
  p_agenda_future_entry_format => '',
  p_month_data_format => '#DAYS#',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => 26,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar_alternative
prompt  ......template 98831289570893464506
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 98831289570893464506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar - Alternative',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="CalendarHolder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="Calendar">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="Day" valign="top">#TITLE_FORMAT##DATA#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="Today">#TITLE_FORMAT##DATA#',
  p_weekend_title_format=> '<div class="WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="WeekendDay">#TITLE_FORMAT##DATA#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="WeekCalendarHolder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="WeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="DayCalendar">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="Today">',
  p_daily_time_open_format => '<th class="Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '',
  p_agenda_past_day_format => '',
  p_agenda_today_day_format => '',
  p_agenda_future_day_format => '',
  p_agenda_past_entry_format => '',
  p_agenda_today_entry_format => '',
  p_agenda_future_entry_format => '',
  p_month_data_format => '#DAYS#',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => 26,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/small_calendar
prompt  ......template 98831289684799464506
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 98831289684799464506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th scope="col">#DY#</th>',
  p_month_title_format=> '<table class="uCalendarSmall" summary="#IMONTH# #YYYY#">'||unistr('\000a')||
'  <caption>#IMONTH# #YYYY#</caption>',
  p_month_open_format=> '',
  p_month_close_format=> '  </tbody>'||unistr('\000a')||
'</table>',
  p_day_title_format=> '#DD#',
  p_day_open_format=> '<td>#TITLE_FORMAT##DATA#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td class="today">#TITLE_FORMAT##DATA#',
  p_weekend_title_format=> '#DD#',
  p_weekend_open_format => '<td class="weekend">#TITLE_FORMAT##DATA#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '#DD#',
  p_nonday_open_format => '<td class="inactive">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="SmallWeekCalendarHolder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="DayOfWeek">#DY#<br />#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="SmallWeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="Day" valign="top"><div class="inner">',
  p_weekly_day_close_format => '</div></td>',
  p_weekly_today_open_format => '<td class="t1Today" valign="top"><div class="inner">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="NonDay"><div class="inner">',
  p_weekly_weekend_close_format => '</div></td>',
  p_weekly_time_open_format => '<th class="Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="DayOfWeek">#DY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="SmallDayCalendarHolder"> <tr> <td class="MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="SmallDayCalendar">',
  p_daily_month_close_format => '</table></td></tr></table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="Today">',
  p_daily_time_open_format => '<th class="Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '',
  p_agenda_past_day_format => '',
  p_agenda_today_day_format => '',
  p_agenda_future_day_format => '',
  p_agenda_past_entry_format => '',
  p_agenda_today_entry_format => '',
  p_agenda_future_entry_format => '',
  p_month_data_format => '#DAYS#',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => 26,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/productivity_applications
prompt  ......theme 98831289881244464508
begin
wwv_flow_api.create_theme (
  p_id =>98831289881244464508 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 26,
  p_theme_name=>'Productivity Applications',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>98831280065018464492 + wwv_flow_api.g_id_offset,
  p_error_template=>98831279565012464491 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>98831280575871464494 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>98831279174362464489 + wwv_flow_api.g_id_offset,
  p_default_button_template=>98831288262132464505 + wwv_flow_api.g_id_offset,
  p_default_region_template=>98831283585770464498 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>98831281989135464497 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>98831282274108464497 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>98831283585770464498 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>98831283585770464498 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>98831284359660464500 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>98831281564475464497 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>98831281860784464497 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>98831282683820464498 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>98831285284348464500 + wwv_flow_api.g_id_offset,
  p_default_label_template=>98831287865392464505 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>98831289262183464505 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>98831289480429464506 + wwv_flow_api.g_id_offset,
  p_default_list_template=>98831287360825464503 + wwv_flow_api.g_id_offset,
  p_default_option_label=>98831287967782464505 + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>98831288160493464505 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...theme styles
--
 
begin
 
null;
 
end;
/

prompt  ...theme display points
--
 
begin
 
null;
 
end;
/

prompt  ...build options
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 26483
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...text messages
--
--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations
--
prompt  ...Shortcuts
--
prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/application_express_authentication
prompt  ......authentication 98831290160231464509
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 98831290160231464509 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Application Express Authentication'
 ,p_scheme_type => 'NATIVE_APEX_ACCOUNTS'
 ,p_invalid_session_type => 'LOGIN'
 ,p_use_secure_cookie_yn => 'N'
  );
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

prompt  ...plugins
--
--application/shared_components/plugins/process_type/gpv_ir_to_msexcel
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 12047995616880774 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'GPV_IR_TO_MSEXCEL'
 ,p_display_name => 'GPV Interactive Report to MSExcel'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'function gpv_get_xlsx_from_ir ('||unistr('\000a')||
'    p_process in apex_plugin.t_process,'||unistr('\000a')||
'    p_plugin  in apex_plugin.t_plugin )'||unistr('\000a')||
'    return apex_plugin.t_process_exec_result'||unistr('\000a')||
'is'||unistr('\000a')||
'begin'||unistr('\000a')||
' XML_TO_XSLX.download_file(p_app_id      => :APP_ID,'||unistr('\000a')||
'                              p_page_id  => :APP_PAGE_ID,'||unistr('\000a')||
'                              p_max_rows => p_process.attribute_05);'||unistr('\000a')||
'  return null;'||unistr('\000a')||
'exception'||unistr('\000a')||
'  when others then'||unistr('\000a')||
'    --Afte'||
'r adding\removing columns internal APEX views will not be refreshed - another download attempt needed'||unistr('\000a')||
'    apex_application.g_print_success_message := apex_application.g_print_success_message||chr(10)||p_process.attribute_06;'||unistr('\000a')||
'   return null;'||unistr('\000a')||
'end gpv_get_xlsx_from_ir;'
 ,p_execution_function => 'gpv_get_xlsx_from_ir'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<p>'||unistr('\000a')||
'	The &quot;GPV Interactive Report to MSExcel&quot; APEX plugin lets you getting results of your Interactive Report in Excel-format, with <span class="short_text" id="result_box" lang="en"><span class="hps">correct displaying of Strings</span></span>, Number and Dates.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	Supported IR features:<br />'||unistr('\000a')||
'	* Filtering and Sorting<br />'||unistr('\000a')||
'	* Control Break<br />'||unistr('\000a')||
'	* Computations<br />'||unistr('\000a')||
'	* Aggregations<br />'||unistr('\000a')||
'	<br />'||unistr('\000a')||
'	<br />'||unistr('\000a')||
'	<br />'||unistr('\000a')||
'	&nbsp;</p>'||unistr('\000a')||
''
 ,p_version_identifier => '1.0'
 ,p_about_url => 'http://glebovpavel.github.io/plugin'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 12055521253962934 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 12047995616880774 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Maximum Rows'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_default_value => '1000'
 ,p_is_translatable => false
 ,p_help_text => 'Rows grater this value will be not exported. '||unistr('\000a')||
'To export <b>all rows</b>  set value of 1000000000. '
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 9584286054054086 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 12047995616880774 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => '"try again" message'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_default_value => 'Report refreshed. Please try download again.'
 ,p_is_translatable => false
 ,p_help_text => 'After adding\removing columns report need to be refreshed through pressing “Go”-Button.  When user did not do that, download stopped. After that another download attempt needed.'||unistr('\000a')||
'In this case, this message will be displayed.'||unistr('\000a')||
''
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '504B03041400060008000000210062EE9D686101000090040000130008025B436F6E74656E745F54797065735D2E786D6C20A2040228A0000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(2) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(3) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(4) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(5) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(6) := '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000AC944D4FC3300C86EF48FC872A57D466E380105AB7031F4798C4F801A171D7';
wwv_flow_api.g_varchar2_table(7) := '686912C5DED8FE3D6EF62184CAA6895D1AB5B1DFF7896B673459B7365B4144E35D2986C54064E02AAF8D9B97E263F692DF8B0C4939ADAC77508A0DA0988CAFAF46B34D00CC38DB61291AA2F02025560DB40A0B1FC0F14EED63AB885FE35C06552DD41CE4';
wwv_flow_api.g_varchar2_table(8) := 'ED6070272BEF081CE5D46988F1E8096AB5B4943DAFF9F396248245913D6E033BAF52A810ACA91431A95C39FDCB25DF39149C9962B031016F1843C85E876EE76F835DDE1B97261A0DD954457A552D63C8B5955F3E2E3EBD5F14C7457A287D5D9B0AB4AF96';
wwv_flow_api.g_varchar2_table(9) := '2D57A0C01041696C00A8B5455A8B5619B7E73EE29F8251A665786190EE7C49F80407F1FF06999EFF474832270C913616F0C2A7DD8A9E726E5404FD4E9127E3E2003FB58F7170DF4CA30FC81314E1FC2AEC47A4CBCE030B4124038721E96BB683234FDFF9';
wwv_flow_api.g_varchar2_table(10) := '86BFBA1DBAF9D6A07BBC65BA4FC6DF000000FFFF0300504B030414000600080000002100B5553023F50000004C0200000B0008025F72656C732F2E72656C7320A2040228A000020000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(11) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(12) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(13) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(14) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(15) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008C92CF4EC3300CC6EF48BC43E4FBEA6E48';
wwv_flow_api.g_varchar2_table(16) := '08A1A5BB4C48BB21541EC024EE1FB58DA32440F7F68403824A63DBD1F6E7CF3F5BDEEEE669541F1C622F4EC3BA2841B133627BD76A78AD9F560FA06222676914C71A8E1C6157DDDE6C5F78A4949B62D7FBA8B28B8B1ABA94FC2362341D4F140BF1EC72A5';
wwv_flow_api.g_varchar2_table(17) := '913051CA6168D19319A865DC94E53D86BF1E502D3CD5C16A08077B07AA3EFA3CF9B2B7344D6F782FE67D62974E8C409E133BCB76E543660BA9CFDBA89A42CB498315F39CD311C9FB2263039E26DA5C4FF4FFB63871224B89D048E0F33CDF8A7340EBEB81';
wwv_flow_api.g_varchar2_table(18) := '2E9F68A9F8BDCE3CE2A784E14D64F861C1C50F545F000000FFFF0300504B030414000600080000002100F04C147DD30000004A01000023000000786C2F776F726B7368656574732F5F72656C732F7368656574312E786D6C2E72656C7384D0C14A04310C';
wwv_flow_api.g_varchar2_table(19) := '06E0BBE03B94DC9DCE7A109199D98B0A7BF022EB03C436D3966D93D256D9797B7B515C103CFE24F91232EDCF29AA4F2A3508CFB01B4650C4466C6037C3DBF1F9E61E546DC816A330CDB05185FD727D35BD52C4D687AA0FB9AAAE709DC1B7961FB4AEC653';
wwv_flow_api.g_varchar2_table(20) := 'C23A4826EE95554AC2D663713AA339A1237D3B8E77BAFC3660B930D5C1CE500E7607EAB8E5BEF97F5BD635187A14F39188DB1F2BB4EF5289814F1DC5E2A8FDB08D8C6789E2B60153A80347FDDE93FE6E7C11DB6F783A372A8C11F432E98B0F2C5F000000';
wwv_flow_api.g_varchar2_table(21) := 'FFFF0300504B03041400000008001578084583AFEAE3B5050000E31B000013000000786C2F7468656D652F7468656D65312E786D6CED59C9CBD34014BF0BFE0F43EE9A74C96715ABD8DABA2F68553CBEA6D36674920933D34F7B133D0A82B8E045F0E641';
wwv_flow_api.g_varchar2_table(22) := '5C40C18BFE356EB880FF822F49DB24CD54EB2EEAF7413BCBEFEDF3DE2CDDBEF37CC0C93A958A89B06955363B16A1A127062C1C35AD13BDEEA68645948670005C84B4694DA8B276EED8B8613B6CD33E0D2841FA506D83A6E56B1D6DB36DE5E130A8CD22A2';
wwv_flow_api.g_varchar2_table(23) := '21CE0D850C4063578EEC818473C837E076D571D6EC005868911002647B6438641E25BD98A5B563C6BCC3F123D42A1EF0B83CEEC583798A143B385B89BFD444B5B924EBC09B16CA1988733D7A5E5B8483D238D1B49CE4CFB2776CB7E7445C2FA1CDD17593';
wwv_flow_api.g_varchar2_table(24) := 'BF846E4A109357133A39EACF092BDDFAD62DBBE7FCAB29FF32AED3E9B43B9504370780E7A1A59512B6DE6D545A539E1968D62CF36E3BAE532FE0F3FC6B25FCD656ABE56E2DE06B19BE5EC2379CB5FAAE6A015FCFF06E59FFD6AE767BAD807733FC5A09DF';
wwv_flow_api.g_varchar2_table(25) := 'DDB275AD3EC767209FB3F0EC023A8DE82C32196428F85E23BC81F0C66C0164283BB7BA52FA502F5B6B019C11B28B8024B8A05948F424A243F010D786A02F1958248250281C70AA4ED7A9E167FC5F4F5A75148FA4147274E990A70A43334D88F2248B74D3';
wwv_flow_api.g_varchar2_table(26) := 'DA8F5CAD1CE4E3B3FB1F9F3D261F9F3D7A71F1C98B8B4F5F5CBAF4E2E24303E15E084779C2F777AF7EB87D81BC7B7CE7FDF51B66BCCAE35F3DB8FCF2F9353350E781AF6F3E7AF3E4D1EB5B57DEDEBB6E80EF92D0CFC37B2CA08A1CA6E7C8311140681240';
wwv_flow_api.g_varchar2_table(27) := 'FBF2EB287A3EB00205F88834003BDA2F000F4F809B702D5A74DE4989E5C104DC333E53D0F5B82FC79A198007FCA0003C24046F096934E700CA2A98330E4766E1729CC71D035837C96E2F84B6338E709D3330417D5A50F328C768C388865493784E9CA5D4';
wwv_flow_api.g_varchar2_table(28) := '40769A3156B08E79522831D4E434232D604697F4585F9B89F6B200E3320173A8A1407492B40437B1DF4DD78B48402F72134BCA0B6EDC03630D81516308781E7910B46F52F2F8447A05872B2D513AE5827406542913CD113929A87B00383387FD109F0445';
wwv_flow_api.g_varchar2_table(29) := 'A4D4EC6C1919EB27441EB95B9C6DFB1044469D59E8E7B1FBD4595CA2408E0A6D5442E43324ED631C205C1AEE938CEAAF4BEB136CE49B17483C3396A694A0A2988F133E049A30B717EA78C0C2CF1575CEB0AA2F1475F77F513717F55DB801F2CF97F20CF7';
wwv_flow_api.g_varchar2_table(30) := '7714F0DD300E8FD2D0FF5FBFFFD7EF7FB27E27B9FC4BAA7656A8ED9430776A0F961EDA878CF3E37AC2E94195947885E60DBA38987412A2F91D21F2B199885BC08D24246D22853EC5B47FDC8708C554AC645221EBB44122A17093B096F14E26708BD1E998';
wwv_flow_api.g_varchar2_table(31) := '9BDE491334E84362900ED7B2BB6A8E0DF6621179413564B0B2B0DA96EF135641D8EAD22AAE599AFB596976CE9B983704B30D59AD5553D1B85080D3018E240C92B0FC9C10291F06741AA38AD1904A6D25B7A5F7CED5A56DAD2D91F603839417575F22CEFD';
wwv_flow_api.g_varchar2_table(32) := '0151724A51B2CBE9C8C3628F9C43ADDCAA6B110FA2A635C41319368308F9A9B854011FE15B95A71353B2245DD960D76CB0B3C4E0051191547A37283FA54AA6664F3961A67FD545B7FE2803EC6FD5A2D6A8FC462DECC5D0D2E1907A7AC948D69DCE89B1A6';
wwv_flow_api.g_varchar2_table(33) := 'F2B83F3847FA7C2C8F01EA5D4F57D780298D2E9E75F0890EBD9DF41632DFB1CA4F465976008F7C98D6A4C62CF67378DCCE74C05E413DBBA0FB779B52FB81A6B8FFAE29F1CAC5036E6D905CBDF01820814432564B48ED0BAC4291CFBCAEC48343220BF5C2';
wwv_flow_api.g_varchar2_table(34) := '675E9C461DF17D3BF996747D56B7663CD22237F2F53136229261A5D3BEA4F4A89EDAF90566956AB6BF668CB053505745E9779FAE53DE8BB3770DED471E7E524DA6F429AE1C34DB945DFD51F70F3EF9D49DAF3F1E648252FAD585A54B69712BD8BA44859F';
wwv_flow_api.g_varchar2_table(35) := 'B3D556CD1657DD95B7DA08AF2924FEC0C2CDA4C7B3F36D4F1CC3E893F98992E042DCD498A6DF7CB08F3A37E6C6A5FC7EEE312A0B41C3F9F987CF9CB36B8BE2E631F839CE760DBE763FEF6ABB9CA276EE2213F7CA3F8489FE1994BD1BEF4763AE55FAEE74';
wwv_flow_api.g_varchar2_table(36) := '1E2FA5EDE94F18311F3B23DDF109504B0304140000000800B9650C4502C73C465B030000730B00000D000000786C2F7374796C65732E786D6CCD565F6FD330107F0689EF60E5BD7552DAB196963FDDA8840468D286B4075EDCC469ADF94FE4B85B33C477';
wwv_flow_api.g_varchar2_table(37) := 'E71C27719A6CB03190C84BEECEBEDFDDFDCEBE64FE762F38BAA63A674A2E8268180688CA58254C6E16C1D78BD5E03840B92132215C49BA080A9A076FDFBC783ECF4DC1E9F99652830042E68B606B4C36C3388FB754907CA8322A6125555A1003AADEE03C';
wwv_flow_api.g_varchar2_table(38) := 'D39424B975121C8FC2F0080BC264E01066227E000878E8AB5D368895C888616BC699294AAC008978F6712395266B0EA9EEA331896B6CABF4E1058BB5CA556A860087559AB298F6B39CE2290624A8FAD95CEEC44A981CC56A27CD221895D6DA8CDCEB6302';
wwv_flow_api.g_varchar2_table(39) := '4C1E8D03E4D23E5109642370828BE21BDACE8478FD2EC0F7FA4D0EFD926428C4B080C7F9CC719542A9A44AB693416599B32BA96EE4CA2E016099A1DB692510F35B744D382C4500E94CB1E24A2303AC40486F964450B7F78470B6D6AC59498960BC706BA3';
wwv_flow_api.g_varchar2_table(40) := 'C66A79AD3D04834ED475621BBE97C81AFF071995524D27E3BCD35B67ACD0E0C419AAE50A2CA8922F8A0C129470393C322C3FDC75A349118D265DEF4A7279AD954EA8EE64569BAB009CA6A6AE5AB3CDB6518CCA4AB1743046895A4B18D92849781DD9C1DD';
wwv_flow_api.g_varchar2_table(41) := '0B8DD001B8D52A786487019462B670990FFAC76442F714CEF5D1B86909068FC7E5D3C88E8D98727E6E235EA63D4AF669EB3285F62AC95AB47456A243730AFEB56374AF232259C68B2F3BB1A67A55DE586FB56DF6DAB2F4F2FA7BCE365250D97238D3CAD0';
wwv_flow_api.g_varchar2_table(42) := 'D8945338AC3924F53E3BA10D8BED2106F21A26B3C60971155FD1763D789F3AE65A6C79FA5ACCBDFA63E6D03E7D0A851E21EAF312DDC14B7467A0D1A352ED37AD87EB27F83F439EFC0564678529DFC4419DC7473D44F72DE936AA89D969483FE0C1C9B6BA';
wwv_flow_api.g_varchar2_table(43) := '8DDF7F5A47F84693EC82EE9DF35669760B48F64497F3E4AE02EC197E5C59E1D3CB7A441DE1611D3025EF2DC35FC5CBB433C4BA23CCAF2049ECC7EF8B6D396FDD95F58E71C36473F77EEF14769D3AA3C1A594ECEBA9E0F718FB2FD5CEB3044B684A76DC5C';
wwv_flow_api.g_varchar2_table(44) := 'D48B10D0CB9F69C27662DAEC3A63D7CA54BBBCFCC9763D3AAAC2009F9FF2F2735CCA68A7D922F8FE61F96A7AFA61351A1C87CBE3C1F8259D0CA693E5E960323E599E9EAEA6E1283CF9D1FAC37BC2FF9D20FED30548B39CC356ED0AAF0B392F6D552595E2';
wwv_flow_api.g_varchar2_table(45) := '4B69062FE4EFE86D8A9A63FFB7FCE627504B030414000600080000002100A69888AE7E010000FD02000010000801646F6350726F70732F6170702E786D6C20A2040128A00001000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(46) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(47) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(48) := '00000000000000000000000000000000000000000000000000009C92414FE3301085EF48FB1F22DFA9D32E5AA1CA314285158745546ACB9E8D33692C5C3BF20C51BBBF9E49A2D214F6C46D66DED3F3E7B1D5CD7EE7B31612BA180A319DE422836063E9C2';
wwv_flow_api.g_varchar2_table(49) := 'B6109BF5EFCB6B912199501A1F0314E200286EF48F0BB54CB181440E30E3888085A8899AB994686BD8199CB01C58A962DA19E2366D65AC2A67E12EDAB71D0492B33CFF25614F104A282F9B8F403124CE5BFA6E68196DC787CFEB43C3C05ADD368D77D610';
wwv_flow_api.g_varchar2_table(50) := 'DF523F3A9B22C68AB2FBBD05AFE458544CB702FB961C1D74AEE4B8552B6B3C2C385857C62328791AA80730DDD296C625D4AAA5790B9662CAD0FDE3B5CD44F662103A9C42B426391388B13ADBD0F4B56F9092FE1BD32BD600844AB26118F6E5D83BAEDD95';
wwv_flow_api.g_varchar2_table(51) := '9EF6062ECE8D5DC000C2C239E2DA91077CAA9626D17F88A763E29E61E01D70183F862F78FD8DF9A04FD17F5C78C54DB38E7786E0B8BAF3A15AD52641C9DB3EEAA7817AE0AD25DF852C6A13B6501E3D5F85EEA19F87DFACA75793FC67CE6F389A2979FAB7';
wwv_flow_api.g_varchar2_table(52) := 'FA1D0000FFFF0300504B0304140006000800000021007D21B1C23C0100005102000011000801646F6350726F70732F636F72652E786D6C20A2040128A0000100000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(53) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(54) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(55) := '000000000000000000000000000000000000008C925F4BC33014C5DF05BF43C97B9B3F8529A1ED40654F0E04278A6F21B9DB8A4D1A9268B76F6FDA6EB5833DF878EF39F9DD732F299607DD243FE07CDD9A12D18CA0048C6C556D76257ADBACD27B94F820';
wwv_flow_api.g_varchar2_table(56) := '8C124D6BA04447F06859DDDE14D272D93A7871AD05176AF0492419CFA52DD13E04CB31F6720F5AF82C3A4C14B7ADD322C4D2EDB015F24BEC003342165843104A04817B606A27223A21959C90F6DB350340490C0D6830C1639A51FCE70DE0B4BFFA605066';
wwv_flow_api.g_varchar2_table(57) := '4E5D87A38D3B9DE2CED94A8EE2E43EF87A32765D9775F91023E6A7F863FDFC3AAC9AD6A6BF950454154A72E94084D655059E17F1708DF0611D6FBCAD413D1CA37EA5A7E4107784804A62003EC63D2BEFF9E3D366852A462849294B49BE618CB33B4E169F';
wwv_flow_api.g_varchar2_table(58) := 'FDC88BF77DA0B1A14F83FF41A4AC27E639276C463C03C6DC979FA0FA050000FFFF0300504B01022D001400060008000000210062EE9D6861010000900400001300000000000000000000000000000000005B436F6E74656E745F54797065735D2E786D6C';
wwv_flow_api.g_varchar2_table(59) := '504B01022D0014000600080000002100B5553023F50000004C0200000B000000000000000000000000009A0300005F72656C732F2E72656C73504B01022D0014000600080000002100F04C147DD30000004A0100002300000000000000000000000000C0';
wwv_flow_api.g_varchar2_table(60) := '060000786C2F776F726B7368656574732F5F72656C732F7368656574312E786D6C2E72656C73504B01023F001400000008001578084583AFEAE3B5050000E31B00001300240000000000000020000000D4070000786C2F7468656D652F7468656D65312E';
wwv_flow_api.g_varchar2_table(61) := '786D6C0A0020000000000001001800FFC87F6000B3CF01E8A17F6000B3CF015F235B6000B3CF01504B01023F00140000000800B9650C4502C73C465B030000730B00000D00240000000000000020000000BA0D0000786C2F7374796C65732E786D6C0A00';
wwv_flow_api.g_varchar2_table(62) := '20000000000001001800BAFCFA3112B6CF01D6DD0D81D48ACF01D6DD0D81D48ACF01504B01022D0014000600080000002100A69888AE7E010000FD020000100000000000000000000000000040110000646F6350726F70732F6170702E786D6C504B0102';
wwv_flow_api.g_varchar2_table(63) := '2D00140006000800000021007D21B1C23C010000510200001100000000000000000000000000F4130000646F6350726F70732F636F72652E786D6C504B050600000000070007000C020000671600000000';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 4840452839393338 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 12047995616880774 + wwv_flow_api.g_id_offset
 ,p_file_name => 'ExcelTemplate.zip'
 ,p_mime_type => 'application/zip'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

prompt  ...data loading
--
--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s := null;
wwv_flow_api.create_install (
  p_id => 49415622747772197728 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_deinstall_script_clob => s,
  p_deinstall_message=> '');
end;
 
 
end;
/

--application/deployment/install
prompt  ...application install scripts
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE TABLE  "EBA_DEMO_IR_PROJECTS"'||unistr('\000a')||
'   (    "ID" NUMBER,'||unistr('\000a')||
'    "ROW_VERSION_NUMBER" NUMBER,'||unistr('\000a')||
'    "PROJECT" VARCHAR2(30),'||unistr('\000a')||
'    "TASK_NAME" VARCHAR2(255),'||unistr('\000a')||
'    "START_DATE" DATE,'||unistr('\000a')||
'    "END_DATE" DATE,'||unistr('\000a')||
'    "STATUS" VARCHAR2(30),'||unistr('\000a')||
'    "ASSIGNED_TO" VARCHAR2(30),'||unistr('\000a')||
'    "COST" NUMBER,'||unistr('\000a')||
'    "BUDGET" NUMBER'||unistr('\000a')||
'   ) ;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 49416021843710253371 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 49415622747772197728 + wwv_flow_api.g_id_offset,
  p_name => 'DDL',
  p_sequence=> 10,
  p_script_type=> 'INSTALL',
  p_condition_type=> 'NOT_EXISTS',
  p_condition=> 'select * from all_tables where table_name like ''EBA_DEMO_IR_PROJECTS''',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'REM INSERTING into EBA_DEMO_IR_PROJECTS'||unistr('\000a')||
'SET DEFINE OFF;'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''161179852406871144432500394320584194067'',''2'',''APEX Environment Configuration'',''Identify server requirements'',to_date(''26.03.14'',''DD.MM.RR''),to_date(''27.03.14'',''DD.MM.RR''),''Closed'',''John Watson'',''100'',''200'');'||unistr('\000a')||
'I';

s:=s||'nsert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''184550038451094665423032656816652711544'',''2'',''Maintain Support Systems'',''HR software upgrades'',to_date(''26.03.14'',''DD.MM.RR''),to_date(''21.05.14'',''DD.MM.RR''),''On-Hold'',''Pam King'',''8000'',''7000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAM';

s:=s||'E,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''5430448113265404262312761546467514427'',''2'',''Maintain Support Systems'',''Apply Billing System updates'',to_date(''26.03.14'',''DD.MM.RR''),to_date(''25.05.14'',''DD.MM.RR''),''On-Hold'',''Russ Sanders'',''9500'',''7000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values ';

s:=s||'(''135527055826422205897680141066809283567'',''2'',''APEX Environment Configuration'',''Determine Web listener configuration(s)'',to_date(''27.03.14'',''DD.MM.RR''),to_date(''27.03.14'',''DD.MM.RR''),''Closed'',''James Cassidy'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''266210147685957487525545439075510860801'',''';

s:=s||'2'',''APEX Environment Configuration'',''Specify security authentication scheme(s)'',to_date(''28.03.14'',''DD.MM.RR''),to_date(''30.03.14'',''DD.MM.RR''),''Closed'',''John Watson'',''200'',''300'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''91636560978552926032574940189893908751'',''2'',''APEX Environment Configuration'',''Select s';

s:=s||'ervers for Development, Test, Production'',to_date(''28.03.14'',''DD.MM.RR''),to_date(''02.04.14'',''DD.MM.RR''),''Closed'',''James Cassidy'',''200'',''600'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''198876954333682825755867808916330529204'',''2'',''Email Integration'',''Complete plan'',to_date(''02.04.14'',''DD.MM.RR''),to_date(''0';

s:=s||'8.05.14'',''DD.MM.RR''),''Closed'',''Mark Nile'',''3000'',''1500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''85274633846002240800031468992697136715'',''2'',''APEX Environment Configuration'',''Configure Workspace provisioning'',to_date(''04.04.14'',''DD.MM.RR''),to_date(''04.04.14'',''DD.MM.RR''),''Closed'',''John Watson'',''200'',''100';

s:=s||''');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''185837411018901006996643468783238591771'',''2'',''APEX Environment Configuration'',''Create pilot workspace'',to_date(''04.04.14'',''DD.MM.RR''),to_date(''04.04.14'',''DD.MM.RR''),''Closed'',''John Watson'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PRO';

s:=s||'JECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''85922159927111451597980601523779845667'',''2'',''Maintain Support Systems'',''Arrange for vacation coverage'',to_date(''14.05.14'',''DD.MM.RR''),to_date(''06.06.14'',''DD.MM.RR''),''Open'',''Al Bines'',''300'',''500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) v';

s:=s||'alues (''88750739688845217100424736088156811439'',''2'',''Migrate Access Application'',''Identify pilot Access applications'',to_date(''04.05.14'',''DD.MM.RR''),to_date(''09.05.14'',''DD.MM.RR''),''Closed'',''Mark Nile'',''300'',''500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''9296922358316614259173274775607392538'',''2'',''APEX E';

s:=s||'nvironment Configuration'',''Run installation'',to_date(''05.04.14'',''DD.MM.RR''),to_date(''05.04.14'',''DD.MM.RR''),''Closed'',''James Cassidy'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''298216180285429002934133820193657766152'',''2'',''Bug Tracker'',''Implement bug tracking software'',to_date(''09.04.14'',''DD.MM.';

s:=s||'RR''),to_date(''09.04.14'',''DD.MM.RR''),''Closed'',''Myra Sutcliff'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''35812075343330462138875673138636570712'',''2'',''Bug Tracker'',''Review automated testing tools'',to_date(''10.04.14'',''DD.MM.RR''),to_date(''09.05.14'',''DD.MM.RR''),''On-Hold'',''Myra Sutcliff'',''2750'',''150';

s:=s||'0'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''267488187500808989059795116081244322730'',''2'',''Discussion Forum'',''Identify owners'',to_date(''13.05.14'',''DD.MM.RR''),to_date(''16.05.14'',''DD.MM.RR''),''Closed'',''Hank Davis'',''250'',''300'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_';

s:=s||'DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''137084821999813214724349012710287268964'',''2'',''Migrate Access Application'',''Migrate pilot applications to APEX'',to_date(''11.05.14'',''DD.MM.RR''),to_date(''16.05.14'',''DD.MM.RR''),''Closed'',''Mark Nile'',''500'',''500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''14';

s:=s||'7269723561880395466889692970291767272'',''2'',''Discussion Forum'',''Install APEX application on internet server'',to_date(''21.05.14'',''DD.MM.RR''),to_date(''21.05.14'',''DD.MM.RR''),''Closed'',''Hank Davis'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''248120812210952291483291795192035476234'',''2'',''Discussion Fo';

s:=s||'rum'',''Monitor participation'',to_date(''22.05.14'',''DD.MM.RR''),to_date(''30.05.14'',''DD.MM.RR''),''Open'',''Hank Davis'',''450'',''500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''153196414849194308060325062483905633601'',''2'',''Train Developers in APEX'',''Publish development standards'',to_date(''22.04.14'',''DD.MM.RR''),to_da';

s:=s||'te(''28.06.14'',''DD.MM.RR''),''On-Hold'',''John Watson'',''1000'',''2000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''275789931423341712794539592602750827183'',''2'',''Migrate Access Application'',''Post-migration review'',to_date(''18.05.14'',''DD.MM.RR''),to_date(''18.05.14'',''DD.MM.RR''),''Closed'',''Mark Nile'',''100'',''100'');'||unistr('\000a')||
'Inse';

s:=s||'rt into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''41404534797623427636067160764208229525'',''2'',''Train Developers in APEX'',''Publish links to self-study courses'',to_date(''25.04.14'',''DD.MM.RR''),to_date(''25.04.14'',''DD.MM.RR''),''Closed'',''John Watson'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJE';

s:=s||'CT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''229993860266195762685768422165230026961'',''2'',''Train Developers in APEX'',''Create training workspace'',to_date(''25.04.14'',''DD.MM.RR''),to_date(''02.05.14'',''DD.MM.RR''),''Closed'',''James Cassidy'',''500'',''700'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET)';

s:=s||' values (''308676024629717623942297911494885710759'',''2'',''Migrate Access Application'',''Plan migration schedule'',to_date(''20.05.14'',''DD.MM.RR''),to_date(''20.05.14'',''DD.MM.RR''),''Closed'',''Mark Nile'',''600'',''200'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''63602817504064267395947411194686800257'',''2'',''Load Packaged';

s:=s||' Applications'',''Identify point solutions required'',to_date(''27.04.14'',''DD.MM.RR''),to_date(''29.04.14'',''DD.MM.RR''),''Closed'',''John Watson'',''200'',''300'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''127031349386400290543138904377247794780'',''2'',''Software Projects Tracking'',''Conduct project kickoff meeting'',to_date';

s:=s||'(''29.04.14'',''DD.MM.RR''),to_date(''29.04.14'',''DD.MM.RR''),''Closed'',''Pam King'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''4444377149856855517384576268516125140'',''2'',''Forms Conversion'',''Identify pilot Oracle Forms applications'',to_date(''29.04.14'',''DD.MM.RR''),to_date(''30.04.14'',''DD.MM.RR''),''Closed'',';

s:=s||'''Scott Spencer'',''200'',''200'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''42534618753379867373387014205735843949'',''2'',''Public Website'',''Determine host server'',to_date(''30.04.14'',''DD.MM.RR''),to_date(''01.05.14'',''DD.MM.RR''),''Closed'',''Tiger Scott'',''200'',''200'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NU';

s:=s||'MBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''278886181441611786883779014727394627488'',''2'',''Load Packaged Applications'',''Install in development'',to_date(''01.05.14'',''DD.MM.RR''),to_date(''01.05.14'',''DD.MM.RR''),''Closed'',''John Watson'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,';

s:=s||'BUDGET) values (''131107156494741881963559343286180279696'',''2'',''Public Website'',''Check software licenses'',to_date(''01.05.14'',''DD.MM.RR''),to_date(''01.05.14'',''DD.MM.RR''),''Closed'',''Tom Suess'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''92309505599748694955285965773480612199'',''2'',''Forms Conversion'',';

s:=s||'''Migrate pilot Forms to APEX'',to_date(''01.05.14'',''DD.MM.RR''),to_date(''14.05.14'',''DD.MM.RR''),''Closed'',''Scott Spencer'',''400'',''500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''334277299336407397582802499007902667326'',''2'',''Load Packaged Applications'',''Customize solutions'',to_date(''02.05.14'',''DD.MM.RR''),to_date';

s:=s||'(''25.07.14'',''DD.MM.RR''),''Open'',''John Watson'',''1500'',''4000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''92104739966273309554978709228225660140'',''2'',''Software Projects Tracking'',''Enter base data (Projects, Milestones, etc.)'',to_date(''04.05.14'',''DD.MM.RR''),to_date(''05.05.14'',''DD.MM.RR''),''Closed'',''Tom Suess'',''';

s:=s||'200'',''200'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''194067457005903098155093815864148706614'',''2'',''Public Website'',''Purchase additional software licenses, if needed'',to_date(''04.05.14'',''DD.MM.RR''),to_date(''27.05.14'',''DD.MM.RR''),''On-Hold'',''Al Bines'',''300'',''1000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_';

s:=s||'VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''167461935711340397424199021487207228497'',''2'',''Email Integration'',''Check software licenses'',to_date(''06.05.14'',''DD.MM.RR''),to_date(''07.05.14'',''DD.MM.RR''),''Closed'',''Mark Nile'',''200'',''200'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,';

s:=s||'BUDGET) values (''293736670287338367088606669515380857860'',''2'',''Software Projects Tracking'',''Load current tasks and enhancements'',to_date(''06.05.14'',''DD.MM.RR''),to_date(''10.05.14'',''DD.MM.RR''),''Closed'',''Tom Suess'',''400'',''500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''120774332335172928533640080146973911535';

s:=s||''',''2'',''Email Integration'',''Get RFPs for new server'',to_date(''07.05.14'',''DD.MM.RR''),to_date(''28.05.14'',''DD.MM.RR''),''Open'',''Mark Nile'',''2000'',''1000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''32119658315734618008911155569743537406'',''2'',''Convert Excel Spreadsheet'',''Collect mission-critical spreadsheets'',to_d';

s:=s||'ate(''09.05.14'',''DD.MM.RR''),to_date(''10.07.14'',''DD.MM.RR''),''Open'',''Pam King'',''2500'',''4000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''64543596787907856548595714441304991664'',''2'',''Migrate Access Application'',''Migrate Access applications'',to_date(''22.05.14'',''DD.MM.RR''),to_date(''15.07.14'',''DD.MM.RR''),''Open'',''';

s:=s||'Mark Nile'',''1000'',''8000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''79227403547750594706470150253004163837'',''2'',''Convert Excel Spreadsheet'',''Create APEX applications from spreadsheets'',to_date(''09.05.14'',''DD.MM.RR''),to_date(''23.10.14'',''DD.MM.RR''),''Open'',''Pam King'',''6000'',''10000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_';

s:=s||'PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''233765400838241055216983781287684491429'',''2'',''Convert Excel Spreadsheet'',''Lock spreadsheets'',to_date(''09.05.14'',''DD.MM.RR''),to_date(''23.10.14'',''DD.MM.RR''),''Open'',''Pam King'',''1000'',''800'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,';

s:=s||'ASSIGNED_TO,COST,BUDGET) values (''338856442389347597174235957155662922644'',''2'',''Bug Tracker'',''Document quality assurance procedures'',to_date(''10.05.14'',''DD.MM.RR''),to_date(''13.06.14'',''DD.MM.RR''),''Open'',''Myra Sutcliff'',''3500'',''4000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''1331303660623255461688210943517';

s:=s||'60078618'',''2'',''Convert Excel Spreadsheet'',''Send links to previous spreadsheet owners'',to_date(''10.05.14'',''DD.MM.RR''),to_date(''25.10.14'',''DD.MM.RR''),''Open'',''Pam King'',''1000'',''1500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''195990478786953421635064624587434310707'',''2'',''Employee Satisfaction Survey'',''Comple';

s:=s||'te questionnaire'',to_date(''12.05.14'',''DD.MM.RR''),to_date(''26.05.14'',''DD.MM.RR''),''On-Hold'',''Irene Jones'',''1200'',''800'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''208228151141359656496139587247532280974'',''2'',''Forms Conversion'',''Post-migration review'',to_date(''15.05.14'',''DD.MM.RR''),to_date(''15.05.14'',''DD.MM.R';

s:=s||'R''),''Closed'',''Pam King'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''183069026749160597067858588092736251117'',''2'',''Forms Conversion'',''Plan migration schedule'',to_date(''16.05.14'',''DD.MM.RR''),to_date(''16.05.14'',''DD.MM.RR''),''Closed'',''Pam King'',''100'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_';

s:=s||'VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''221613841542888691360958431687958252506'',''2'',''Migrate Access Application'',''User acceptance testing'',to_date(''26.05.14'',''DD.MM.RR''),to_date(''25.07.14'',''DD.MM.RR''),''Open'',''Mark Nile'',''1500'',''6000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED';

s:=s||'_TO,COST,BUDGET) values (''138718308001040517506778006187433159720'',''2'',''Forms Conversion'',''Migrate Oracle Forms'',to_date(''20.05.14'',''DD.MM.RR''),to_date(''27.09.14'',''DD.MM.RR''),''Open'',''Pam King'',''300'',''12000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''203535040584761421132966835070943681001'',''2'',''Load Packa';

s:=s||'ged Applications'',''Implement in Production'',to_date(''21.05.14'',''DD.MM.RR''),to_date(''29.07.14'',''DD.MM.RR''),''Open'',''John Watson'',''200'',''1500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''311573875256497571997940211618849752226'',''2'',''Migrate Access Application'',''End-user Training'',to_date(''22.05.14'',''DD.MM.RR''';

s:=s||'),to_date(''17.07.14'',''DD.MM.RR''),''Open'',''John Watson'',''0'',''2000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''305406495902127166497871250750321076992'',''2'',''Maintain Support Systems'',''Investigate new Virus Protection software'',to_date(''23.05.14'',''DD.MM.RR''),to_date(''07.06.14'',''DD.MM.RR''),''Open'',''Pam King'',''1';

s:=s||'700'',''1500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''63872964516601554039311506341085462450'',''2'',''Migrate from SQL Server'',''Obtain SQL Server credentials'',to_date(''28.05.14'',''DD.MM.RR''),to_date(''31.05.14'',''DD.MM.RR''),''Pending'',''James Cassidy'',''0'',''500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_';

s:=s||'NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''193828764959523253515759866413380004808'',''2'',''Migrate from SQL Server'',''Create DB Connection to Oracle'',to_date(''02.06.14'',''DD.MM.RR''),to_date(''02.06.14'',''DD.MM.RR''),''Pending'',''Scott Spencer'',''0'',''100'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_';

s:=s||'TO,COST,BUDGET) values (''304645470658035603589678028859469033148'',''2'',''Migrate from SQL Server'',''Identify integration points'',to_date(''02.06.14'',''DD.MM.RR''),to_date(''22.06.14'',''DD.MM.RR''),''Pending'',''Mark Nile'',''0'',''2000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''225097668091746883392292020805851770083'',''';

s:=s||'2'',''Employee Satisfaction Survey'',''Review with legal'',to_date(''03.06.14'',''DD.MM.RR''),to_date(''09.06.14'',''DD.MM.RR''),''On-Hold'',''Irene Jones'',''200'',''400'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''333860592179294405183086801029758627758'',''2'',''Public Website'',''Develop web pages'',to_date(''04.06.14'',''DD.MM.RR''';

s:=s||'),to_date(''10.07.14'',''DD.MM.RR''),''On-Hold'',''Tiger Scott'',''800'',''2000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''26736360977510857238095657267004407344'',''2'',''Load Packaged Applications'',''Train developers / users'',to_date(''04.06.14'',''DD.MM.RR''),to_date(''18.08.14'',''DD.MM.RR''),''Pending'',''John Watson'',''0'',''80';

s:=s||'00'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''11830938690893145968846111851177785983'',''2'',''Email Integration'',''Purchase backup server'',to_date(''06.06.14'',''DD.MM.RR''),to_date(''02.07.14'',''DD.MM.RR''),''Pending'',''Mark Nile'',''0'',''3000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME';

s:=s||',START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''48215361036632759468071801912509679640'',''2'',''Employee Satisfaction Survey'',''Plan rollout schedule'',to_date(''10.06.14'',''DD.MM.RR''),to_date(''18.06.14'',''DD.MM.RR''),''On-Hold'',''Irene Jones'',''0'',''750'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''184979';

s:=s||'114577543664932888113928845227882'',''2'',''Migrate from SQL Server'',''Map data usage'',to_date(''14.06.14'',''DD.MM.RR''),to_date(''27.07.14'',''DD.MM.RR''),''Pending'',''Mark Nile'',''0'',''8000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''64277567996368880623689925611344813065'',''2'',''Bug Tracker'',''Train developers on trackin';

s:=s||'g bugs'',to_date(''14.06.14'',''DD.MM.RR''),to_date(''03.08.14'',''DD.MM.RR''),''On-Hold'',''Myra Sutcliff'',''0'',''2000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''89843406083247772494970734191008239694'',''2'',''Bug Tracker'',''Measure effectiveness of improved QA'',to_date(''26.06.14'',''DD.MM.RR''),to_date(''26.07.14'',''DD.MM.RR';

s:=s||'''),''Pending'',''Myra Sutcliff'',''0'',''1500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''144368673036417153132074257205584888846'',''2'',''Migrate from SQL Server'',''Decommission SQL Server'',to_date(''26.06.14'',''DD.MM.RR''),to_date(''23.09.14'',''DD.MM.RR''),''Pending'',''Al Bines'',''0'',''500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECT';

s:=s||'S (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''59464230442927634559578297047347115182'',''2'',''Forms Conversion'',''Test migrated applications'',to_date(''26.06.14'',''DD.MM.RR''),to_date(''18.10.14'',''DD.MM.RR''),''Pending'',''Russ Saunders'',''0'',''6000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,AS';

s:=s||'SIGNED_TO,COST,BUDGET) values (''170595398539462302661986144864036364085'',''2'',''Migrate from SQL Server'',''Convert processes'',to_date(''27.06.14'',''DD.MM.RR''),to_date(''25.08.14'',''DD.MM.RR''),''Pending'',''Pam King'',''0'',''3000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''116524855670562775049850644037854709093'',''2'',''';

s:=s||'Migrate from SQL Server'',''Implement integration using Oracle'',to_date(''28.06.14'',''DD.MM.RR''),to_date(''28.07.14'',''DD.MM.RR''),''Pending'',''Mark Nile'',''0'',''1500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''285872687965430438489953946443369444731'',''2'',''Forms Conversion'',''User acceptance testing'',to_date(''11.07.1';

s:=s||'4'',''DD.MM.RR''),to_date(''13.10.14'',''DD.MM.RR''),''Pending'',''Russ Saunders'',''0'',''2500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''243282925106421748006004184460861869701'',''2'',''Public Website'',''Plan rollout schedule'',to_date(''12.07.14'',''DD.MM.RR''),to_date(''12.07.14'',''DD.MM.RR''),''On-Hold'',''Tom Suess'',''0'',''100'')';

s:=s||';'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''246748654551359888074508317939811233867'',''2'',''Migrate from SQL Server'',''Migrate table structures'',to_date(''19.07.14'',''DD.MM.RR''),to_date(''13.08.14'',''DD.MM.RR''),''Pending'',''John Watson'',''0'',''2500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TA';

s:=s||'SK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''267731138188528447904440208480235692962'',''2'',''Migrate from SQL Server'',''Import data'',to_date(''20.07.14'',''DD.MM.RR''),to_date(''16.08.14'',''DD.MM.RR''),''Pending'',''John Watson'',''0'',''1000'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''161092768397';

s:=s||'662216736794178449678780323'',''2'',''Migrate from SQL Server'',''Notify users'',to_date(''30.07.14'',''DD.MM.RR''),to_date(''02.08.14'',''DD.MM.RR''),''Pending'',''Mark Nile'',''0'',''200'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''97314806758888957137550228370270439128'',''2'',''Forms Conversion'',''End-user Training'',to_date(''13.';

s:=s||'08.14'',''DD.MM.RR''),to_date(''25.10.14'',''DD.MM.RR''),''Pending'',''Myra Sutcliff'',''0'',''2500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''12183587249532197431638038275920012368'',''2'',''Forms Conversion'',''Rollout migrated Forms in APEX'',to_date(''16.10.14'',''DD.MM.RR''),to_date(''27.10.14'',''DD.MM.RR''),''Pending'',''Pam Kin';

s:=s||'g'',''0'',''500'');'||unistr('\000a')||
'Insert into EBA_DEMO_IR_PROJECTS (ID,ROW_VERSION_NUMBER,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (''192183542173041761111156274381778639503'',''2'',''Software Projects Tracking'',''Customize Software Projects software'',to_date(''09.05.14'',''DD.MM.RR''),to_date(''14.06.14'',''DD.MM.RR''),''Open'',''Tom Suess'',''600'',''1000'');'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 49416381036053298454 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 49415622747772197728 + wwv_flow_api.g_id_offset,
  p_name => 'TABLE_INSERTS',
  p_sequence=> 30,
  p_script_type=> 'INSTALL',
  p_condition_type=> 'NOT_EXISTS',
  p_condition=> 'select * from EBA_DEMO_IR_PROJECTS',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'/**********************************************'||unistr('\000a')||
'**'||unistr('\000a')||
'** Author: Pavel Glebov'||unistr('\000a')||
'** Date: 08-2014'||unistr('\000a')||
'**'||unistr('\000a')||
'** This all in one install script contains headrs and bodies of 3 packages'||unistr('\000a')||
'**'||unistr('\000a')||
'** IR_TO_XML.sql '||unistr('\000a')||
'** AS_ZIP.sql  '||unistr('\000a')||
'** XML_TO_XSLX.sql'||unistr('\000a')||
'**'||unistr('\000a')||
'**********************************************/'||unistr('\000a')||
'CREATE OR REPLACE package ir_to_xml as    '||unistr('\000a')||
'  --ver 1.3.'||unistr('\000a')||
'  -- download interactive report as PDF'||unistr('\000a')||
'  PROCEDURE get_report_xml(';

s:=s||'p_app_id          IN NUMBER,'||unistr('\000a')||
'                           p_page_id         in number,                                '||unistr('\000a')||
'                           p_return_type     IN CHAR DEFAULT ''X'', -- "Q" for debug information "X" for XML-Data'||unistr('\000a')||
'                           p_get_page_items  IN CHAR DEFAULT ''N'', -- Y,N - include page items in XML'||unistr('\000a')||
'                           p_items_list      in varchar2,         -- "';

s:=s||'," delimetered list of items that for including in XML'||unistr('\000a')||
'                           p_collection_name IN VARCHAR2,         -- name of APEX COLLECTION to save XML, when null - download as file'||unistr('\000a')||
'                           p_max_rows        IN NUMBER            -- maximum rows for export                            '||unistr('\000a')||
'                          );'||unistr('\000a')||
'  '||unistr('\000a')||
'  --return debug information'||unistr('\000a')||
'  function get_log return cl';

s:=s||'ob;'||unistr('\000a')||
'  '||unistr('\000a')||
'  -- get XML '||unistr('\000a')||
'  function get_report_xml(p_app_id          IN NUMBER,'||unistr('\000a')||
'                          p_page_id         in number,                                '||unistr('\000a')||
'                          p_get_page_items  IN CHAR DEFAULT ''N'', -- Y,N - include page items in XML'||unistr('\000a')||
'                          p_items_list      in varchar2,         -- "," delimetered list of items that for including in XML'||unistr('\000a')||
'             ';

s:=s||'             p_max_rows        IN NUMBER            -- maximum rows for export                            '||unistr('\000a')||
'                         )'||unistr('\000a')||
'  return xmltype;     '||unistr('\000a')||
'                              '||unistr('\000a')||
'END IR_TO_XML;'||unistr('\000a')||
''||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE package body ir_to_xml as   '||unistr('\000a')||
'  '||unistr('\000a')||
'  subtype largevarchar2 is varchar2(32000); '||unistr('\000a')||
' '||unistr('\000a')||
'  cursor cur_highlight(p_report_id in APEX_APPLICATION_PAGE_IR_RPT.REPORT_ID%TYPE,'||unistr('\000a')||
'            ';

s:=s||'           p_delimetered_column_list in varchar2) '||unistr('\000a')||
'  IS'||unistr('\000a')||
'  select replace(replace(replace(replace(condition_sql,''#APXWS_EXPR#'',''''''''||CONDITION_EXPRESSION||''''''''),''#APXWS_EXPR2#'',''''''''||CONDITION_EXPRESSION2||''''''''),''#APXWS_HL_ID#'',''1''),''#APXWS_CC_EXPR#'',''"''||CONDITION_COLUMN_NAME||''"'')  condition_sql,'||unistr('\000a')||
'       CONDITION_COLUMN_NAME,'||unistr('\000a')||
'       CONDITION_ENABLED,'||unistr('\000a')||
'       HIGHLIGHT_ROW_COLOR,'||unistr('\000a')||
'       HIGHLIGHT_';

s:=s||'ROW_FONT_COLOR,'||unistr('\000a')||
'       HIGHLIGHT_CELL_COLOR,'||unistr('\000a')||
'       HIGHLIGHT_CELL_FONT_COLOR,'||unistr('\000a')||
'       rownum COND_NUMBER,'||unistr('\000a')||
'       ''HIGHLIGHT_''||rownum COND_NAME'||unistr('\000a')||
'  from APEX_APPLICATION_PAGE_IR_COND'||unistr('\000a')||
'  where condition_type = ''Highlight'''||unistr('\000a')||
'    and report_id = p_report_id'||unistr('\000a')||
'    and condition_enabled = ''Yes'''||unistr('\000a')||
'    and instr('':''||p_delimetered_column_list||'':'','':''||CONDITION_COLUMN_NAME||'':'') > 0'||unistr('\000a')||
'    order by --rows highlight';

s:=s||'s first '||unistr('\000a')||
'           nvl2(HIGHLIGHT_ROW_COLOR,1,0) desc, '||unistr('\000a')||
'           nvl2(HIGHLIGHT_ROW_FONT_COLOR,1,0) desc,'||unistr('\000a')||
'           HIGHLIGHT_SEQUENCE;'||unistr('\000a')||
'  '||unistr('\000a')||
'  type t_col_names is table of apex_application_page_ir_col.report_label%type index by apex_application_page_ir_col.column_alias%type;'||unistr('\000a')||
'  type t_col_format_mask is table of APEX_APPLICATION_PAGE_IR_COMP.computation_format_mask%TYPE index by APEX_APPLICATION_';

s:=s||'PAGE_IR_COL.column_alias%TYPE;'||unistr('\000a')||
'  type t_header_alignment is table of APEX_APPLICATION_PAGE_IR_COL.heading_alignment%TYPE index by APEX_APPLICATION_PAGE_IR_COL.column_alias%TYPE;'||unistr('\000a')||
'  type t_column_alignment is table of apex_application_page_ir_col.column_alignment%type index by apex_application_page_ir_col.column_alias%type;'||unistr('\000a')||
'  type t_column_types is table of apex_application_page_ir_col.column_type%t';

s:=s||'ype index by apex_application_page_ir_col.column_alias%type;'||unistr('\000a')||
'  type t_highlight is table of cur_highlight%ROWTYPE index by binary_integer;'||unistr('\000a')||
'  '||unistr('\000a')||
'  type ir_report is record'||unistr('\000a')||
'   ('||unistr('\000a')||
'    report                    apex_ir.t_report,'||unistr('\000a')||
'    ir_data                   APEX_APPLICATION_PAGE_IR_RPT%ROWTYPE,'||unistr('\000a')||
'    displayed_columns         APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'    break_on                  APEX_APPLICATION_';

s:=s||'GLOBAL.VC_ARR2,'||unistr('\000a')||
'    break_really_on           APEX_APPLICATION_GLOBAL.VC_ARR2, -- "break on" except hidden columns'||unistr('\000a')||
'    sum_columns_on_break      APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'    avg_columns_on_break      APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'    max_columns_on_break      APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'    min_columns_on_break      APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'    median_columns_on_break   APE';

s:=s||'X_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'    count_columns_on_break    APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'    count_distnt_col_on_break APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'    skipped_columns           INTEGER default 0, -- when scpecial coluns like apxws_row_pk is used'||unistr('\000a')||
'    start_with                INTEGER default 0, -- position of first displayed column in query'||unistr('\000a')||
'    end_with                  INTEGER default 0, ';

s:=s||'-- position of last displayed column in query'||unistr('\000a')||
'    agg_cols_cnt              INTEGER default 0, '||unistr('\000a')||
'    column_names              t_col_names,       -- column names in report header'||unistr('\000a')||
'    col_format_mask           t_col_format_mask, -- format like $3849,56'||unistr('\000a')||
'    row_highlight             t_highlight,'||unistr('\000a')||
'    col_highlight             t_highlight,'||unistr('\000a')||
'    header_alignment          t_header_alignment,'||unistr('\000a')||
'    column_al';

s:=s||'ignment          t_column_alignment,'||unistr('\000a')||
'    column_types              t_column_types  '||unistr('\000a')||
'   );  '||unistr('\000a')||
''||unistr('\000a')||
'   TYPE t_cell_data IS record'||unistr('\000a')||
'   ('||unistr('\000a')||
'     VALUE           VARCHAR2(100),'||unistr('\000a')||
'     text            CLOB'||unistr('\000a')||
'   );  '||unistr('\000a')||
''||unistr('\000a')||
'  l_report    ir_report;   '||unistr('\000a')||
'  v_debug     clob;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function get_log'||unistr('\000a')||
'  return clob'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return v_debug;'||unistr('\000a')||
'  end ';

s:=s||' get_log;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  procedure add(p_clob in out nocopy clob,p_str varchar2)'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    if p_str is not null then'||unistr('\000a')||
'      dbms_lob.writeappend(p_clob,length(p_str),p_str);'||unistr('\000a')||
'    end if;  '||unistr('\000a')||
'  end;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  procedure log(p_message in varchar2)'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begi';

s:=s||'n'||unistr('\000a')||
'    add(v_debug,p_message||chr(10));'||unistr('\000a')||
'    apex_debug_message.log_message(p_message => substr(p_message,1,32767),'||unistr('\000a')||
'                                   p_enabled => false,'||unistr('\000a')||
'                                   p_level   => 4);'||unistr('\000a')||
'  end log; '||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function bcoll(p_font_color    in varchar2 default null,'||unistr('\000a')||
'                 p_back_col';

s:=s||'or    in varchar2 default null,'||unistr('\000a')||
'                 p_align         in varchar2 default null,'||unistr('\000a')||
'                 p_width         in varchar2 default null,'||unistr('\000a')||
'                 p_column_alias  IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'                 p_colmn_type    IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'                 p_value         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'                 p_format_mask   IN VARCHAR2 DEFAULT NULL) '||unistr('\000a')||
'  return varc';

s:=s||'har2'||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_str varchar2(500);'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    v_str := v_str||''<CELL '';'||unistr('\000a')||
'    if p_column_alias is not null then v_str := v_str||''column-alias="''||p_column_alias||''" ''; end if;'||unistr('\000a')||
'    if p_font_color is not null then v_str := v_str||''color="''||p_font_color||''" ''; end if;'||unistr('\000a')||
'    if p_colmn_type is not null then V_STR := V_STR||''data-type="''||p_colmn_type||''" ''; end if;'||unistr('\000a')||
'    if p_back_color is not null then';

s:=s||' v_str := v_str||''background-color="''||p_back_color||''" ''; end if;'||unistr('\000a')||
'    if p_align is not null then V_STR := V_STR||''align="''||lower(p_align)||''" ''; end if;'||unistr('\000a')||
'    IF p_width IS NOT NULL THEN v_str := v_str||''width="''||p_width||''" ''; END IF;        '||unistr('\000a')||
'    IF p_value IS NOT NULL THEN v_str := v_str||''value="''||p_value||''" ''; END IF;'||unistr('\000a')||
'    if p_format_mask is not null then v_str := v_str||''format_mask="''||p';

s:=s||'_format_mask||''" ''; end if;'||unistr('\000a')||
'    v_str := v_str||''>''; '||unistr('\000a')||
'    '||unistr('\000a')||
'    return v_str;'||unistr('\000a')||
'  end bcoll;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function ecoll(i integer) '||unistr('\000a')||
'  return varchar2'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'   return ''</CELL>'';'||unistr('\000a')||
'  end ecoll;'||unistr('\000a')||
'    ------------------------------------------------------------------------------'||unistr('\000a')||
'  function get_column_names(p_column_alias in apex_a';

s:=s||'pplication_page_ir_col.column_alias%type)'||unistr('\000a')||
'  return APEX_APPLICATION_PAGE_IR_COL.report_label%TYPE'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return l_report.column_names(p_column_alias);'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    when others then'||unistr('\000a')||
'       raise_application_error(-20001,''get_column_names: p_column_alias=''||p_column_alias||'' ''||SQLERRM);'||unistr('\000a')||
'  end get_column_names;'||unistr('\000a')||
'  --------------------------------------------------------------------------';

s:=s||'----'||unistr('\000a')||
'  function get_col_format_mask(p_column_alias in apex_application_page_ir_col.column_alias%type)'||unistr('\000a')||
'  return APEX_APPLICATION_PAGE_IR_COMP.computation_format_mask%TYPE'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return l_report.col_format_mask(p_column_alias);'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    when others then'||unistr('\000a')||
'       raise_application_error(-20001,''get_column_names: p_column_alias=''||p_column_alias||'' ''||SQLERRM);'||unistr('\000a')||
'  end get_col_format_mask';

s:=s||';'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function get_header_alignment(p_column_alias in apex_application_page_ir_col.column_alias%type)'||unistr('\000a')||
'  return APEX_APPLICATION_PAGE_IR_COL.heading_alignment%TYPE'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return l_report.header_alignment(p_column_alias);'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    when others then'||unistr('\000a')||
'       raise_application_error(-20001,''get_column_names: p';

s:=s||'_column_alias=''||p_column_alias||'' ''||SQLERRM);'||unistr('\000a')||
'  end get_header_alignment;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function get_column_alignment(p_column_alias in apex_application_page_ir_col.column_alias%type)'||unistr('\000a')||
'  return apex_application_page_ir_col.column_alignment%type'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return l_report.column_alignment(p_column_alias);'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    wh';

s:=s||'en others then'||unistr('\000a')||
'       raise_application_error(-20001,''get_column_names: p_column_alias=''||p_column_alias||'' ''||SQLERRM);'||unistr('\000a')||
'  end get_column_alignment;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function get_column_types(p_column_alias in apex_application_page_ir_col.column_alias%type)'||unistr('\000a')||
'  return apex_application_page_ir_col.column_type%type'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    retu';

s:=s||'rn l_report.column_types(p_column_alias);'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    when others then'||unistr('\000a')||
'       raise_application_error(-20001,''get_column_names: p_column_alias=''||p_column_alias||'' ''||SQLERRM);'||unistr('\000a')||
'  END get_column_types;'||unistr('\000a')||
'  ------------------------------------------------------------------------------  '||unistr('\000a')||
'  function get_column_alias(p_num in binary_integer)'||unistr('\000a')||
'  return varchar2'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return l_report.displaye';

s:=s||'d_columns(p_num);'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    when others then'||unistr('\000a')||
'       raise_application_error(-20001,''get_column_alias: p_num=''||p_num||'' ''||SQLERRM);'||unistr('\000a')||
'  END get_column_alias;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_column_alias_sql(p_num IN binary_integer -- column number in sql-query'||unistr('\000a')||
'                               )'||unistr('\000a')||
'  return varchar2'||unistr('\000a')||
'  is'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    re';

s:=s||'turn l_report.displayed_columns(p_num - l_report.start_with + 1);'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    WHEN others THEN'||unistr('\000a')||
'       raise_application_error(-20001,''get_column_alias_sql: p_num=''||p_num||'' ''||SQLERRM);'||unistr('\000a')||
'  END get_column_alias_sql;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function get_current_row(p_current_row in apex_application_global.vc_arr2,'||unistr('\000a')||
'                       ';

s:=s||'    p_id in binary_integer)'||unistr('\000a')||
'  return apex_application_page_ir_col.column_type%type'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return p_current_row(p_id);'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    when others then'||unistr('\000a')||
'       raise_application_error(-20001,''get_current_row: p_id=''||p_id||'' ''||SQLERRM);'||unistr('\000a')||
'  end get_current_row; '||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  -- :::: -> :'||unistr('\000a')||
'  function rr(p_str in varchar2)'||unistr('\000a')||
' ';

s:=s||' return varchar2'||unistr('\000a')||
'  is '||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return ltrim(rtrim(regexp_replace(p_str,''[:]+'','':''),'':''),'':'');'||unistr('\000a')||
'  end;'||unistr('\000a')||
'  ------------------------------------------------------------------------------   '||unistr('\000a')||
'  function get_xmlval(p_str in varchar2)'||unistr('\000a')||
'  return varchar2'||unistr('\000a')||
'  is   '||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return dbms_xmlgen.convert(p_str);'||unistr('\000a')||
'    --RETURN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(p_str,''<'',''%26lt;''),''>'',''%26gt;''),''&'',''%26am';

s:=s||'p;''),''"'',''%26quot;''),'''''''',''%26apos;'');'||unistr('\000a')||
'  end get_xmlval;  '||unistr('\000a')||
'  ------------------------------------------------------------------------------  '||unistr('\000a')||
'  function intersect_arrays(p_one IN APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'                            p_two IN APEX_APPLICATION_GLOBAL.VC_ARR2)'||unistr('\000a')||
'  return APEX_APPLICATION_GLOBAL.VC_ARR2'||unistr('\000a')||
'  is    '||unistr('\000a')||
'    v_ret APEX_APPLICATION_GLOBAL.VC_ARR2;'||unistr('\000a')||
'  begin    '||unistr('\000a')||
'    for i in ';

s:=s||'1..p_one.count loop'||unistr('\000a')||
'       for b in 1..p_two.count loop'||unistr('\000a')||
'         if p_one(i) = p_two(b) then'||unistr('\000a')||
'            v_ret(v_ret.count + 1) := p_one(i);'||unistr('\000a')||
'           exit;'||unistr('\000a')||
'         end if;'||unistr('\000a')||
'       end loop;        '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    '||unistr('\000a')||
'    return v_ret;'||unistr('\000a')||
'  end intersect_arrays;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function intersect_count(p_one IN APEX_APPLICATION_GLOBA';

s:=s||'L.VC_ARR2,'||unistr('\000a')||
'                           p_two IN APEX_APPLICATION_GLOBAL.VC_ARR2)'||unistr('\000a')||
'  return integer'||unistr('\000a')||
'  is'||unistr('\000a')||
'   v_rez APEX_APPLICATION_GLOBAL.VC_ARR2;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    v_rez := intersect_arrays(p_one,p_two);'||unistr('\000a')||
'    return v_rez.count;'||unistr('\000a')||
'  end intersect_count; '||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  '||unistr('\000a')||
'  procedure init_t_report(p_app_id       in number,'||unistr('\000a')||
'                    ';

s:=s||'      p_page_id      in number)'||unistr('\000a')||
'  is'||unistr('\000a')||
'    l_region_id     number;'||unistr('\000a')||
'    l_report_id     number;'||unistr('\000a')||
'    v_query_targets apex_application_global.vc_arr2;'||unistr('\000a')||
'    l_new_report    ir_report;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    l_report := l_new_report;'||unistr('\000a')||
''||unistr('\000a')||
'    select region_id '||unistr('\000a')||
'    into l_region_id '||unistr('\000a')||
'    from APEX_APPLICATION_PAGE_REGIONS '||unistr('\000a')||
'    where application_id = p_app_id '||unistr('\000a')||
'      and page_id = p_page_id '||unistr('\000a')||
'      and source_type = ''Interac';

s:=s||'tive Report'';    '||unistr('\000a')||
'    '||unistr('\000a')||
'    --get base report id    '||unistr('\000a')||
'    log(''l_region_id=''||l_region_id);'||unistr('\000a')||
'    '||unistr('\000a')||
'    l_report_id := apex_ir.get_last_viewed_report_id (p_page_id   => p_page_id,'||unistr('\000a')||
'                                                      p_region_id => l_region_id);'||unistr('\000a')||
'    '||unistr('\000a')||
'    log(''l_base_report_id=''||l_report_id);'||unistr('\000a')||
'    '||unistr('\000a')||
'    select r.* '||unistr('\000a')||
'    into l_report.ir_data       '||unistr('\000a')||
'    from apex_application_page_ir_rpt r'||unistr('\000a')||
'';

s:=s||'    where application_id = p_app_id '||unistr('\000a')||
'      and page_id = p_page_id'||unistr('\000a')||
'      and session_id = v(''APP_SESSION'')'||unistr('\000a')||
'      and application_user = v(''APP_USER'')'||unistr('\000a')||
'      and base_report_id = l_report_id;'||unistr('\000a')||
'  '||unistr('\000a')||
'    log(''l_report_id=''||l_report_id);'||unistr('\000a')||
'    l_report_id := l_report.ir_data.report_id;                                                                 '||unistr('\000a')||
'      '||unistr('\000a')||
'      '||unistr('\000a')||
'    l_report.report := apex_ir.get_report (';

s:=s||'p_page_id        => p_page_id,'||unistr('\000a')||
'                                           p_region_id      => l_region_id'||unistr('\000a')||
'                                           --p_report_id      => l_report_id'||unistr('\000a')||
'                                          );'||unistr('\000a')||
'    for i in (select column_alias,'||unistr('\000a')||
'                     report_label,'||unistr('\000a')||
'                     heading_alignment,'||unistr('\000a')||
'                     column_alignment,'||unistr('\000a')||
'                     co';

s:=s||'lumn_type,'||unistr('\000a')||
'                     format_mask as  computation_format_mask,'||unistr('\000a')||
'                     nvl(instr('':''||l_report.ir_data.report_columns||'':'','':''||column_alias||'':''),0) column_order ,'||unistr('\000a')||
'                     nvl(instr('':''||l_report.ir_data.break_enabled_on||'':'','':''||column_alias||'':''),0) break_column_order'||unistr('\000a')||
'                from APEX_APPLICATION_PAGE_IR_COL'||unistr('\000a')||
'               where application_id = p_a';

s:=s||'pp_id'||unistr('\000a')||
'                 AND page_id = p_page_id'||unistr('\000a')||
'                 and display_text_as != ''HIDDEN'' --after report RESETTING l_report.ir_data.report_columns consists HIDDEN column - APEX bug????'||unistr('\000a')||
'                 and instr('':''||l_report.ir_data.report_columns||'':'','':''||column_alias||'':'') > 0'||unistr('\000a')||
'              UNION'||unistr('\000a')||
'              select computation_column_alias,'||unistr('\000a')||
'                     computation_report_label';

s:=s||','||unistr('\000a')||
'                     ''center'' as heading_alignment,'||unistr('\000a')||
'                     ''right'' AS column_alignment,'||unistr('\000a')||
'                     computation_column_type,'||unistr('\000a')||
'                     computation_format_mask,'||unistr('\000a')||
'                     nvl(instr('':''||l_report.ir_data.report_columns||'':'','':''||computation_column_alias||'':''),0) column_order,'||unistr('\000a')||
'                     nvl(instr('':''||l_report.ir_data.break_enabled_on||'':'','':''';

s:=s||'||computation_column_alias||'':''),0) break_column_order'||unistr('\000a')||
'              from apex_application_page_ir_comp'||unistr('\000a')||
'              where application_id = p_app_id'||unistr('\000a')||
'                and page_id = p_page_id'||unistr('\000a')||
'                and report_id = l_report_id'||unistr('\000a')||
'                AND instr('':''||l_report.ir_data.report_columns||'':'','':''||computation_column_alias||'':'') > 0'||unistr('\000a')||
'              order by  break_column_order asc,column_orde';

s:=s||'r asc)'||unistr('\000a')||
'    loop                 '||unistr('\000a')||
'      l_report.column_names(i.column_alias) := i.report_label; '||unistr('\000a')||
'      l_report.col_format_mask(i.column_alias) := i.computation_format_mask;'||unistr('\000a')||
'      l_report.header_alignment(i.column_alias) := i.heading_alignment; '||unistr('\000a')||
'      l_report.column_alignment(i.column_alias) := i.column_alignment; '||unistr('\000a')||
'      l_report.column_types(i.column_alias) := i.column_type;'||unistr('\000a')||
'      IF i.column_o';

s:=s||'rder > 0 THEN'||unistr('\000a')||
'        IF i.break_column_order = 0 THEN '||unistr('\000a')||
'          --displayed column'||unistr('\000a')||
'          l_report.displayed_columns(l_report.displayed_columns.count + 1) := i.column_alias;'||unistr('\000a')||
'        ELSE  '||unistr('\000a')||
'          --break column'||unistr('\000a')||
'          l_report.break_really_on(l_report.break_really_on.count + 1) := i.column_alias;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'      end if;  '||unistr('\000a')||
'      '||unistr('\000a')||
'      log(''column=''||i.column_alias||'' l_report.colu';

s:=s||'mn_names=''||i.report_label);'||unistr('\000a')||
'      log(''column=''||i.column_alias||'' l_report.col_format_mask=''||i.computation_format_mask);'||unistr('\000a')||
'      log(''column=''||i.column_alias||'' l_report.header_alignment=''||i.heading_alignment);'||unistr('\000a')||
'      log(''column=''||i.column_alias||'' l_report.column_alignment=''||i.column_alignment);'||unistr('\000a')||
'      log(''column=''||i.column_alias||'' l_report.column_types=''||i.column_type);'||unistr('\000a')||
'    end loop;    ';

s:=s||''||unistr('\000a')||
''||unistr('\000a')||
'    --l_report.break_on := APEX_UTIL.STRING_TO_TABLE(rr(l_report.ir_data.break_enabled_on));    '||unistr('\000a')||
'    l_report.sum_columns_on_break := APEX_UTIL.STRING_TO_TABLE(rr(l_report.ir_data.sum_columns_on_break));  '||unistr('\000a')||
'    l_report.avg_columns_on_break := APEX_UTIL.STRING_TO_TABLE(rr(l_report.ir_data.avg_columns_on_break));  '||unistr('\000a')||
'    l_report.max_columns_on_break := APEX_UTIL.STRING_TO_TABLE(rr(l_report.ir_data.';

s:=s||'max_columns_on_break));  '||unistr('\000a')||
'    l_report.min_columns_on_break := APEX_UTIL.STRING_TO_TABLE(rr(l_report.ir_data.min_columns_on_break));  '||unistr('\000a')||
'    l_report.median_columns_on_break := APEX_UTIL.STRING_TO_TABLE(rr(l_report.ir_data.median_columns_on_break)); '||unistr('\000a')||
'    l_report.count_columns_on_break := APEX_UTIL.STRING_TO_TABLE(rr(l_report.ir_data.count_columns_on_break));  '||unistr('\000a')||
'    l_report.count_distnt_col_on_break';

s:=s||' := APEX_UTIL.STRING_TO_TABLE(rr(l_report.ir_data.count_distnt_col_on_break)); '||unistr('\000a')||
'      '||unistr('\000a')||
'    l_report.agg_cols_cnt := l_report.sum_columns_on_break.count + '||unistr('\000a')||
'                             l_report.avg_columns_on_break.count +'||unistr('\000a')||
'                             l_report.max_columns_on_break.count + '||unistr('\000a')||
'                             l_report.min_columns_on_break.count +'||unistr('\000a')||
'                             l_report.media';

s:=s||'n_columns_on_break.count +'||unistr('\000a')||
'                             l_report.count_columns_on_break.count +'||unistr('\000a')||
'                             l_report.count_distnt_col_on_break.count;'||unistr('\000a')||
'    '||unistr('\000a')||
'    log(''l_report.displayed_columns=''||rr(l_report.ir_data.report_columns));'||unistr('\000a')||
'    log(''l_report.break_on=''||rr(l_report.ir_data.break_enabled_on));'||unistr('\000a')||
'    log(''l_report.sum_columns_on_break=''||rr(l_report.ir_data.sum_columns_on_brea';

s:=s||'k));'||unistr('\000a')||
'    log(''l_report.avg_columns_on_break=''||rr(l_report.ir_data.avg_columns_on_break));'||unistr('\000a')||
'    log(''l_report.max_columns_on_break=''||rr(l_report.ir_data.max_columns_on_break));'||unistr('\000a')||
'    LOG(''l_report.min_columns_on_break=''||rr(l_report.ir_data.min_columns_on_break));'||unistr('\000a')||
'    log(''l_report.median_columns_on_break=''||rr(l_report.ir_data.median_columns_on_break));'||unistr('\000a')||
'    log(''l_report.count_columns_on_break=''||r';

s:=s||'r(l_report.ir_data.count_distnt_col_on_break));'||unistr('\000a')||
'    log(''l_report.count_distnt_col_on_break=''||rr(l_report.ir_data.count_columns_on_break));'||unistr('\000a')||
'    log(''l_report.break_really_on=''||APEX_UTIL.TABLE_TO_STRING(l_report.break_really_on));'||unistr('\000a')||
'    log(''l_report.agg_cols_cnt=''||l_report.agg_cols_cnt);'||unistr('\000a')||
'    '||unistr('\000a')||
'    v_query_targets(v_query_targets.count + 1) := ''rez.*'';'||unistr('\000a')||
'     '||unistr('\000a')||
'    for c in cur_highlight(p_report_id =';

s:=s||'> l_report_id,'||unistr('\000a')||
'                           p_delimetered_column_list => l_report.ir_data.report_columns'||unistr('\000a')||
'                          ) '||unistr('\000a')||
'    loop'||unistr('\000a')||
'        if c.HIGHLIGHT_ROW_COLOR is not null or c.HIGHLIGHT_ROW_FONT_COLOR is not null then'||unistr('\000a')||
'          --is row highlight'||unistr('\000a')||
'          l_report.row_highlight(l_report.row_highlight.count + 1) := c;        '||unistr('\000a')||
'        else'||unistr('\000a')||
'          l_report.col_highlight(l_report.co';

s:=s||'l_highlight.count + 1) := c;           '||unistr('\000a')||
'        end if;  '||unistr('\000a')||
'        v_query_targets(v_query_targets.count + 1) := c.condition_sql;'||unistr('\000a')||
'    end loop;    '||unistr('\000a')||
'        '||unistr('\000a')||
'    l_report.report.sql_query := ''SELECT ''||APEX_UTIL.TABLE_TO_STRING(v_query_targets,'','')||'' from ( '''||unistr('\000a')||
'                                          ||l_report.report.sql_query||'' ) rez'';'||unistr('\000a')||
'    log(''l_report.report.sql_query=''||chr(10)||l_report.repo';

s:=s||'rt.sql_query||chr(10));'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    when no_data_found then'||unistr('\000a')||
'      raise_application_error(-20001,''No Interactive Report found on Page=''||p_page_id||'' Application=''||p_app_id||'' Please make sure that the report was running at least once by this session.'');'||unistr('\000a')||
'    when others then '||unistr('\000a')||
'      raise_application_error(-20001,''init_t_report: Page=''||p_page_id||'' Application=''||p_app_id||'' ''||sqlerrm);'||unistr('\000a')||
'  en';

s:=s||'d init_t_report;  '||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
' '||unistr('\000a')||
'  function is_control_break(p_curr_row  IN APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'                            p_prev_row  IN APEX_APPLICATION_GLOBAL.VC_ARR2)'||unistr('\000a')||
'  return boolean'||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_start_with      integer;'||unistr('\000a')||
'    v_end_with        integer;    '||unistr('\000a')||
'    v_tmp             integer;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    if nvl(l_report';

s:=s||'.break_really_on.count,0) = 0  then'||unistr('\000a')||
'      return false; --no control break'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    v_start_with := 1 + l_report.skipped_columns;    '||unistr('\000a')||
'    v_end_with   := l_report.skipped_columns + nvl(l_report.break_really_on.count,0);'||unistr('\000a')||
'    for i in v_start_with..v_end_with loop'||unistr('\000a')||
'      if p_curr_row(i) != p_prev_row(i) then'||unistr('\000a')||
'        return true;'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    return false;'||unistr('\000a')||
'  end is_control_b';

s:=s||'reak;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_cell_date(p_query_value IN VARCHAR2,p_format_mask IN VARCHAR2)'||unistr('\000a')||
'  RETURN t_cell_data'||unistr('\000a')||
'  IS'||unistr('\000a')||
'    v_data t_cell_data;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'     BEGIN'||unistr('\000a')||
'       v_data.value := to_date(p_query_value) - to_date(''01-03-1900'',''DD-MM-YYYY'') + 61;'||unistr('\000a')||
'       if p_format_mask is not null then'||unistr('\000a')||
'         v_data.text := to_char(to_d';

s:=s||'ate(p_query_value),p_format_mask);'||unistr('\000a')||
'       ELSE'||unistr('\000a')||
'         v_data.text := p_query_value;'||unistr('\000a')||
'       end if;'||unistr('\000a')||
'      exception'||unistr('\000a')||
'        WHEN others THEN '||unistr('\000a')||
'          v_data.text := p_query_value;'||unistr('\000a')||
'      END;      '||unistr('\000a')||
'      '||unistr('\000a')||
'      return v_data;'||unistr('\000a')||
'  end get_cell_date;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_cell_number(p_query_value IN VARCHAR2,p_format_mask IN ';

s:=s||'VARCHAR2)'||unistr('\000a')||
'  RETURN t_cell_data'||unistr('\000a')||
'  IS'||unistr('\000a')||
'    v_data t_cell_data;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'     begin'||unistr('\000a')||
'       v_data.value := trim(to_char(to_number(p_query_value),''9999999999999999999999990D0000000000000000000000000'',''NLS_NUMERIC_CHARACTERS = ''''.,''''''));'||unistr('\000a')||
'       '||unistr('\000a')||
'       if p_format_mask is not null then'||unistr('\000a')||
'         v_data.text := trim(to_char(to_number(p_query_value),p_format_mask));'||unistr('\000a')||
'       ELSE'||unistr('\000a')||
'         v_data.text := p_que';

s:=s||'ry_value;'||unistr('\000a')||
'       end if;'||unistr('\000a')||
'      exception'||unistr('\000a')||
'        WHEN others THEN '||unistr('\000a')||
'          v_data.text := p_query_value;'||unistr('\000a')||
'      END;      '||unistr('\000a')||
'      '||unistr('\000a')||
'      return v_data;'||unistr('\000a')||
'  END get_cell_number;  '||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function print_row(p_current_row     IN APEX_APPLICATION_GLOBAL.VC_ARR2)'||unistr('\000a')||
'  return varchar2 is'||unistr('\000a')||
'    v_clob            largevarchar2; --change'||unistr('\000a')||
'';

s:=s||'    v_column_alias    APEX_APPLICATION_PAGE_IR_COL.column_alias%TYPE;'||unistr('\000a')||
'    v_format_mask     APEX_APPLICATION_PAGE_IR_COMP.computation_format_mask%TYPE;'||unistr('\000a')||
'    v_row_color       varchar2(10); '||unistr('\000a')||
'    v_row_back_color  varchar2(10);'||unistr('\000a')||
'    v_cell_color      varchar2(10);'||unistr('\000a')||
'    v_cell_back_color VARCHAR2(10);     '||unistr('\000a')||
'    v_column_type     VARCHAR2(10);'||unistr('\000a')||
'    v_cell_data       t_cell_data;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'      --check that ';

s:=s||'row need to be highlighted'||unistr('\000a')||
'    <<row_highlights>>'||unistr('\000a')||
'    for h in 1..l_report.row_highlight.count loop'||unistr('\000a')||
'     BEGIN '||unistr('\000a')||
'      IF get_current_row(p_current_row,l_report.end_with + l_report.agg_cols_cnt + l_report.row_highlight(h).COND_NUMBER) IS NOT NULL THEN'||unistr('\000a')||
'         v_row_color       := l_report.row_highlight(h).HIGHLIGHT_ROW_FONT_COLOR;'||unistr('\000a')||
'         v_row_back_color  := l_report.row_highlight(h).HIGHLIGHT_R';

s:=s||'OW_COLOR;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'     exception       '||unistr('\000a')||
'       when no_data_found then'||unistr('\000a')||
'         log(''row_highlights: =''||'' end_with=''||l_report.end_with||'' agg_cols_cnt=''||l_report.agg_cols_cnt||'' COND_NUMBER=''||l_report.row_highlight(h).cond_number||'' h=''||h);'||unistr('\000a')||
'     end; '||unistr('\000a')||
'    end loop row_highlights;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    <<visible_columns>>'||unistr('\000a')||
'    for i in l_report.start_with..l_report.end_with loop'||unistr('\000a')||
'      v_cell_color  ';

s:=s||'     := NULL;'||unistr('\000a')||
'      v_cell_back_color  := NULL;'||unistr('\000a')||
'      v_cell_data.VALUE  := NULL;  '||unistr('\000a')||
'      v_cell_data.text   := NULL; '||unistr('\000a')||
''||unistr('\000a')||
'      v_column_alias := get_column_alias_sql(i);'||unistr('\000a')||
'      v_column_type := get_column_types(v_column_alias);'||unistr('\000a')||
'      v_format_mask := get_col_format_mask(v_column_alias);'||unistr('\000a')||
'      '||unistr('\000a')||
'      IF v_column_type = ''DATE'' THEN'||unistr('\000a')||
'         v_cell_data := get_cell_date(get_current_row(p_current_row,i)';

s:=s||',v_format_mask);                   '||unistr('\000a')||
'      ELSIF  v_column_type = ''NUMBER'' THEN      '||unistr('\000a')||
'         v_cell_data := get_cell_number(get_current_row(p_current_row,i),v_format_mask);'||unistr('\000a')||
'      ELSE --STRING'||unistr('\000a')||
'        v_format_mask := NULL;'||unistr('\000a')||
'        v_cell_data.VALUE  := NULL;  '||unistr('\000a')||
'        v_cell_data.text   := get_current_row(p_current_row,i);'||unistr('\000a')||
'      end if; '||unistr('\000a')||
'       '||unistr('\000a')||
'      --check that cell need to be highlighted'||unistr('\000a')||
'   ';

s:=s||'   <<column_highlights>>'||unistr('\000a')||
'      for h in 1..l_report.col_highlight.count loop'||unistr('\000a')||
'        begin'||unistr('\000a')||
'          --debug'||unistr('\000a')||
'          if get_current_row(p_current_row,l_report.end_with + l_report.agg_cols_cnt + l_report.col_highlight(h).COND_NUMBER) is not null '||unistr('\000a')||
'             and v_column_alias = l_report.col_highlight(h).CONDITION_COLUMN_NAME '||unistr('\000a')||
'          then'||unistr('\000a')||
'            v_cell_color       := l_report.col_highlig';

s:=s||'ht(h).HIGHLIGHT_CELL_FONT_COLOR;'||unistr('\000a')||
'            v_cell_back_color  := l_report.col_highlight(h).HIGHLIGHT_CELL_COLOR;'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        exception'||unistr('\000a')||
'       when no_data_found then'||unistr('\000a')||
'         log(''col_highlights: =''||'' end_with=''||l_report.end_with||'' agg_cols_cnt=''||l_report.agg_cols_cnt||'' COND_NUMBER=''||l_report.col_highlight(h).cond_number||'' h=''||h); '||unistr('\000a')||
'       end;'||unistr('\000a')||
'      END loop column_highligh';

s:=s||'ts;'||unistr('\000a')||
'      '||unistr('\000a')||
'      v_clob := v_clob ||bcoll(p_font_color   => nvl(v_cell_color,v_row_color),'||unistr('\000a')||
'                               p_back_color   => nvl(v_cell_back_color,v_row_back_color),'||unistr('\000a')||
'                               p_align        => get_column_alignment(v_column_alias),'||unistr('\000a')||
'                               p_column_alias => v_column_alias,'||unistr('\000a')||
'                               p_colmn_type   => v_column_type,'||unistr('\000a')||
'   ';

s:=s||'                            p_value        => v_cell_data.value,'||unistr('\000a')||
'                               p_format_mask  => replace(v_format_mask,''"'','''')'||unistr('\000a')||
'                              )'||unistr('\000a')||
'                       ||get_xmlval(v_cell_data.text)'||unistr('\000a')||
'                       ||ecoll(i);'||unistr('\000a')||
'    end loop visible_columns;'||unistr('\000a')||
'    return  ''<ROW>''||v_clob || ''</ROW>''||chr(10);    '||unistr('\000a')||
'  end print_row;'||unistr('\000a')||
'  '||unistr('\000a')||
'  -----------------------------';

s:=s||'------------------------------------------------- '||unistr('\000a')||
' '||unistr('\000a')||
'  function print_header'||unistr('\000a')||
'  return varchar2 is'||unistr('\000a')||
'    v_header_xml      largevarchar2;'||unistr('\000a')||
'    v_column_alias    APEX_APPLICATION_PAGE_IR_COL.column_alias%TYPE;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    v_header_xml := ''<HEADER>'';'||unistr('\000a')||
'    <<headers>>'||unistr('\000a')||
'    for i in 1..l_report.displayed_columns.count   loop'||unistr('\000a')||
'      V_COLUMN_ALIAS := get_column_alias(i);'||unistr('\000a')||
'      -- if current column is not cont';

s:=s||'rol break column'||unistr('\000a')||
'      if apex_plugin_util.get_position_in_list(l_report.break_on,v_column_alias) is null then      '||unistr('\000a')||
'        v_header_xml := v_header_xml ||bcoll(p_column_alias=>v_column_alias,p_align=>get_header_alignment(v_column_alias))'||unistr('\000a')||
'                                     ||get_xmlval(regexp_replace(get_column_names(v_column_alias),''<[^>]*>'','' ''))'||unistr('\000a')||
'                                     ||ecoll(i';

s:=s||');'||unistr('\000a')||
'      end if;  '||unistr('\000a')||
'    end loop headers;'||unistr('\000a')||
'    return  v_header_xml || ''</HEADER>''||chr(10);'||unistr('\000a')||
'  end print_header; '||unistr('\000a')||
'  ------------------------------------------------------------------------------  '||unistr('\000a')||
'  function print_control_break_header(p_current_row     in apex_application_global.vc_arr2) '||unistr('\000a')||
'  return varchar2'||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_cb_xml  largevarchar2;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    if nvl(l_report.break_really_on.count,0) = 0  th';

s:=s||'en'||unistr('\000a')||
'      return ''''; --no control break'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    '||unistr('\000a')||
'    <<break_columns>>'||unistr('\000a')||
'    for i in 1..nvl(l_report.break_really_on.count,0) loop'||unistr('\000a')||
'      --TODO: Add column header'||unistr('\000a')||
'      v_cb_xml := v_cb_xml ||get_column_names(l_report.break_really_on(i))||'': ''||get_current_row(p_current_row,i + l_report.skipped_columns)||'','';'||unistr('\000a')||
'    end loop visible_columns;'||unistr('\000a')||
'    '||unistr('\000a')||
'    return  ''<BREAK_HEADER>''||get_xmlval(rtrim(v';

s:=s||'_cb_xml,'','')) || ''</BREAK_HEADER>''||chr(10);    '||unistr('\000a')||
'  end print_control_break_header;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function find_rel_position (p_curr_col_name    IN varchar2,'||unistr('\000a')||
'                              p_agg_rows         IN APEX_APPLICATION_GLOBAL.VC_ARR2)'||unistr('\000a')||
'  return integer'||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_relative_position integer;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    <<aggregated_rows>>'||unistr('\000a')||
'  ';

s:=s||'  for i in 1..p_agg_rows.count loop'||unistr('\000a')||
'      if p_curr_col_name = p_agg_rows(i) then        '||unistr('\000a')||
'         return i;'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end loop aggregated_rows;'||unistr('\000a')||
'    '||unistr('\000a')||
'    return null;'||unistr('\000a')||
'  end find_rel_position;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function get_agg_text(p_curr_col_name   IN varchar2,'||unistr('\000a')||
'                        p_agg_rows        IN APEX_APPLICATION_GL';

s:=s||'OBAL.VC_ARR2,'||unistr('\000a')||
'                        p_current_row     IN APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'                        p_agg_text        IN varchar2,'||unistr('\000a')||
'                        p_position        in integer, --start position in sql-query'||unistr('\000a')||
'                        p_col_number      IN INTEGER, --column position when displayed'||unistr('\000a')||
'                        p_default_format_mask     IN varchar2 default null )  '||unistr('\000a')||
'  r';

wwv_flow_api.create_install_script(
  p_id => 2986818195418105 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 49415622747772197728 + wwv_flow_api.g_id_offset,
  p_name => 'Packages',
  p_sequence=> 40,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
begin
s:=s||'eturn varchar2'||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_tmp_pos       integer;  -- current column position in sql-query '||unistr('\000a')||
'    v_format_mask   apex_application_page_ir_comp.computation_format_mask%type;'||unistr('\000a')||
'    v_agg_value     varchar2(1000);'||unistr('\000a')||
'  begin'||unistr('\000a')||
'      v_tmp_pos := find_rel_position (p_curr_col_name,p_agg_rows); '||unistr('\000a')||
'      if v_tmp_pos is not null then'||unistr('\000a')||
'        v_format_mask := nvl(get_col_format_mask(get_column_alias_sql(p_col_numbe';

s:=s||'r)),p_default_format_mask);'||unistr('\000a')||
'        v_agg_value := trim(to_char(get_current_row(p_current_row,p_position + v_tmp_pos),v_format_mask));'||unistr('\000a')||
'        '||unistr('\000a')||
'        return  get_xmlval(p_agg_text||v_agg_value||'' ''||chr(10));'||unistr('\000a')||
'      else'||unistr('\000a')||
'        return  '''';'||unistr('\000a')||
'      end if;        '||unistr('\000a')||
'  end get_agg_text;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function get_agg_value(p_curr_col';

s:=s||'_name   in varchar2,'||unistr('\000a')||
'                         p_agg_rows        IN APEX_APPLICATION_GLOBAL.VC_ARR2,'||unistr('\000a')||
'                         p_current_row     in apex_application_global.vc_arr2,'||unistr('\000a')||
'                         p_position        in integer --start position in sql-query'||unistr('\000a')||
'                        )  '||unistr('\000a')||
'  return varchar2'||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_tmp_pos       integer;  -- current column position in sql-query '||unistr('\000a')||
'    v_format_ma';

s:=s||'sk   apex_application_page_ir_comp.computation_format_mask%type;'||unistr('\000a')||
'    v_agg_value     varchar2(100);'||unistr('\000a')||
'  begin'||unistr('\000a')||
'      v_tmp_pos := find_rel_position (p_curr_col_name,p_agg_rows); '||unistr('\000a')||
'      if v_tmp_pos is not null then'||unistr('\000a')||
'        v_agg_value := get_current_row(p_current_row,p_position + v_tmp_pos);'||unistr('\000a')||
'        return  get_xmlval(v_agg_value);'||unistr('\000a')||
'      else'||unistr('\000a')||
'        return  '''';'||unistr('\000a')||
'      end if;        '||unistr('\000a')||
'  end get_agg_va';

s:=s||'lue;'||unistr('\000a')||
'  '||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function print_aggregate(p_current_row     IN APEX_APPLICATION_GLOBAL.VC_ARR2) '||unistr('\000a')||
'  return varchar2'||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_aggregate_xml   largevarchar2;'||unistr('\000a')||
'    v_position        integer;    '||unistr('\000a')||
'    v_sum_value       varchar2(100);'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    if l_report.agg_cols_cnt  = 0 then'||unistr('\000a')||
'      return ''''; --no aggregate'||unistr('\000a')||
'    end if;    '||unistr('\000a')||
'  ';

s:=s||'  v_aggregate_xml := ''<AGGREGATE>'';   '||unistr('\000a')||
'      '||unistr('\000a')||
'    '||unistr('\000a')||
'    <<visible_columns>>'||unistr('\000a')||
'    for i in l_report.start_with..l_report.end_with loop'||unistr('\000a')||
'      v_position := l_report.end_with; --aggregate are placed after displayed columns and computations'||unistr('\000a')||
'      v_sum_value := get_agg_value(p_curr_col_name => get_column_alias_sql(i),'||unistr('\000a')||
'                         p_agg_rows      => l_report.sum_columns_on_break,'||unistr('\000a')||
'           ';

s:=s||'              p_current_row   => p_current_row,'||unistr('\000a')||
'                         p_position      => v_position'||unistr('\000a')||
'                        );'||unistr('\000a')||
'                        '||unistr('\000a')||
'      v_aggregate_xml := v_aggregate_xml || bcoll(p_column_alias=>get_column_alias_sql(i),'||unistr('\000a')||
'                                                  p_value => v_sum_value,'||unistr('\000a')||
'                                                  p_format_mask => get_col_forma';

s:=s||'t_mask(get_column_alias_sql(i))'||unistr('\000a')||
'                                                  );'||unistr('\000a')||
'      --one column cah have only one aggregate of each type'||unistr('\000a')||
'      v_aggregate_xml := v_aggregate_xml || get_agg_text(p_curr_col_name => get_column_alias_sql(i),'||unistr('\000a')||
'                                       p_agg_rows      => l_report.sum_columns_on_break,'||unistr('\000a')||
'                                       p_current_row   => p_curre';

s:=s||'nt_row,'||unistr('\000a')||
'                                       p_agg_text      => '' '','||unistr('\000a')||
'                                       p_position      => v_position,'||unistr('\000a')||
'                                       p_col_number    => i);'||unistr('\000a')||
'      v_position := v_position + l_report.sum_columns_on_break.count;'||unistr('\000a')||
'      v_aggregate_xml := v_aggregate_xml || get_agg_text(p_curr_col_name => get_column_alias_sql(i),'||unistr('\000a')||
'                          ';

s:=s||'             p_agg_rows      => l_report.avg_columns_on_break,'||unistr('\000a')||
'                                       p_current_row   => p_current_row,'||unistr('\000a')||
'                                       p_agg_text      => ''Avgerage:'','||unistr('\000a')||
'                                       p_position      => v_position,'||unistr('\000a')||
'                                       p_col_number    => i,'||unistr('\000a')||
'                                       p_default_format_mask  ';

s:=s||' => ''999G999G999G999G990D000'');'||unistr('\000a')||
'      v_position := v_position + l_report.avg_columns_on_break.count;                                       '||unistr('\000a')||
'      v_aggregate_xml := v_aggregate_xml || get_agg_text(p_curr_col_name => get_column_alias_sql(i),'||unistr('\000a')||
'                                       p_agg_rows      => l_report.max_columns_on_break,'||unistr('\000a')||
'                                       p_current_row   => p_current_r';

s:=s||'ow,'||unistr('\000a')||
'                                       p_agg_text      => ''Max:'','||unistr('\000a')||
'                                       p_position      => v_position,'||unistr('\000a')||
'                                       p_col_number    => i);'||unistr('\000a')||
'      v_position := v_position + l_report.max_columns_on_break.count;                                 '||unistr('\000a')||
'      v_aggregate_xml := v_aggregate_xml || get_agg_text(p_curr_col_name => get_column_alias_sq';

s:=s||'l(i),'||unistr('\000a')||
'                                       p_agg_rows      => l_report.min_columns_on_break,'||unistr('\000a')||
'                                       p_current_row   => p_current_row,'||unistr('\000a')||
'                                       p_agg_text      => ''Min:'','||unistr('\000a')||
'                                       p_position      => v_position,'||unistr('\000a')||
'                                       p_col_number    => i);'||unistr('\000a')||
'      v_position := v_position + l';

s:=s||'_report.min_columns_on_break.count;                                 '||unistr('\000a')||
'      v_aggregate_xml := v_aggregate_xml || get_agg_text(p_curr_col_name => get_column_alias_sql(i),'||unistr('\000a')||
'                                       p_agg_rows      => l_report.median_columns_on_break,'||unistr('\000a')||
'                                       p_current_row   => p_current_row,'||unistr('\000a')||
'                                       p_agg_text      => ''Median';

s:=s||':'','||unistr('\000a')||
'                                       p_position      => v_position,'||unistr('\000a')||
'                                       p_col_number    => i,'||unistr('\000a')||
'                                       p_default_format_mask   => ''999G999G999G999G990D000'');'||unistr('\000a')||
'      v_position := v_position + l_report.median_columns_on_break.count;                                 '||unistr('\000a')||
'      v_aggregate_xml := v_aggregate_xml || get_agg_text(p_curr_c';

s:=s||'ol_name => get_column_alias_sql(i),'||unistr('\000a')||
'                                       p_agg_rows      => l_report.count_columns_on_break,'||unistr('\000a')||
'                                       p_current_row   => p_current_row,'||unistr('\000a')||
'                                       p_agg_text      => ''Count:'','||unistr('\000a')||
'                                       p_position      => v_position,'||unistr('\000a')||
'                                       p_col_number    => i);'||unistr('\000a')||
'';

s:=s||'      v_position := v_position + l_report.count_columns_on_break.count;                                 '||unistr('\000a')||
'      v_aggregate_xml := v_aggregate_xml || get_agg_text(p_curr_col_name => get_column_alias_sql(i),'||unistr('\000a')||
'                                       p_agg_rows      => l_report.count_distnt_col_on_break,'||unistr('\000a')||
'                                       p_current_row   => p_current_row,'||unistr('\000a')||
'                           ';

s:=s||'            p_agg_text      => ''Count distinct:'','||unistr('\000a')||
'                                       p_position      => v_position,'||unistr('\000a')||
'                                       p_col_number    => i);'||unistr('\000a')||
'      v_aggregate_xml := v_aggregate_xml || ecoll(i);'||unistr('\000a')||
'    end loop visible_columns;'||unistr('\000a')||
'    return  v_aggregate_xml || ''</AGGREGATE>''||chr(10);'||unistr('\000a')||
'  end print_aggregate;    '||unistr('\000a')||
'  -------------------------------------------------';

s:=s||'-----------------------------'||unistr('\000a')||
'  function get_page_items(p_app_id         in number,'||unistr('\000a')||
'                          p_page_id        in number,'||unistr('\000a')||
'                          p_items_list     in varchar2,'||unistr('\000a')||
'                          p_get_page_items in char)'||unistr('\000a')||
'  return clob'||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_clob  clob;    '||unistr('\000a')||
'    v_item_names  APEX_APPLICATION_GLOBAL.VC_ARR2;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    v_clob := to_clob( ''<ITEMS>''||chr(10));'||unistr('\000a')||
'    '||unistr('\000a')||
'    s';

s:=s||'elect item_name'||unistr('\000a')||
'    bulk collect into v_item_names  '||unistr('\000a')||
'    from apex_application_page_items'||unistr('\000a')||
'    where application_id = p_app_id'||unistr('\000a')||
'      and ((page_id = p_page_id and p_get_page_items = ''Y'')'||unistr('\000a')||
'          or'||unistr('\000a')||
'          (P_ITEMS_LIST is not null and INSTR('',''||P_ITEMS_LIST||'','','',''||ITEM_NAME||'','') >  0))'||unistr('\000a')||
'    union '||unistr('\000a')||
'    select item_name'||unistr('\000a')||
'    from APEX_APPLICATION_ITEMS'||unistr('\000a')||
'    where application_id = p_app_id  '||unistr('\000a')||
'  ';

s:=s||'    and P_ITEMS_LIST is not null '||unistr('\000a')||
'      and instr('',''||p_items_list||'','','',''||item_name||'','') >  0;    '||unistr('\000a')||
'    '||unistr('\000a')||
'    <<items>>'||unistr('\000a')||
'    for i in 1..v_item_names.count loop'||unistr('\000a')||
'     v_clob := v_clob||to_clob(''<''||upper(v_item_names(i))||''>'''||unistr('\000a')||
'                                ||get_xmlval(v(v_item_names(i)))'||unistr('\000a')||
'                                ||''</''||upper(v_item_names(i))||''>''||chr(10));'||unistr('\000a')||
'    end loop items;'||unistr('\000a')||
'    '||unistr('\000a')||
'    ';

s:=s||'return v_clob||to_clob(''</ITEMS>''||chr(10)); '||unistr('\000a')||
'  end get_page_items;  '||unistr('\000a')||
' '||unistr('\000a')||
'  ------------------------------------------------------------------------------    '||unistr('\000a')||
'  procedure get_xml_from_ir(v_data in out nocopy clob,p_max_rows in integer)'||unistr('\000a')||
'  is'||unistr('\000a')||
'   v_cur         INTEGER; '||unistr('\000a')||
'   v_result      INTEGER;'||unistr('\000a')||
'   v_colls_count INTEGER;'||unistr('\000a')||
'   v_row         APEX_APPLICATION_GLOBAL.VC_ARR2;'||unistr('\000a')||
'   v_prev_row    APEX_APPLICATIO';

s:=s||'N_GLOBAL.VC_ARR2;'||unistr('\000a')||
'   v_columns     APEX_APPLICATION_GLOBAL.VC_ARR2;'||unistr('\000a')||
'   v_current_row number default 0;'||unistr('\000a')||
'   v_desc_tab    DBMS_SQL.DESC_TAB2;'||unistr('\000a')||
'   v_inside      boolean default false;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    v_cur := dbms_sql.open_cursor; '||unistr('\000a')||
'    dbms_sql.parse(v_cur,l_report.report.sql_query,dbms_sql.native);     '||unistr('\000a')||
'    dbms_sql.describe_columns2(v_cur,v_colls_count,v_desc_tab);    '||unistr('\000a')||
'    --skip internal primary key if';

s:=s||' need'||unistr('\000a')||
'    if lower(v_desc_tab(1).col_name) = ''apxws_row_pk'' then'||unistr('\000a')||
'      l_report.skipped_columns := 1;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    l_report.start_with := l_report.skipped_columns + 1 + nvl(l_report.break_really_on.count,0);'||unistr('\000a')||
'    l_report.end_with   := l_report.skipped_columns + nvl(l_report.break_really_on.count,0) + l_report.displayed_columns.count;    '||unistr('\000a')||
'    log(''l_report.start_with=''||l_report.start_with);'||unistr('\000a')||
'   ';

s:=s||' log(''l_report.end_with=''||l_report.end_with);'||unistr('\000a')||
'    log(''l_report.skipped_columns=''||l_report.skipped_columns);'||unistr('\000a')||
'    '||unistr('\000a')||
'    add(v_data,print_header); '||unistr('\000a')||
'    '||unistr('\000a')||
'    <<bind_variables>>'||unistr('\000a')||
'    for i in 1..l_report.report.binds.count loop'||unistr('\000a')||
'      --remove MAX_ROWS'||unistr('\000a')||
'      if l_report.report.binds(i).name = ''APXWS_MAX_ROW_CNT'' then      '||unistr('\000a')||
'        DBMS_SQL.BIND_VARIABLE (v_cur,l_report.report.binds(i).name,p_max_rows);';

s:=s||'      '||unistr('\000a')||
'        null;'||unistr('\000a')||
'      else'||unistr('\000a')||
'        DBMS_SQL.BIND_VARIABLE (v_cur,l_report.report.binds(i).name,l_report.report.binds(i).value);      '||unistr('\000a')||
'      end if;'||unistr('\000a')||
'    end loop bind_variables;'||unistr('\000a')||
''||unistr('\000a')||
'    <<query_columns>>'||unistr('\000a')||
'    for i in 1..v_colls_count loop'||unistr('\000a')||
'     v_row(i) := '''';'||unistr('\000a')||
'     dbms_sql.define_column(v_cur, i, v_row(i),32767);'||unistr('\000a')||
'    end loop query_columns;'||unistr('\000a')||
'    '||unistr('\000a')||
'    v_result := dbms_sql.execute(v_cur);         '||unistr('\000a')||
' ';

s:=s||'   <<main_cycle>>'||unistr('\000a')||
'    LOOP '||unistr('\000a')||
'         IF DBMS_SQL.FETCH_ROWS(v_cur)>0 THEN          '||unistr('\000a')||
'           -- get column values of the row '||unistr('\000a')||
'            v_current_row := v_current_row + 1;'||unistr('\000a')||
'            <<query_columns>>'||unistr('\000a')||
'            for i in 1..v_colls_count loop'||unistr('\000a')||
'               DBMS_SQL.COLUMN_VALUE(v_cur, i,v_row(i));                '||unistr('\000a')||
'            end loop;     '||unistr('\000a')||
'            --check control break'||unistr('\000a')||
'            if v_';

s:=s||'current_row > 1 then'||unistr('\000a')||
'             if is_control_break(v_row,v_prev_row) then                                             '||unistr('\000a')||
'               add(v_data,''</ROWSET>''||chr(10));'||unistr('\000a')||
'               v_inside := false;'||unistr('\000a')||
'             end if;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            if not v_inside then'||unistr('\000a')||
'              add(v_data,''<ROWSET>''||chr(10));'||unistr('\000a')||
'              add(v_data,print_control_break_header(v_row));'||unistr('\000a')||
'             ';

s:=s||' --print aggregates'||unistr('\000a')||
'              add(v_data,print_aggregate(v_row));'||unistr('\000a')||
'              v_inside := true;'||unistr('\000a')||
'            END IF;            --            '||unistr('\000a')||
'            <<query_columns>>'||unistr('\000a')||
'            for i in 1..v_colls_count loop'||unistr('\000a')||
'              v_prev_row(i) := v_row(i);                           '||unistr('\000a')||
'            end loop;                 '||unistr('\000a')||
'            --v_xml := v_xml||to_clob(print_row(v_row));'||unistr('\000a')||
'            add';

s:=s||'(v_data,print_row(v_row));'||unistr('\000a')||
'         ELSE --DBMS_SQL.FETCH_ROWS(v_cur)>0'||unistr('\000a')||
'           EXIT; '||unistr('\000a')||
'         END IF; '||unistr('\000a')||
'    END LOOP main_cycle;        '||unistr('\000a')||
'    if v_inside then'||unistr('\000a')||
'       add(v_data,''</ROWSET>'');'||unistr('\000a')||
'       v_inside := false;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'   dbms_sql.close_cursor(v_cur); '||unistr('\000a')||
'   '||unistr('\000a')||
'  end get_xml_from_ir;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  procedure get_final_xml(';

s:=s||' p_clob           in out nocopy clob,'||unistr('\000a')||
'                          p_app_id         in number,'||unistr('\000a')||
'                          p_page_id        in number,'||unistr('\000a')||
'                          p_items_list     in varchar2,'||unistr('\000a')||
'                          p_get_page_items in char,'||unistr('\000a')||
'                          p_max_rows       in number)'||unistr('\000a')||
'  is'||unistr('\000a')||
'   v_rows  apex_application_global.vc_arr2;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    add(p_clob,''<?xml version="1.0"';

s:=s||' encoding="UTF-8"?>''||chr(10)||''<DOCUMENT>''||chr(10));    '||unistr('\000a')||
'    add(p_clob,get_page_items(p_app_id,p_page_id,p_items_list,p_get_page_items));'||unistr('\000a')||
'    add(p_clob,''<DATA>''||chr(10));'||unistr('\000a')||
'   '||unistr('\000a')||
'    get_xml_from_ir(p_clob,p_max_rows);    '||unistr('\000a')||
'   '||unistr('\000a')||
'    add(p_clob,''</DATA>''||chr(10));'||unistr('\000a')||
'    add(p_clob,''</DOCUMENT>''||chr(10));'||unistr('\000a')||
'  end get_final_xml;'||unistr('\000a')||
' '||unistr('\000a')||
'  -----------------------------------------------------------------------';

s:=s||'-------'||unistr('\000a')||
'  procedure download_file(p_data        in clob,'||unistr('\000a')||
'                          p_mime_header in varchar2,'||unistr('\000a')||
'                          p_file_name   in varchar2)'||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_blob        blob;'||unistr('\000a')||
'    v_desc_offset PLS_INTEGER := 1;'||unistr('\000a')||
'    v_src_offset  PLS_INTEGER := 1;'||unistr('\000a')||
'    v_lang        PLS_INTEGER := 0;'||unistr('\000a')||
'    v_warning     PLS_INTEGER := 0;   '||unistr('\000a')||
'  begin'||unistr('\000a')||
'        dbms_lob.createtemporary(v_blob,true);'||unistr('\000a')||
'      ';

s:=s||'  dbms_lob.converttoblob(v_blob, p_data, dbms_lob.getlength(p_data), v_desc_offset, v_src_offset, dbms_lob.default_csid, v_lang, v_warning);'||unistr('\000a')||
'        sys.htp.init;'||unistr('\000a')||
'        sys.owa_util.mime_header(p_mime_header, FALSE );'||unistr('\000a')||
'        sys.htp.p(''Content-length: '' || sys.dbms_lob.getlength( v_blob));'||unistr('\000a')||
'        sys.htp.p(''Content-Disposition: attachment; filename="''||p_file_name||''"'' );'||unistr('\000a')||
'        sys.owa_util.';

s:=s||'http_header_close;'||unistr('\000a')||
'        sys.wpg_docload.download_file( v_blob );'||unistr('\000a')||
'        dbms_lob.freetemporary(v_blob);'||unistr('\000a')||
'  end download_file;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  procedure set_collection(p_collection_name in varchar2,p_data in clob)'||unistr('\000a')||
'  is'||unistr('\000a')||
'   v_tmp char;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    IF apex_collection.collection_exists (p_collection_name) = FALSE'||unistr('\000a')||
'    THEN'||unistr('\000a')||
'      apex_';

s:=s||'collection.create_collection (p_collection_name);'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
''||unistr('\000a')||
'   begin'||unistr('\000a')||
'     select ''1'' --clob001'||unistr('\000a')||
'     into v_tmp'||unistr('\000a')||
'     from apex_collections '||unistr('\000a')||
'     where collection_name = p_collection_name'||unistr('\000a')||
'        and seq_id = 1;'||unistr('\000a')||
'        '||unistr('\000a')||
'     apex_collection.update_member ( p_collection_name => p_collection_name'||unistr('\000a')||
'                                    , p_seq            => 1'||unistr('\000a')||
'                                    , p_cl';

s:=s||'ob001        => p_data);'||unistr('\000a')||
'   exception'||unistr('\000a')||
'     when no_data_found then'||unistr('\000a')||
'      apex_collection.add_member ( p_collection_name => p_collection_name'||unistr('\000a')||
'                                 , p_clob001         => p_data );'||unistr('\000a')||
'       '||unistr('\000a')||
'   end;'||unistr('\000a')||
'  end set_collection;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  procedure get_report_xml(p_app_id          IN NUMBER,'||unistr('\000a')||
'                  ';

s:=s||'         p_page_id         in number,                                '||unistr('\000a')||
'                           p_return_type     IN CHAR DEFAULT ''X'', -- "Q" for debug information, "X" for XML-Data'||unistr('\000a')||
'                           p_get_page_items  IN CHAR DEFAULT ''N'', -- Y,N - include page items in XML'||unistr('\000a')||
'                           p_items_list      in varchar2,         -- "," delimetered list of items that for includin';

s:=s||'g in XML'||unistr('\000a')||
'                           p_collection_name IN VARCHAR2,         -- name of APEX COLLECTION to save XML, when null - download as file'||unistr('\000a')||
'                           p_max_rows        IN NUMBER            -- maximum rows for export                            '||unistr('\000a')||
'                          )'||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_data      clob;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    dbms_lob.trim (v_debug,0);'||unistr('\000a')||
'    dbms_lob.createtemporary(v_data,true)';

s:=s||';'||unistr('\000a')||
'    --APEX_DEBUG_MESSAGE.ENABLE_DEBUG_MESSAGES(p_level => 7);'||unistr('\000a')||
'    log(''p_app_id=''||p_app_id);'||unistr('\000a')||
'    log(''p_page_id=''||p_page_id);'||unistr('\000a')||
'    log(''p_return_type=''||p_return_type);'||unistr('\000a')||
'    log(''p_get_page_items=''||p_get_page_items);'||unistr('\000a')||
'    log(''p_items_list=''||p_items_list);'||unistr('\000a')||
'    log(''p_collection_name=''||p_collection_name);'||unistr('\000a')||
'    log(''p_max_rows=''||p_max_rows);'||unistr('\000a')||
'    '||unistr('\000a')||
'    init_t_report(p_app_id,p_page_id);    '||unistr('\000a')||
'    if';

s:=s||' p_return_type = ''Q'' then  -- debug information    '||unistr('\000a')||
'        begin'||unistr('\000a')||
'          get_final_xml(v_data,p_app_id,p_page_id,p_items_list,p_get_page_items,p_max_rows);'||unistr('\000a')||
'          if p_collection_name is not null then  '||unistr('\000a')||
'            set_collection(upper(p_collection_name),v_data);'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        exception'||unistr('\000a')||
'          when others then'||unistr('\000a')||
'            log(''Error in IR_TO_XML.get_report_document ''||sqlerrm|';

s:=s||'|chr(10)||chr(10)||dbms_utility.format_error_backtrace);            '||unistr('\000a')||
'        end;'||unistr('\000a')||
'        download_file(v_debug,''text/txt'',''log.txt'');'||unistr('\000a')||
'    elsif p_return_type = ''X'' then --XML-Data'||unistr('\000a')||
'        get_final_xml(v_data,p_app_id,p_page_id,p_items_list,p_get_page_items,p_max_rows);'||unistr('\000a')||
'        if p_collection_name is not null then  '||unistr('\000a')||
'          set_collection(upper(p_collection_name),v_data);'||unistr('\000a')||
'        else'||unistr('\000a')||
'        ';

s:=s||'  download_file(v_data,''application/xml'',''report_data.xml'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'    else'||unistr('\000a')||
'      raise_application_error(-20001,''Unknown parameter p_download_type=''||p_return_type);'||unistr('\000a')||
'      dbms_lob.freetemporary(v_data);'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    dbms_lob.freetemporary(v_data);'||unistr('\000a')||
'  end get_report_xml; '||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  function get_report_xml(p_app_i';

s:=s||'d          IN NUMBER,'||unistr('\000a')||
'                          p_page_id         in number,                                '||unistr('\000a')||
'                          p_get_page_items  IN CHAR DEFAULT ''N'', -- Y,N - include page items in XML'||unistr('\000a')||
'                          p_items_list      in varchar2,         -- "," delimetered list of items that for including in XML'||unistr('\000a')||
'                          p_max_rows        IN NUMBER            --';

s:=s||' maximum rows for export                            '||unistr('\000a')||
'                         )'||unistr('\000a')||
'  return xmltype                           '||unistr('\000a')||
'  is'||unistr('\000a')||
'    v_data      clob;    '||unistr('\000a')||
'  begin'||unistr('\000a')||
'    dbms_lob.trim (v_debug,0);'||unistr('\000a')||
'    dbms_lob.createtemporary(v_data,true, DBMS_LOB.CALL);'||unistr('\000a')||
'    log(''p_app_id=''||p_app_id);'||unistr('\000a')||
'    log(''p_page_id=''||p_page_id);'||unistr('\000a')||
'    log(''p_get_page_items=''||p_get_page_items);'||unistr('\000a')||
'    log(''p_items_list=''||p_items_l';

s:=s||'ist);'||unistr('\000a')||
'    log(''p_max_rows=''||p_max_rows);'||unistr('\000a')||
'    '||unistr('\000a')||
'    init_t_report(p_app_id,p_page_id);'||unistr('\000a')||
'    get_final_xml(v_data,p_app_id,p_page_id,p_items_list,p_get_page_items,p_max_rows);    '||unistr('\000a')||
'    '||unistr('\000a')||
'    return xmltype(v_data);    '||unistr('\000a')||
'  end get_report_xml; '||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'  dbms_lob.createtemporary(v_debug,true, DBMS_LOB.CALL);  '||unistr('\000a')||
'END IR_TO_XML;'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE package as_zip'||unistr('\000a')||
'is'||unistr('\000a')||
'/*******************************************';

s:=s||'***'||unistr('\000a')||
'**'||unistr('\000a')||
'** Author: Anton Scheffer'||unistr('\000a')||
'** Date: 25-01-2012'||unistr('\000a')||
'** Website: http://technology.amis.nl/blog'||unistr('\000a')||
'**'||unistr('\000a')||
'** Changelog:'||unistr('\000a')||
'**   Date: 29-04-2012'||unistr('\000a')||
'**    fixed bug for large uncompressed files, thanks Morten Braten'||unistr('\000a')||
'**   Date: 21-03-2012'||unistr('\000a')||
'**     Take CRC32, compressed length and uncompressed length from '||unistr('\000a')||
'**     Central file header instead of Local file header'||unistr('\000a')||
'**   Date: 17-02-2012'||unistr('\000a')||
'**     Added more support for n';

s:=s||'on-ascii filenames'||unistr('\000a')||
'**   Date: 25-01-2012'||unistr('\000a')||
'**     Added MIT-license'||unistr('\000a')||
'**     Some minor improvements'||unistr('\000a')||
'**'||unistr('\000a')||
'******************************************************************************'||unistr('\000a')||
'******************************************************************************'||unistr('\000a')||
'Copyright (C) 2010,2011 by Anton Scheffer'||unistr('\000a')||
''||unistr('\000a')||
'Permission is hereby granted, free of charge, to any person obtaining a copy'||unistr('\000a')||
'of this software and a';

s:=s||'ssociated documentation files (the "Software"), to deal'||unistr('\000a')||
'in the Software without restriction, including without limitation the rights'||unistr('\000a')||
'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell'||unistr('\000a')||
'copies of the Software, and to permit persons to whom the Software is'||unistr('\000a')||
'furnished to do so, subject to the following conditions:'||unistr('\000a')||
''||unistr('\000a')||
'The above copyright notice and this permission notice shall be in';

s:=s||'cluded in'||unistr('\000a')||
'all copies or substantial portions of the Software.'||unistr('\000a')||
''||unistr('\000a')||
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR'||unistr('\000a')||
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,'||unistr('\000a')||
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE'||unistr('\000a')||
'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER'||unistr('\000a')||
'LIABILITY, WHETHER IN AN ACTION OF CONTRAC';

s:=s||'T, TORT OR OTHERWISE, ARISING FROM,'||unistr('\000a')||
'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN'||unistr('\000a')||
'THE SOFTWARE.'||unistr('\000a')||
''||unistr('\000a')||
'******************************************************************************'||unistr('\000a')||
'******************************************** */'||unistr('\000a')||
'  type file_list is table of clob;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function file2blob'||unistr('\000a')||
'    ( p_dir varchar2'||unistr('\000a')||
'    , p_file_name varchar2'||unistr('\000a')||
'    )'||unistr('\000a')||
'  return blob;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function get_fi';

s:=s||'le_list'||unistr('\000a')||
'    ( p_dir varchar2'||unistr('\000a')||
'    , p_zip_file varchar2'||unistr('\000a')||
'    , p_encoding varchar2 := null'||unistr('\000a')||
'    )'||unistr('\000a')||
'  return file_list;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function get_file_list'||unistr('\000a')||
'    ( p_zipped_blob blob'||unistr('\000a')||
'    , p_encoding varchar2 := null'||unistr('\000a')||
'    )'||unistr('\000a')||
'  return file_list;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function get_file'||unistr('\000a')||
'    ( p_dir varchar2'||unistr('\000a')||
'    , p_zip_file varchar2'||unistr('\000a')||
'    , p_file_name varchar2'||unistr('\000a')||
'    , p_encoding varchar2 := null'||unistr('\000a')||
'    )'||unistr('\000a')||
'  return blob;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function get_fi';

s:=s||'le'||unistr('\000a')||
'    ( p_zipped_blob blob'||unistr('\000a')||
'    , p_file_name varchar2'||unistr('\000a')||
'    , p_encoding varchar2 := null'||unistr('\000a')||
'    )'||unistr('\000a')||
'  return blob;'||unistr('\000a')||
'--'||unistr('\000a')||
'  procedure add1file'||unistr('\000a')||
'    ( p_zipped_blob in out blob'||unistr('\000a')||
'    , p_name varchar2'||unistr('\000a')||
'    , p_content blob'||unistr('\000a')||
'    );'||unistr('\000a')||
'--'||unistr('\000a')||
'  procedure finish_zip( p_zipped_blob in out blob );'||unistr('\000a')||
'--'||unistr('\000a')||
'  procedure save_zip'||unistr('\000a')||
'    ( p_zipped_blob blob'||unistr('\000a')||
'    , p_dir varchar2 := ''MY_DIR'''||unistr('\000a')||
'    , p_filename varchar2 := ''my.zip'''||unistr('\000a')||
'    );'||unistr('\000a')||
'-';

s:=s||'-'||unistr('\000a')||
'/*'||unistr('\000a')||
'declare'||unistr('\000a')||
'  g_zipped_blob blob;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  as_zip.add1file( g_zipped_blob, ''test4.txt'', null ); -- a empty file'||unistr('\000a')||
'  as_zip.add1file( g_zipped_blob, ''dir1/test1.txt'', utl_raw.cast_to_raw( q''<A file with some more text, stored in a subfolder which isn''t added>'' ) );'||unistr('\000a')||
'  as_zip.add1file( g_zipped_blob, ''test1234.txt'', utl_raw.cast_to_raw( ''A small file'' ) );'||unistr('\000a')||
'  as_zip.add1file( g_zipped_blob, ''dir2/'', nul';

s:=s||'l ); -- a folder'||unistr('\000a')||
'  as_zip.add1file( g_zipped_blob, ''dir3/'', null ); -- a folder'||unistr('\000a')||
'  as_zip.add1file( g_zipped_blob, ''dir3/test2.txt'', utl_raw.cast_to_raw( ''A small filein a previous created folder'' ) );'||unistr('\000a')||
'  as_zip.finish_zip( g_zipped_blob );'||unistr('\000a')||
'  as_zip.save_zip( g_zipped_blob, ''MY_DIR'', ''my.zip'' );'||unistr('\000a')||
'  dbms_lob.freetemporary( g_zipped_blob );'||unistr('\000a')||
'end;'||unistr('\000a')||
'--'||unistr('\000a')||
'declare'||unistr('\000a')||
'  zip_files as_zip.file_list;'||unistr('\000a')||
'begin'||unistr('\000a')||
'  zip_file';

s:=s||'s  := as_zip.get_file_list( ''MY_DIR'', ''my.zip'' );'||unistr('\000a')||
'  for i in zip_files.first() .. zip_files.last'||unistr('\000a')||
'  loop'||unistr('\000a')||
'    dbms_output.put_line( zip_files( i ) );'||unistr('\000a')||
'    dbms_output.put_line( utl_raw.cast_to_varchar2( as_zip.get_file( ''MY_DIR'', ''my.zip'', zip_files( i ) ) ) );'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'end;'||unistr('\000a')||
'*/'||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE package body as_zip'||unistr('\000a')||
'is'||unistr('\000a')||
'--'||unistr('\000a')||
'  c_LOCAL_FILE_HEADER        constant raw(4) := hextoraw( ''504B0304''';

s:=s||' ); -- Local file header signature'||unistr('\000a')||
'  c_END_OF_CENTRAL_DIRECTORY constant raw(4) := hextoraw( ''504B0506'' ); -- End of central directory signature'||unistr('\000a')||
'--'||unistr('\000a')||
'  function blob2num( p_blob blob, p_len integer, p_pos integer )'||unistr('\000a')||
'  return number'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return utl_raw.cast_to_binary_integer( dbms_lob.substr( p_blob, p_len, p_pos ), utl_raw.little_endian );'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function raw2varchar2( p_raw raw, p_e';

s:=s||'ncoding varchar2 )'||unistr('\000a')||
'  return varchar2'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return coalesce( utl_i18n.raw_to_char( p_raw, p_encoding )'||unistr('\000a')||
'                   , utl_i18n.raw_to_char( p_raw, utl_i18n.map_charset( p_encoding, utl_i18n.GENERIC_CONTEXT, utl_i18n.IANA_TO_ORACLE ) )'||unistr('\000a')||
'                   );'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function little_endian( p_big number, p_bytes pls_integer := 4 )'||unistr('\000a')||
'  return raw'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return utl_raw.subst';

s:=s||'r( utl_raw.cast_from_binary_integer( p_big, utl_raw.little_endian ), 1, p_bytes );'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function file2blob'||unistr('\000a')||
'    ( p_dir varchar2'||unistr('\000a')||
'    , p_file_name varchar2'||unistr('\000a')||
'    )'||unistr('\000a')||
'  return blob'||unistr('\000a')||
'  is'||unistr('\000a')||
'    file_lob bfile;'||unistr('\000a')||
'    file_blob blob;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    file_lob := bfilename( p_dir, p_file_name );'||unistr('\000a')||
'    dbms_lob.open( file_lob, dbms_lob.file_readonly );'||unistr('\000a')||
'    dbms_lob.createtemporary( file_blob, true );'||unistr('\000a')||
'    dbms_lob';

s:=s||'.loadfromfile( file_blob, file_lob, dbms_lob.lobmaxsize );'||unistr('\000a')||
'    dbms_lob.close( file_lob );'||unistr('\000a')||
'    return file_blob;'||unistr('\000a')||
'  exception'||unistr('\000a')||
'    when others then'||unistr('\000a')||
'      if dbms_lob.isopen( file_lob ) = 1'||unistr('\000a')||
'      then'||unistr('\000a')||
'        dbms_lob.close( file_lob );'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      if dbms_lob.istemporary( file_blob ) = 1'||unistr('\000a')||
'      then'||unistr('\000a')||
'        dbms_lob.freetemporary( file_blob );'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      raise;'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function g';

s:=s||'et_file_list'||unistr('\000a')||
'    ( p_zipped_blob blob'||unistr('\000a')||
'    , p_encoding varchar2 := null'||unistr('\000a')||
'    )'||unistr('\000a')||
'  return file_list'||unistr('\000a')||
'  is'||unistr('\000a')||
'    t_ind integer;'||unistr('\000a')||
'    t_hd_ind integer;'||unistr('\000a')||
'    t_rv file_list;'||unistr('\000a')||
'    t_encoding varchar2(32767);'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    t_ind := dbms_lob.getlength( p_zipped_blob ) - 21;'||unistr('\000a')||
'    loop'||unistr('\000a')||
'      exit when t_ind < 1 or dbms_lob.substr( p_zipped_blob, 4, t_ind ) = c_END_OF_CENTRAL_DIRECTORY;'||unistr('\000a')||
'      t_ind := t_ind - 1;'||unistr('\000a')||
'    e';

s:=s||'nd loop;'||unistr('\000a')||
'--'||unistr('\000a')||
'    if t_ind <= 0'||unistr('\000a')||
'    then'||unistr('\000a')||
'      return null;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'    t_hd_ind := blob2num( p_zipped_blob, 4, t_ind + 16 ) + 1;'||unistr('\000a')||
'    t_rv := file_list();'||unistr('\000a')||
'    t_rv.extend( blob2num( p_zipped_blob, 2, t_ind + 10 ) );'||unistr('\000a')||
'    for i in 1 .. blob2num( p_zipped_blob, 2, t_ind + 8 )'||unistr('\000a')||
'    loop'||unistr('\000a')||
'      if p_encoding is null'||unistr('\000a')||
'      then'||unistr('\000a')||
'        if utl_raw.bit_and( dbms_lob.substr( p_zipped_blob, 1, t_hd_ind +';

s:=s||' 9 ), hextoraw( ''08'' ) ) = hextoraw( ''08'' )'||unistr('\000a')||
'        then  '||unistr('\000a')||
'          t_encoding := ''AL32UTF8''; -- utf8'||unistr('\000a')||
'        else'||unistr('\000a')||
'          t_encoding := ''US8PC437''; -- IBM codepage 437'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'      else'||unistr('\000a')||
'        t_encoding := p_encoding;'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      t_rv( i ) := raw2varchar2'||unistr('\000a')||
'                     ( dbms_lob.substr( p_zipped_blob'||unistr('\000a')||
'                                      , blob2num( p_zipped_blob, 2,';

s:=s||' t_hd_ind + 28 )'||unistr('\000a')||
'                                      , t_hd_ind + 46'||unistr('\000a')||
'                                      )'||unistr('\000a')||
'                     , t_encoding'||unistr('\000a')||
'                     );'||unistr('\000a')||
'      t_hd_ind := t_hd_ind + 46'||unistr('\000a')||
'                + blob2num( p_zipped_blob, 2, t_hd_ind + 28 )  -- File name length'||unistr('\000a')||
'                + blob2num( p_zipped_blob, 2, t_hd_ind + 30 )  -- Extra field length'||unistr('\000a')||
'                + blob2num( p_z';

s:=s||'ipped_blob, 2, t_hd_ind + 32 ); -- File comment length'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'--'||unistr('\000a')||
'    return t_rv;'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function get_file_list'||unistr('\000a')||
'    ( p_dir varchar2'||unistr('\000a')||
'    , p_zip_file varchar2'||unistr('\000a')||
'    , p_encoding varchar2 := null'||unistr('\000a')||
'    )'||unistr('\000a')||
'  return file_list'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return get_file_list( file2blob( p_dir, p_zip_file ), p_encoding );'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function get_file'||unistr('\000a')||
'    ( p_zipped_blob blob'||unistr('\000a')||
'    , p_file_name varchar2'||unistr('\000a')||
'   ';

s:=s||' , p_encoding varchar2 := null'||unistr('\000a')||
'    )'||unistr('\000a')||
'  return blob'||unistr('\000a')||
'  is'||unistr('\000a')||
'    t_tmp blob;'||unistr('\000a')||
'    t_ind integer;'||unistr('\000a')||
'    t_hd_ind integer;'||unistr('\000a')||
'    t_fl_ind integer;'||unistr('\000a')||
'    t_encoding varchar2(32767);'||unistr('\000a')||
'    t_len integer;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    t_ind := dbms_lob.getlength( p_zipped_blob ) - 21;'||unistr('\000a')||
'    loop'||unistr('\000a')||
'      exit when t_ind < 1 or dbms_lob.substr( p_zipped_blob, 4, t_ind ) = c_END_OF_CENTRAL_DIRECTORY;'||unistr('\000a')||
'      t_ind := t_ind - 1;'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'';

s:=s||'--'||unistr('\000a')||
'    if t_ind <= 0'||unistr('\000a')||
'    then'||unistr('\000a')||
'      return null;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'    t_hd_ind := blob2num( p_zipped_blob, 4, t_ind + 16 ) + 1;'||unistr('\000a')||
'    for i in 1 .. blob2num( p_zipped_blob, 2, t_ind + 8 )'||unistr('\000a')||
'    loop'||unistr('\000a')||
'      if p_encoding is null'||unistr('\000a')||
'      then'||unistr('\000a')||
'        if utl_raw.bit_and( dbms_lob.substr( p_zipped_blob, 1, t_hd_ind + 9 ), hextoraw( ''08'' ) ) = hextoraw( ''08'' )'||unistr('\000a')||
'        then  '||unistr('\000a')||
'          t_encoding := ''AL32UTF8''; ';

s:=s||'-- utf8'||unistr('\000a')||
'        else'||unistr('\000a')||
'          t_encoding := ''US8PC437''; -- IBM codepage 437'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'      else'||unistr('\000a')||
'        t_encoding := p_encoding;'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      if p_file_name = raw2varchar2'||unistr('\000a')||
'                         ( dbms_lob.substr( p_zipped_blob'||unistr('\000a')||
'                                          , blob2num( p_zipped_blob, 2, t_hd_ind + 28 )'||unistr('\000a')||
'                                          , t_hd_ind + 46'||unistr('\000a')||
'        ';

s:=s||'                                  )'||unistr('\000a')||
'                         , t_encoding'||unistr('\000a')||
'                         )'||unistr('\000a')||
'      then'||unistr('\000a')||
'        t_len := blob2num( p_zipped_blob, 4, t_hd_ind + 24 ); -- uncompressed length '||unistr('\000a')||
'        if t_len = 0'||unistr('\000a')||
'        then'||unistr('\000a')||
'          if substr( p_file_name, -1 ) in ( ''/'', ''\'' )'||unistr('\000a')||
'          then  -- directory/folder'||unistr('\000a')||
'            return null;'||unistr('\000a')||
'          else -- empty file'||unistr('\000a')||
'            return empt';

s:=s||'y_blob();'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'        if dbms_lob.substr( p_zipped_blob, 2, t_hd_ind + 10 ) = hextoraw( ''0800'' ) -- deflate'||unistr('\000a')||
'        then'||unistr('\000a')||
'          t_fl_ind := blob2num( p_zipped_blob, 4, t_hd_ind + 42 );'||unistr('\000a')||
'          t_tmp := hextoraw( ''1F8B0800000000000003'' ); -- gzip header'||unistr('\000a')||
'          dbms_lob.copy( t_tmp'||unistr('\000a')||
'                       , p_zipped_blob'||unistr('\000a')||
'                       ,  blob2num( p_z';

s:=s||'ipped_blob, 4, t_hd_ind + 20 )'||unistr('\000a')||
'                       , 11'||unistr('\000a')||
'                       , t_fl_ind + 31'||unistr('\000a')||
'                       + blob2num( p_zipped_blob, 2, t_fl_ind + 27 ) -- File name length'||unistr('\000a')||
'                       + blob2num( p_zipped_blob, 2, t_fl_ind + 29 ) -- Extra field length'||unistr('\000a')||
'                       );'||unistr('\000a')||
'          dbms_lob.append( t_tmp, utl_raw.concat( dbms_lob.substr( p_zipped_blob, 4, t_hd_ind + ';

s:=s||'16 ) -- CRC32'||unistr('\000a')||
'                                                , little_endian( t_len ) -- uncompressed length'||unistr('\000a')||
'                                                )'||unistr('\000a')||
'                         );'||unistr('\000a')||
'          return utl_compress.lz_uncompress( t_tmp );'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'--'||unistr('\000a')||
'        if dbms_lob.substr( p_zipped_blob, 2, t_hd_ind + 10 ) = hextoraw( ''0000'' ) -- The file is stored (no compression)'||unistr('\000a')||
'        then'||unistr('\000a')||
'    ';

s:=s||'      t_fl_ind := blob2num( p_zipped_blob, 4, t_hd_ind + 42 );'||unistr('\000a')||
'          dbms_lob.createtemporary( t_tmp, true );'||unistr('\000a')||
'          dbms_lob.copy( t_tmp'||unistr('\000a')||
'                       , p_zipped_blob'||unistr('\000a')||
'                       , t_len'||unistr('\000a')||
'                       , 1'||unistr('\000a')||
'                       , t_fl_ind + 31'||unistr('\000a')||
'                       + blob2num( p_zipped_blob, 2, t_fl_ind + 27 ) -- File name length'||unistr('\000a')||
'                       + blob2';

s:=s||'num( p_zipped_blob, 2, t_fl_ind + 29 ) -- Extra field length'||unistr('\000a')||
'                       );'||unistr('\000a')||
'          return t_tmp;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      t_hd_ind := t_hd_ind + 46'||unistr('\000a')||
'                + blob2num( p_zipped_blob, 2, t_hd_ind + 28 )  -- File name length'||unistr('\000a')||
'                + blob2num( p_zipped_blob, 2, t_hd_ind + 30 )  -- Extra field length'||unistr('\000a')||
'                + blob2num( p_zipped_blob, 2, t_hd_ind + 32';

s:=s||' ); -- File comment length'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'--'||unistr('\000a')||
'    return null;'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'  function get_file'||unistr('\000a')||
'    ( p_dir varchar2'||unistr('\000a')||
'    , p_zip_file varchar2'||unistr('\000a')||
'    , p_file_name varchar2'||unistr('\000a')||
'    , p_encoding varchar2 := null'||unistr('\000a')||
'    )'||unistr('\000a')||
'  return blob'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    return get_file( file2blob( p_dir, p_zip_file ), p_file_name, p_encoding );'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'  procedure add1file'||unistr('\000a')||
'    ( p_zipped_blob in out blob'||unistr('\000a')||
'    , p_name varchar2'||unistr('\000a')||
'   ';

wwv_flow_api.append_to_install_script(
  p_id => 2986818195418105 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_script_clob => s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
begin
s:=s||' , p_content blob'||unistr('\000a')||
'    )'||unistr('\000a')||
'  is'||unistr('\000a')||
'    t_now date;'||unistr('\000a')||
'    t_blob blob;'||unistr('\000a')||
'    t_len integer;'||unistr('\000a')||
'    t_clen integer;'||unistr('\000a')||
'    t_crc32 raw(4) := hextoraw( ''00000000'' );'||unistr('\000a')||
'    t_compressed boolean := false;'||unistr('\000a')||
'    t_name raw(32767);'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    t_now := sysdate;'||unistr('\000a')||
'    t_len := nvl( dbms_lob.getlength( p_content ), 0 );'||unistr('\000a')||
'    if t_len > 0'||unistr('\000a')||
'    then '||unistr('\000a')||
'      t_blob := utl_compress.lz_compress( p_content );'||unistr('\000a')||
'      t_clen := dbms_lob.ge';

s:=s||'tlength( t_blob ) - 18;'||unistr('\000a')||
'      t_compressed := t_clen < t_len;'||unistr('\000a')||
'      t_crc32 := dbms_lob.substr( t_blob, 4, t_clen + 11 );       '||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    if not t_compressed'||unistr('\000a')||
'    then '||unistr('\000a')||
'      t_clen := t_len;'||unistr('\000a')||
'      t_blob := p_content;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    if p_zipped_blob is null'||unistr('\000a')||
'    then'||unistr('\000a')||
'      dbms_lob.createtemporary( p_zipped_blob, true );'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    t_name := utl_i18n.string_to_raw( p_name, ''AL32UTF8'' )';

s:=s||';'||unistr('\000a')||
'    dbms_lob.append( p_zipped_blob'||unistr('\000a')||
'                   , utl_raw.concat( c_LOCAL_FILE_HEADER -- Local file header signature'||unistr('\000a')||
'                                   , hextoraw( ''1400'' )  -- version 2.0'||unistr('\000a')||
'                                   , case when t_name = utl_i18n.string_to_raw( p_name, ''US8PC437'' )'||unistr('\000a')||
'                                       then hextoraw( ''0000'' ) -- no General purpose bits'||unistr('\000a')||
'            ';

s:=s||'                           else hextoraw( ''0008'' ) -- set Language encoding flag (EFS)'||unistr('\000a')||
'                                     end '||unistr('\000a')||
'                                   , case when t_compressed'||unistr('\000a')||
'                                        then hextoraw( ''0800'' ) -- deflate'||unistr('\000a')||
'                                        else hextoraw( ''0000'' ) -- stored'||unistr('\000a')||
'                                     end'||unistr('\000a')||
'                     ';

s:=s||'              , little_endian( to_number( to_char( t_now, ''ss'' ) ) / 2'||unistr('\000a')||
'                                                  + to_number( to_char( t_now, ''mi'' ) ) * 32'||unistr('\000a')||
'                                                  + to_number( to_char( t_now, ''hh24'' ) ) * 2048'||unistr('\000a')||
'                                                  , 2'||unistr('\000a')||
'                                                  ) -- File last modification time'||unistr('\000a')||
'  ';

s:=s||'                                 , little_endian( to_number( to_char( t_now, ''dd'' ) )'||unistr('\000a')||
'                                                  + to_number( to_char( t_now, ''mm'' ) ) * 32'||unistr('\000a')||
'                                                  + ( to_number( to_char( t_now, ''yyyy'' ) ) - 1980 ) * 512'||unistr('\000a')||
'                                                  , 2'||unistr('\000a')||
'                                                  ) -- File ';

s:=s||'last modification date'||unistr('\000a')||
'                                   , t_crc32 -- CRC-32'||unistr('\000a')||
'                                   , little_endian( t_clen )                      -- compressed size'||unistr('\000a')||
'                                   , little_endian( t_len )                       -- uncompressed size'||unistr('\000a')||
'                                   , little_endian( utl_raw.length( t_name ), 2 ) -- File name length'||unistr('\000a')||
'                ';

s:=s||'                   , hextoraw( ''0000'' )                           -- Extra field length'||unistr('\000a')||
'                                   , t_name                                       -- File name'||unistr('\000a')||
'                                   )'||unistr('\000a')||
'                   );'||unistr('\000a')||
'    if t_compressed'||unistr('\000a')||
'    then                   '||unistr('\000a')||
'      dbms_lob.copy( p_zipped_blob, t_blob, t_clen, dbms_lob.getlength( p_zipped_blob ) + 1, 11 ); -- compress';

s:=s||'ed content'||unistr('\000a')||
'    elsif t_clen > 0'||unistr('\000a')||
'    then                   '||unistr('\000a')||
'      dbms_lob.copy( p_zipped_blob, t_blob, t_clen, dbms_lob.getlength( p_zipped_blob ) + 1, 1 ); --  content'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    if dbms_lob.istemporary( t_blob ) = 1'||unistr('\000a')||
'    then      '||unistr('\000a')||
'      dbms_lob.freetemporary( t_blob );'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'  procedure finish_zip( p_zipped_blob in out blob )'||unistr('\000a')||
'  is'||unistr('\000a')||
'    t_cnt pls_integer := 0;'||unistr('\000a')||
'    t_offs int';

s:=s||'eger;'||unistr('\000a')||
'    t_offs_dir_header integer;'||unistr('\000a')||
'    t_offs_end_header integer;'||unistr('\000a')||
'    t_comment raw(32767) := utl_raw.cast_to_raw( ''Implementation by Anton Scheffer'' );'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    t_offs_dir_header := dbms_lob.getlength( p_zipped_blob );'||unistr('\000a')||
'    t_offs := 1;'||unistr('\000a')||
'    while dbms_lob.substr( p_zipped_blob, utl_raw.length( c_LOCAL_FILE_HEADER ), t_offs ) = c_LOCAL_FILE_HEADER'||unistr('\000a')||
'    loop'||unistr('\000a')||
'      t_cnt := t_cnt + 1;'||unistr('\000a')||
'      dbms_';

s:=s||'lob.append( p_zipped_blob'||unistr('\000a')||
'                     , utl_raw.concat( hextoraw( ''504B0102'' )      -- Central directory file header signature'||unistr('\000a')||
'                                     , hextoraw( ''1400'' )          -- version 2.0'||unistr('\000a')||
'                                     , dbms_lob.substr( p_zipped_blob, 26, t_offs + 4 )'||unistr('\000a')||
'                                     , hextoraw( ''0000'' )          -- File comment length'||unistr('\000a')||
'    ';

s:=s||'                                 , hextoraw( ''0000'' )          -- Disk number where file starts'||unistr('\000a')||
'                                     , hextoraw( ''0000'' )          -- Internal file attributes => '||unistr('\000a')||
'                                                                   --     0000 binary file'||unistr('\000a')||
'                                                                   --     0100 (ascii)text file'||unistr('\000a')||
'                  ';

s:=s||'                   , case'||unistr('\000a')||
'                                         when dbms_lob.substr( p_zipped_blob'||unistr('\000a')||
'                                                             , 1'||unistr('\000a')||
'                                                             , t_offs + 30 + blob2num( p_zipped_blob, 2, t_offs + 26 ) - 1'||unistr('\000a')||
'                                                             ) in ( hextoraw( ''2F'' ) -- /'||unistr('\000a')||
'                   ';

s:=s||'                                               , hextoraw( ''5C'' ) -- \'||unistr('\000a')||
'                                                                  )'||unistr('\000a')||
'                                         then hextoraw( ''10000000'' ) -- a directory/folder'||unistr('\000a')||
'                                         else hextoraw( ''2000B681'' ) -- a file'||unistr('\000a')||
'                                       end                         -- External file attribu';

s:=s||'tes'||unistr('\000a')||
'                                     , little_endian( t_offs - 1 ) -- Relative offset of local file header'||unistr('\000a')||
'                                     , dbms_lob.substr( p_zipped_blob'||unistr('\000a')||
'                                                      , blob2num( p_zipped_blob, 2, t_offs + 26 )'||unistr('\000a')||
'                                                      , t_offs + 30'||unistr('\000a')||
'                                                     ';

s:=s||' )            -- File name'||unistr('\000a')||
'                                     )'||unistr('\000a')||
'                     );'||unistr('\000a')||
'      t_offs := t_offs + 30 + blob2num( p_zipped_blob, 4, t_offs + 18 )  -- compressed size'||unistr('\000a')||
'                            + blob2num( p_zipped_blob, 2, t_offs + 26 )  -- File name length '||unistr('\000a')||
'                            + blob2num( p_zipped_blob, 2, t_offs + 28 ); -- Extra field length'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    t_offs_end_';

s:=s||'header := dbms_lob.getlength( p_zipped_blob );'||unistr('\000a')||
'    dbms_lob.append( p_zipped_blob'||unistr('\000a')||
'                   , utl_raw.concat( c_END_OF_CENTRAL_DIRECTORY                                -- End of central directory signature'||unistr('\000a')||
'                                   , hextoraw( ''0000'' )                                        -- Number of this disk'||unistr('\000a')||
'                                   , hextoraw( ''0000'' )            ';

s:=s||'                            -- Disk where central directory starts'||unistr('\000a')||
'                                   , little_endian( t_cnt, 2 )                                 -- Number of central directory records on this disk'||unistr('\000a')||
'                                   , little_endian( t_cnt, 2 )                                 -- Total number of central directory records'||unistr('\000a')||
'                                   , little_en';

s:=s||'dian( t_offs_end_header - t_offs_dir_header )    -- Size of central directory'||unistr('\000a')||
'                                   , little_endian( t_offs_dir_header )                        -- Offset of start of central directory, relative to start of archive'||unistr('\000a')||
'                                   , little_endian( nvl( utl_raw.length( t_comment ), 0 ), 2 ) -- ZIP file comment length'||unistr('\000a')||
'                                   ';

s:=s||', t_comment'||unistr('\000a')||
'                                   )'||unistr('\000a')||
'                   );'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'  procedure save_zip'||unistr('\000a')||
'    ( p_zipped_blob blob'||unistr('\000a')||
'    , p_dir varchar2 := ''MY_DIR'''||unistr('\000a')||
'    , p_filename varchar2 := ''my.zip'''||unistr('\000a')||
'    )'||unistr('\000a')||
'  is'||unistr('\000a')||
'    t_fh utl_file.file_type;'||unistr('\000a')||
'    t_len pls_integer := 32767;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    t_fh := utl_file.fopen( p_dir, p_filename, ''wb'' );'||unistr('\000a')||
'    for i in 0 .. trunc( ( dbms_lob.getlength( p_zipped_blob ) - 1 ';

s:=s||') / t_len )'||unistr('\000a')||
'    loop'||unistr('\000a')||
'      utl_file.put_raw( t_fh, dbms_lob.substr( p_zipped_blob, t_len, i * t_len + 1 ) );'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    utl_file.fclose( t_fh );'||unistr('\000a')||
'  end;'||unistr('\000a')||
'--'||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE package xml_to_xslx'||unistr('\000a')||
'-- ver 1.0.'||unistr('\000a')||
'IS'||unistr('\000a')||
'  procedure download_file(p_app_id in number,'||unistr('\000a')||
'                    p_page_id      in number,'||unistr('\000a')||
'                    p_max_rows     in number,'||unistr('\000a')||
'                    p_file_name    in va';

s:=s||'rchar2 default ''Excel''); '||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE PACKAGE body XML_TO_XSLX'||unistr('\000a')||
'is'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  t_sheet_rels clob default ''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'||unistr('\000a')||
'  <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'||unistr('\000a')||
'    <Relationship Id="rId3" Type="http://schemas.openxmlformats.or';

s:=s||'g/officeDocument/2006/relationships/styles" Target="styles.xml"/>'||unistr('\000a')||
'    <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme" Target="theme/theme1.xml"/>'||unistr('\000a')||
'    <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/>'||unistr('\000a')||
'    <Relationship Id="rId4" Type="http://schemas.op';

s:=s||'enxmlformats.org/officeDocument/2006/relationships/sharedStrings" Target="sharedStrings.xml"/>'||unistr('\000a')||
'  </Relationships>'';'||unistr('\000a')||
'  '||unistr('\000a')||
'  t_workbook clob default ''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'||unistr('\000a')||
'  <workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">'||unistr('\000a')||
'    <fileVersion appName="xl" lastEdited=';

s:=s||'"4" lowestEdited="4" rupBuild="4506"/>'||unistr('\000a')||
'    <workbookPr filterPrivacy="1" defaultThemeVersion="124226"/>'||unistr('\000a')||
'    <bookViews>'||unistr('\000a')||
'      <workbookView xWindow="120" yWindow="120" windowWidth="24780" windowHeight="12150"/>'||unistr('\000a')||
'    </bookViews>'||unistr('\000a')||
'    <sheets>'||unistr('\000a')||
'      <sheet name="Sheet1" sheetId="1" r:id="rId1"/>'||unistr('\000a')||
'    </sheets>'||unistr('\000a')||
'    <definedNames><definedName name="_xlnm._FilterDatabase" localSheetId="0" hidden="1">Shee';

s:=s||'t1!$A$1:$H$1</definedName></definedNames>'||unistr('\000a')||
'    <calcPr calcId="125725"/>'||unistr('\000a')||
'    <fileRecoveryPr repairLoad="1"/>'||unistr('\000a')||
'  </workbook>'';'||unistr('\000a')||
'  '||unistr('\000a')||
'  cursor cur_row(p_xml xmltype) is '||unistr('\000a')||
'  SELECT rownum coll_num,'||unistr('\000a')||
'                                 extractvalue(COLUMN_VALUE, ''CELL/@background-color'') AS background_color,'||unistr('\000a')||
'                                 extractvalue(COLUMN_VALUE, ''CELL/@color'') AS font_color, '||unistr('\000a')||
'            ';

s:=s||'                     extractvalue(COLUMN_VALUE, ''CELL/@data-type'') AS data_type,'||unistr('\000a')||
'                                 extractvalue(COLUMN_VALUE, ''CELL/@value'') AS cell_value,'||unistr('\000a')||
'                                 extractvalue(column_value, ''CELL'') as cell_text'||unistr('\000a')||
'                          from table (select xmlsequence(extract(p_xml,''DOCUMENT/DATA/ROWSET/ROW/CELL'')) from dual);'||unistr('\000a')||
'  '||unistr('\000a')||
'  --------------------------';

s:=s||'----------------------------------------------------'||unistr('\000a')||
'  procedure add(p_clob in out nocopy clob,p_str varchar2)'||unistr('\000a')||
'  is'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    DBMS_LOB.WRITEAPPEND(p_clob,length(p_str),p_str);'||unistr('\000a')||
'  end;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_cell_name(p_coll IN binary_integer,'||unistr('\000a')||
'                         p_row  IN binary_integer)'||unistr('\000a')||
'  RETURN varchar2'||unistr('\000a')||
'  IS   '||unistr('\000a')||
'  BEGI';

s:=s||'N'||unistr('\000a')||
'   if p_coll > 26 then'||unistr('\000a')||
'     return chr(64 + trunc(p_coll/26))||chr(64 + p_coll - trunc(p_coll/26)*26 +1)||p_row;'||unistr('\000a')||
'   ELSE'||unistr('\000a')||
'     return chr( 64 + p_coll)||p_row;'||unistr('\000a')||
'   end if;  '||unistr('\000a')||
'  end get_cell_name;'||unistr('\000a')||
' '||unistr('\000a')||
'  ------------------------------------------------------------------------------  '||unistr('\000a')||
'  procedure add1file'||unistr('\000a')||
'    ( p_zipped_blob in out blob'||unistr('\000a')||
'    , p_name in varchar2'||unistr('\000a')||
'    , p_content in clob'||unistr('\000a')||
'    )'||unistr('\000a')||
'  is'||unistr('\000a')||
'   v_de';

s:=s||'sc_offset pls_integer := 1;'||unistr('\000a')||
'   v_src_offset  PLS_INTEGER := 1;'||unistr('\000a')||
'   v_lang        pls_integer := 0;'||unistr('\000a')||
'   v_warning     pls_integer := 0;'||unistr('\000a')||
'   v_blob        BLOB;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    dbms_lob.createtemporary(v_blob,true);    '||unistr('\000a')||
'    dbms_lob.converttoblob(v_blob,p_content, dbms_lob.getlength(p_content), v_desc_offset, v_src_offset, dbms_lob.default_csid, v_lang, v_warning);'||unistr('\000a')||
'    as_zip.add1file( p_zipped_blob, p_nam';

s:=s||'e, v_blob);'||unistr('\000a')||
'    dbms_lob.freetemporary(v_blob);'||unistr('\000a')||
'  end add1file;  '||unistr('\000a')||
''||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  procedure get_excel(p_xml in xmltype,v_clob in out nocopy clob,v_strings_clob in out nocopy clob)'||unistr('\000a')||
'  IS'||unistr('\000a')||
'    v_strings          apex_application_global.vc_arr2;'||unistr('\000a')||
'    v_rownum           binary_integer default 1;'||unistr('\000a')||
'    v_colls_count      binary_integer defa';

s:=s||'ult 0;'||unistr('\000a')||
'    v_agg_clob         clob;'||unistr('\000a')||
'    v_agg_strings_cnt  binary_integer default 1; '||unistr('\000a')||
'    string_height      constant number default 14.4; '||unistr('\000a')||
'    aggregate_style_id constant number default 5;'||unistr('\000a')||
'    HEADER_STYLE_ID    constant number default 6;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    procedure print_char_cell(p_coll in binary_integer, p_row in binary_integer, p_string in varchar2,p_clob in out nocopy CLOB,p_style_id in number defa';

s:=s||'ult null)'||unistr('\000a')||
'    is'||unistr('\000a')||
'     v_style varchar2(20);'||unistr('\000a')||
'    begin'||unistr('\000a')||
'      if p_style_id is not null then'||unistr('\000a')||
'       v_style := '' s="''||p_style_id||''" '';'||unistr('\000a')||
'      end if;'||unistr('\000a')||
'      '||unistr('\000a')||
'      add(p_clob,''<c r="''||get_cell_name(p_coll,p_row)||''" t="s" ''||v_style||''>''||chr(10)'||unistr('\000a')||
'                         ||''<v>'' || to_char(v_strings.count)|| ''</v>''||chr(10)                 '||unistr('\000a')||
'                         ||''</c>''||chr(10));'||unistr('\000a')||
'      v_strin';

s:=s||'gs(v_strings.count + 1) := p_string;'||unistr('\000a')||
'    end print_char_cell;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    procedure print_number_cell(p_coll in binary_integer, p_row in binary_integer, p_value in varchar2,p_clob in out nocopy clob,p_style_id in number default null)'||unistr('\000a')||
'    is'||unistr('\000a')||
'      v_style varchar2(20);'||unistr('\000a')||
'    begin'||unistr('\000a')||
'      if p_style_id is not null then'||unistr('\000a')||
'       v_style := '' s="''||p_style_id||''" '';'||unistr('\000a')||
'      end if;'||unistr('\000a')||
''||unistr('\000a')||
'      add(p_clob,''<c r="''|';

s:=s||'|get_cell_name(p_coll,p_row)||''" ''||v_style||''>''||chr(10)'||unistr('\000a')||
'                         ||''<v>''||p_value|| ''</v>''||chr(10)'||unistr('\000a')||
'                         ||''</c>''||chr(10));'||unistr('\000a')||
'    '||unistr('\000a')||
'    end print_number_cell;'||unistr('\000a')||
'    --'||unistr('\000a')||
'  begin'||unistr('\000a')||
'     pragma inline(add,''YES'');     '||unistr('\000a')||
'     pragma inline(get_cell_name,''YES'');'||unistr('\000a')||
'     '||unistr('\000a')||
'     dbms_lob.createtemporary(v_agg_clob,true);'||unistr('\000a')||
'     '||unistr('\000a')||
'     add(v_clob,''<?xml version="1.0" encoding="UTF-8"';

s:=s||' standalone="yes"?>''||chr(10));'||unistr('\000a')||
'     add(v_clob,''<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">'||unistr('\000a')||
'        <dimension ref="A1"/>'||unistr('\000a')||
'        <sheetViews>'||unistr('\000a')||
'          <sheetView tabSelected="1" workbookViewId="0">'||unistr('\000a')||
'            <pane ySplit="1" topLeftCell="A2" activePane="bottomLeft" state="frozen"/>'||unistr('\000a')||
'';

s:=s||'            <selection pane="bottomLeft" activeCell="A2" sqref="A2"/>'||unistr('\000a')||
'           </sheetView>'||unistr('\000a')||
'          </sheetViews>'||unistr('\000a')||
'        <sheetFormatPr baseColWidth="10" defaultColWidth="10" defaultRowHeight="15"/>''||chr(10));'||unistr('\000a')||
'     add(v_clob,''<sheetData>''||chr(10));'||unistr('\000a')||
'     '||unistr('\000a')||
'     --header'||unistr('\000a')||
'     add(v_clob,''<row>''||chr(10));     '||unistr('\000a')||
'     for i in (select  extractvalue(column_value, ''CELL'') as column_header'||unistr('\000a')||
'        ';

s:=s||'       from table (select xmlsequence(extract(p_xml,''DOCUMENT/DATA/HEADER/CELL'')) from dual))'||unistr('\000a')||
'     loop          '||unistr('\000a')||
'       v_colls_count := v_colls_count + 1;'||unistr('\000a')||
'       print_char_cell(p_coll => v_colls_count, p_row => v_rownum, p_string => i.column_header,p_clob => v_clob);'||unistr('\000a')||
'     end loop; '||unistr('\000a')||
'     v_rownum := v_rownum + 1;'||unistr('\000a')||
'     add(v_clob,''</row>''||chr(10));     '||unistr('\000a')||
'     '||unistr('\000a')||
'     <<rowset>>     '||unistr('\000a')||
'     for rowse';

s:=s||'t_xml in (select column_value as rowset,'||unistr('\000a')||
'                               extractvalue(COLUMN_VALUE, ''ROWSET/BREAK_HEADER'') AS break_header'||unistr('\000a')||
'                        from table (select xmlsequence(extract(p_xml,''DOCUMENT/DATA/ROWSET'')) from dual)'||unistr('\000a')||
'                       ) '||unistr('\000a')||
'     loop'||unistr('\000a')||
'       --header'||unistr('\000a')||
'       if rowset_xml.break_header is not null then'||unistr('\000a')||
'         add(v_clob,''<row>''||chr(10));'||unistr('\000a')||
'         print_';

s:=s||'char_cell(p_coll => 1,p_row => v_rownum,p_string => rowset_xml.break_header,p_clob => v_clob,p_style_id => header_style_id);         '||unistr('\000a')||
'         --for u in 2..v_colls_count loop'||unistr('\000a')||
'         --  print_char_cell(p_coll => 1,p_row => v_rownum,p_string => '''',p_clob => v_clob,p_style_id => HEADER_STYLE_ID);'||unistr('\000a')||
'         --end loop;'||unistr('\000a')||
'         v_rownum := v_rownum + 1;'||unistr('\000a')||
'         add(v_clob,''</row>''||chr(10));'||unistr('\000a')||
'     ';

s:=s||'  end if;'||unistr('\000a')||
'       '||unistr('\000a')||
'       <<cells>>'||unistr('\000a')||
'       for row_xml in (select column_value as row_ from table (select xmlsequence(extract(rowset_xml.rowset,''ROWSET/ROW'')) from dual)) loop'||unistr('\000a')||
'         add(v_clob,''<row>''||chr(10));'||unistr('\000a')||
'         FOR cell_xml IN (SELECT rownum coll_num,'||unistr('\000a')||
'                                 extractvalue(COLUMN_VALUE, ''CELL/@background-color'') AS background_color,'||unistr('\000a')||
'                             ';

s:=s||'    extractvalue(COLUMN_VALUE, ''CELL/@color'') AS font_color, '||unistr('\000a')||
'                                 extractvalue(COLUMN_VALUE, ''CELL/@data-type'') AS data_type,'||unistr('\000a')||
'                                 extractvalue(COLUMN_VALUE, ''CELL/@value'') AS cell_value,'||unistr('\000a')||
'                                 extractvalue(COLUMN_VALUE, ''CELL'') AS cell_text'||unistr('\000a')||
'                          from table (select xmlsequence(extract(row_xml.r';

s:=s||'ow_,''ROW/CELL'')) from dual))'||unistr('\000a')||
'          loop'||unistr('\000a')||
'            begin            '||unistr('\000a')||
'              if cell_xml.data_type in (''NUMBER'') then'||unistr('\000a')||
'                  print_number_cell(p_coll => cell_xml.coll_num, p_row => v_rownum, p_value => cell_xml.cell_value,p_clob => v_clob);'||unistr('\000a')||
'              elsif cell_xml.data_type in (''DATE'') then'||unistr('\000a')||
'                 add(v_clob,''<c r="''||get_cell_name(cell_xml.coll_num,v_rownum)||';

s:=s||'''"  s="4">''||chr(10)'||unistr('\000a')||
'                                    ||''<v>''||cell_xml.cell_value|| ''</v>''||chr(10)'||unistr('\000a')||
'                                    ||''</c>''||chr(10));'||unistr('\000a')||
'              else --STRING'||unistr('\000a')||
'                  print_char_cell(p_coll => cell_xml.coll_num,p_row => v_rownum,p_string => cell_xml.cell_text,p_clob => v_clob);'||unistr('\000a')||
'              END IF;              '||unistr('\000a')||
'            exception'||unistr('\000a')||
'              WHEN no_da';

s:=s||'ta_found THEN'||unistr('\000a')||
'                null;'||unistr('\000a')||
'            end;'||unistr('\000a')||
'         end loop;         '||unistr('\000a')||
'         add(v_clob,''</row>''||chr(10));         '||unistr('\000a')||
'         v_rownum := v_rownum + 1;'||unistr('\000a')||
'       end loop cells;'||unistr('\000a')||
'       '||unistr('\000a')||
'       DBMS_LOB.TRIM(v_agg_clob,0);'||unistr('\000a')||
'       v_agg_strings_cnt := 1;       '||unistr('\000a')||
'       <<aggregates>>       '||unistr('\000a')||
'       for row_xml in (select column_value as row_ from table (select xmlsequence(extract(rowset_xml.';

s:=s||'rowset,''ROWSET/AGGREGATE'')) from dual)) loop'||unistr('\000a')||
''||unistr('\000a')||
'         for cell_xml_agg in (select rownum coll_num,'||unistr('\000a')||
'                                 extractvalue(COLUMN_VALUE, ''CELL'') AS cell_text,'||unistr('\000a')||
'                                 extractvalue(COLUMN_VALUE, ''CELL/@value'') AS cell_value'||unistr('\000a')||
'                          from table (select xmlsequence(extract(row_xml.row_,''AGGREGATE/CELL'')) from dual))'||unistr('\000a')||
'         loop'||unistr('\000a')||
'      ';

s:=s||'     v_agg_strings_cnt := greatest(length(regexp_replace(''[^:]'','''')) + 1,v_agg_strings_cnt);'||unistr('\000a')||
'           if instr(cell_xml_agg.cell_text,'':'') > 0 then'||unistr('\000a')||
'             print_char_cell(p_coll => cell_xml_agg.coll_num,'||unistr('\000a')||
'                             p_row => v_rownum,'||unistr('\000a')||
'                             p_string => rtrim(cell_xml_agg.cell_text,chr(10)),'||unistr('\000a')||
'                             p_clob => v_agg_clob,'||unistr('\000a')||
'         ';

s:=s||'                    p_style_id => aggregate_style_id);'||unistr('\000a')||
'           else'||unistr('\000a')||
'             print_number_cell(p_coll => cell_xml_agg.coll_num, '||unistr('\000a')||
'                               p_row => v_rownum, '||unistr('\000a')||
'                               p_value => cell_xml_agg.cell_value,'||unistr('\000a')||
'                               p_clob => v_agg_clob,'||unistr('\000a')||
'                               p_style_id => aggregate_style_id);'||unistr('\000a')||
'           end if;'||unistr('\000a')||
'        ';

s:=s||' end loop;'||unistr('\000a')||
'         add(v_clob,''<row ht="''||v_agg_strings_cnt*string_height||''">''||chr(10));'||unistr('\000a')||
'         --add(v_clob,''<row ht="40">''||chr(10));'||unistr('\000a')||
'         dbms_lob.copy( dest_lob => v_clob,'||unistr('\000a')||
'                        src_lob => v_agg_clob,'||unistr('\000a')||
'                        amount => dbms_lob.getlength(v_agg_clob),'||unistr('\000a')||
'                        dest_offset => dbms_lob.getlength(v_clob),'||unistr('\000a')||
'                        src_offset';

s:=s||' => 1);'||unistr('\000a')||
'         add(v_clob,''</row>''||chr(10));'||unistr('\000a')||
'         v_rownum := v_rownum + 1;'||unistr('\000a')||
'       end loop aggregates;   '||unistr('\000a')||
'     end loop rowset;     '||unistr('\000a')||
'     '||unistr('\000a')||
'     add(v_clob,''</sheetData>''||chr(10));'||unistr('\000a')||
'     --if p_autofilter then'||unistr('\000a')||
'     add(v_clob,''<autoFilter ref="A1:'' || get_cell_name(v_colls_count,v_rownum) || ''"/>'');'||unistr('\000a')||
'     --end if;'||unistr('\000a')||
'     add(v_clob,''<pageMargins left="0.7" right="0.7" top="0.75" bottom="0.75"';

s:=s||' header="0.3" footer="0.3"/></worksheet>''||chr(10));'||unistr('\000a')||
'     '||unistr('\000a')||
'     add(v_strings_clob,''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>''||chr(10));'||unistr('\000a')||
'     add(v_strings_clob,''<sst xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" count="'' || v_strings.count() || ''" uniqueCount="'' || v_strings.count() || ''">''||chr(10));'||unistr('\000a')||
'        '||unistr('\000a')||
'     for i in 1 .. v_strings.count() loop'||unistr('\000a')||
'        ad';

s:=s||'d(v_strings_clob,''<si><t>''||dbms_xmlgen.convert( substr( v_strings( i ), 1, 32000 ) ) || ''</t></si>''||chr(10));'||unistr('\000a')||
'     end loop; '||unistr('\000a')||
'     add(v_strings_clob,''</sst>''||chr(10));'||unistr('\000a')||
'     '||unistr('\000a')||
'     dbms_lob.freetemporary(v_agg_clob);'||unistr('\000a')||
'  end get_excel;'||unistr('\000a')||
'  ------------------------------------------------------------------------------'||unistr('\000a')||
'  procedure download_file(p_app_id      in number,'||unistr('\000a')||
'                          p_page';

s:=s||'_id     in number,'||unistr('\000a')||
'                          p_max_rows    in number,'||unistr('\000a')||
'                          p_file_name   in varchar2 default ''Excel'')'||unistr('\000a')||
'  is'||unistr('\000a')||
'    t_template blob;'||unistr('\000a')||
'    t_excel    blob;'||unistr('\000a')||
'    v_cells    clob;'||unistr('\000a')||
'    v_strings  clob;'||unistr('\000a')||
'    v_xml_data xmltype;'||unistr('\000a')||
'    zip_files  as_zip.file_list;'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    pragma inline(get_excel,''YES'');     '||unistr('\000a')||
'    dbms_lob.createtemporary(t_excel,true);    '||unistr('\000a')||
'    dbms_lob.creat';

s:=s||'etemporary(v_cells,true);'||unistr('\000a')||
'    dbms_lob.createtemporary(v_strings,true);'||unistr('\000a')||
'    '||unistr('\000a')||
'    '||unistr('\000a')||
'    select file_content'||unistr('\000a')||
'    into t_template'||unistr('\000a')||
'    from apex_appl_plugin_files '||unistr('\000a')||
'    where file_name = ''ExcelTemplate.zip'''||unistr('\000a')||
'      and application_id = p_app_id;'||unistr('\000a')||
'    '||unistr('\000a')||
'    zip_files  := as_zip.get_file_list( t_template );'||unistr('\000a')||
'    for i in zip_files.first() .. zip_files.last loop'||unistr('\000a')||
'      as_zip.add1file( t_excel, zip_files( i ), a';

s:=s||'s_zip.get_file( t_template, zip_files( i ) ) );'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'    '||unistr('\000a')||
'    v_xml_data := IR_TO_XML.get_report_xml(p_app_id => p_app_id,'||unistr('\000a')||
'                          p_page_id => p_page_id,                                '||unistr('\000a')||
'                          p_get_page_items => ''N'','||unistr('\000a')||
'                          p_items_list  => null,'||unistr('\000a')||
'                          p_max_rows  => p_max_rows                            '||unistr('\000a')||
'      ';

s:=s||'                   );'||unistr('\000a')||
'    '||unistr('\000a')||
'    '||unistr('\000a')||
'    get_excel(v_xml_data,v_cells,v_strings);'||unistr('\000a')||
'    add1file( t_excel, ''xl/worksheets/Sheet1.xml'', v_cells);'||unistr('\000a')||
'    add1file( t_excel, ''xl/sharedStrings.xml'',v_strings);'||unistr('\000a')||
'    add1file( t_excel, ''xl/_rels/workbook.xml.rels'',t_sheet_rels);    '||unistr('\000a')||
'    add1file( t_excel, ''xl/workbook.xml'',t_workbook);    '||unistr('\000a')||
'    '||unistr('\000a')||
'    as_zip.finish_zip( t_excel );'||unistr('\000a')||
'      '||unistr('\000a')||
'    htp.flush;'||unistr('\000a')||
'    owa_util.m';

s:=s||'ime_header( wwv_flow_utilities.get_excel_mime_type, false );'||unistr('\000a')||
'    htp.print( ''Content-Length: '' || dbms_lob.getlength( t_excel ) );'||unistr('\000a')||
'    htp.print( ''Content-disposition: attachment; filename=''||p_file_name||''.xlsx;'' );'||unistr('\000a')||
'    owa_util.http_header_close;'||unistr('\000a')||
'    wpg_docload.download_file( t_excel );'||unistr('\000a')||
'    dbms_lob.freetemporary(t_excel);'||unistr('\000a')||
'    dbms_lob.freetemporary(v_cells);'||unistr('\000a')||
'    dbms_lob.freetemporary(v_string';

s:=s||'s);    '||unistr('\000a')||
'  end download_file;'||unistr('\000a')||
'  '||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.append_to_install_script(
  p_id => 2986818195418105 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_script_clob => s);
end;
 
 
end;
/

--application/deployment/checks
prompt  ...application deployment checks
--
 
begin
 
null;
 
end;
/

--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

prompt  ...post import process
 
begin
 
wwv_flow_api.post_import_process(p_flow_id => wwv_flow.g_flow_id);
null;
 
end;
/

--application/end_environment
commit;
commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
