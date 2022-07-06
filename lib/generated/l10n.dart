// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Quản lý dự án`
  String get lbl_project_management {
    return Intl.message(
      'Quản lý dự án',
      name: 'lbl_project_management',
      desc: '',
      args: [],
    );
  }

  /// `Quản lý bộ phân tập trung`
  String get lbl_centralized_department_management {
    return Intl.message(
      'Quản lý bộ phân tập trung',
      name: 'lbl_centralized_department_management',
      desc: '',
      args: [],
    );
  }

  /// `Quản lý nhân sự cấp tập trung`
  String get lbl_centralized_human_resource_management {
    return Intl.message(
      'Quản lý nhân sự cấp tập trung',
      name: 'lbl_centralized_human_resource_management',
      desc: '',
      args: [],
    );
  }

  /// `Cấu hình`
  String get lbl_configuration {
    return Intl.message(
      'Cấu hình',
      name: 'lbl_configuration',
      desc: '',
      args: [],
    );
  }

  /// `Tuỳ chọn`
  String get lbl_option {
    return Intl.message(
      'Tuỳ chọn',
      name: 'lbl_option',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin nhân viên`
  String get lbl_title_staff_info {
    return Intl.message(
      'Thông tin nhân viên',
      name: 'lbl_title_staff_info',
      desc: '',
      args: [],
    );
  }

  /// `Mã Nhân Viên`
  String get lbl_staff_code {
    return Intl.message(
      'Mã Nhân Viên',
      name: 'lbl_staff_code',
      desc: '',
      args: [],
    );
  }

  /// `Tên đăng nhập`
  String get lbl_user_name {
    return Intl.message(
      'Tên đăng nhập',
      name: 'lbl_user_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get lbl_email {
    return Intl.message(
      'Email',
      name: 'lbl_email',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get lbl_phone_number {
    return Intl.message(
      'Số điện thoại',
      name: 'lbl_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Ngày sinh`
  String get lbl_day_of_birth {
    return Intl.message(
      'Ngày sinh',
      name: 'lbl_day_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Giới tính`
  String get lbl_gender {
    return Intl.message(
      'Giới tính',
      name: 'lbl_gender',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ`
  String get lbl_address {
    return Intl.message(
      'Địa chỉ',
      name: 'lbl_address',
      desc: '',
      args: [],
    );
  }

  /// `CMND/CCCD/Hộ chiếu`
  String get lbl_id_card {
    return Intl.message(
      'CMND/CCCD/Hộ chiếu',
      name: 'lbl_id_card',
      desc: '',
      args: [],
    );
  }

  /// `Ngày cấp`
  String get lbl_date_range {
    return Intl.message(
      'Ngày cấp',
      name: 'lbl_date_range',
      desc: '',
      args: [],
    );
  }

  /// `Nơi cấp`
  String get lbl_place_for_identity_card {
    return Intl.message(
      'Nơi cấp',
      name: 'lbl_place_for_identity_card',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú`
  String get lbl_note {
    return Intl.message(
      'Ghi chú',
      name: 'lbl_note',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin công việc`
  String get lbl_work_info {
    return Intl.message(
      'Thông tin công việc',
      name: 'lbl_work_info',
      desc: '',
      args: [],
    );
  }

  /// `Bộ phận`
  String get lbl_department {
    return Intl.message(
      'Bộ phận',
      name: 'lbl_department',
      desc: '',
      args: [],
    );
  }

  /// `Quyền hạn`
  String get lbl_authority {
    return Intl.message(
      'Quyền hạn',
      name: 'lbl_authority',
      desc: '',
      args: [],
    );
  }

  /// `Phụ trách dự án và phân quyền`
  String get lbl_project_in_charge_and_decentralization {
    return Intl.message(
      'Phụ trách dự án và phân quyền',
      name: 'lbl_project_in_charge_and_decentralization',
      desc: '',
      args: [],
    );
  }

  /// `Dự án `
  String get lbl_project {
    return Intl.message(
      'Dự án ',
      name: 'lbl_project',
      desc: '',
      args: [],
    );
  }

  /// `Phân quyền`
  String get lbl_decentralization {
    return Intl.message(
      'Phân quyền',
      name: 'lbl_decentralization',
      desc: '',
      args: [],
    );
  }

  /// `Các module, tính năng được phép truy cập`
  String get lbl_accessed_features {
    return Intl.message(
      'Các module, tính năng được phép truy cập',
      name: 'lbl_accessed_features',
      desc: '',
      args: [],
    );
  }

  /// `Tìm kiếm theo hành động`
  String get lbl_search_action {
    return Intl.message(
      'Tìm kiếm theo hành động',
      name: 'lbl_search_action',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian`
  String get lbl_time {
    return Intl.message(
      'Thời gian',
      name: 'lbl_time',
      desc: '',
      args: [],
    );
  }

  /// `Tất cả`
  String get lbl_all {
    return Intl.message(
      'Tất cả',
      name: 'lbl_all',
      desc: '',
      args: [],
    );
  }

  /// `Lịch Sử Hoạt Động`
  String get lbl_history_activity {
    return Intl.message(
      'Lịch Sử Hoạt Động',
      name: 'lbl_history_activity',
      desc: '',
      args: [],
    );
  }

  /// `Xoá thông tin bất động sản`
  String get lbl_delete_BDS_action {
    return Intl.message(
      'Xoá thông tin bất động sản',
      name: 'lbl_delete_BDS_action',
      desc: '',
      args: [],
    );
  }

  /// `Sửa thông tin bất động sản`
  String get lbl_edit_BDS_action {
    return Intl.message(
      'Sửa thông tin bất động sản',
      name: 'lbl_edit_BDS_action',
      desc: '',
      args: [],
    );
  }

  /// `Thêm thông tin bất động sản`
  String get lbl_add_BDS_action {
    return Intl.message(
      'Thêm thông tin bất động sản',
      name: 'lbl_add_BDS_action',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get lbl_login_action {
    return Intl.message(
      'Đăng nhập',
      name: 'lbl_login_action',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vn'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
