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

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Pig Farm`
  String get appName {
    return Intl.message(
      'Pig Farm',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Đang tải...`
  String get initializing {
    return Intl.message(
      'Đang tải...',
      name: 'initializing',
      desc: '',
      args: [],
    );
  }

  /// `Thử lại`
  String get retry {
    return Intl.message(
      'Thử lại',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Đang theo dõi`
  String get ranging {
    return Intl.message(
      'Đang theo dõi',
      name: 'ranging',
      desc: '',
      args: [],
    );
  }

  /// `Dừng theo dõi`
  String get notRanging {
    return Intl.message(
      'Dừng theo dõi',
      name: 'notRanging',
      desc: '',
      args: [],
    );
  }

  /// `bắt đầu theo dõi`
  String get startObserve {
    return Intl.message(
      'bắt đầu theo dõi',
      name: 'startObserve',
      desc: '',
      args: [],
    );
  }

  /// `dừng`
  String get stopObserve {
    return Intl.message(
      'dừng',
      name: 'stopObserve',
      desc: '',
      args: [],
    );
  }

  /// `Mã số: {id}`
  String id(Object id) {
    return Intl.message(
      'Mã số: $id',
      name: 'id',
      desc: '',
      args: [id],
    );
  }

  /// `Nhiệt độ: {t}°C`
  String temperature(Object t) {
    return Intl.message(
      'Nhiệt độ: $t°C',
      name: 'temperature',
      desc: '',
      args: [t],
    );
  }

  /// `Cài đặt`
  String get setting {
    return Intl.message(
      'Cài đặt',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt cấu hình đo`
  String get warningLevelSetting {
    return Intl.message(
      'Cài đặt cấu hình đo',
      name: 'warningLevelSetting',
      desc: '',
      args: [],
    );
  }

  /// `Điều kiện nhập:  mức cảnh báo nhiệt độ thấp <  mức cảnh báo nhiệt độ cao `
  String get guideWarningInput {
    return Intl.message(
      'Điều kiện nhập:  mức cảnh báo nhiệt độ thấp <  mức cảnh báo nhiệt độ cao ',
      name: 'guideWarningInput',
      desc: '',
      args: [],
    );
  }

  /// `Cảnh báo khi thân nhiệt dưới:`
  String get dangerLowAt {
    return Intl.message(
      'Cảnh báo khi thân nhiệt dưới:',
      name: 'dangerLowAt',
      desc: '',
      args: [],
    );
  }

  /// `Cảnh cáo khi thân nhiệt trên:`
  String get dangerHighAt {
    return Intl.message(
      'Cảnh cáo khi thân nhiệt trên:',
      name: 'dangerHighAt',
      desc: '',
      args: [],
    );
  }

  /// `Hiển thị dạng lưới`
  String get showAsGrid {
    return Intl.message(
      'Hiển thị dạng lưới',
      name: 'showAsGrid',
      desc: '',
      args: [],
    );
  }

  /// `Hiển thị dạng danh sách`
  String get showAsList {
    return Intl.message(
      'Hiển thị dạng danh sách',
      name: 'showAsList',
      desc: '',
      args: [],
    );
  }

  /// `Lưu`
  String get save {
    return Intl.message(
      'Lưu',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Đã dừng quét các thiết bị Beacon. \nVui lòng bật tính năng BlueTooth, Vị trí\n và bấm nút Bắt đầu theo dõi`
  String get notScanning {
    return Intl.message(
      'Đã dừng quét các thiết bị Beacon. \nVui lòng bật tính năng BlueTooth, Vị trí\n và bấm nút Bắt đầu theo dõi',
      name: 'notScanning',
      desc: '',
      args: [],
    );
  }

  /// `Đặt lại`
  String get reset {
    return Intl.message(
      'Đặt lại',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin truy xuất`
  String get pigDetail {
    return Intl.message(
      'Thông tin truy xuất',
      name: 'pigDetail',
      desc: '',
      args: [],
    );
  }

  /// `Mã số: `
  String get idRow {
    return Intl.message(
      'Mã số: ',
      name: 'idRow',
      desc: '',
      args: [],
    );
  }

  /// `Ngày nhập chuồng: `
  String get dateRow {
    return Intl.message(
      'Ngày nhập chuồng: ',
      name: 'dateRow',
      desc: '',
      args: [],
    );
  }

  /// `Tình trạng tiêm Vắc-xin: `
  String get vaccinateRow {
    return Intl.message(
      'Tình trạng tiêm Vắc-xin: ',
      name: 'vaccinateRow',
      desc: '',
      args: [],
    );
  }

  /// `đã tiêm`
  String get vaccinated {
    return Intl.message(
      'đã tiêm',
      name: 'vaccinated',
      desc: '',
      args: [],
    );
  }

  /// `chưa tiêm`
  String get notVaccinated {
    return Intl.message(
      'chưa tiêm',
      name: 'notVaccinated',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ: `
  String get locationRow {
    return Intl.message(
      'Địa chỉ: ',
      name: 'locationRow',
      desc: '',
      args: [],
    );
  }

  /// `Thân nhiệt: `
  String get tempRow {
    return Intl.message(
      'Thân nhiệt: ',
      name: 'tempRow',
      desc: '',
      args: [],
    );
  }

  /// `°C`
  String get celcius {
    return Intl.message(
      '°C',
      name: 'celcius',
      desc: '',
      args: [],
    );
  }

  /// `Bù nhiệt thiết bị đo: `
  String get deviceOffset {
    return Intl.message(
      'Bù nhiệt thiết bị đo: ',
      name: 'deviceOffset',
      desc: '',
      args: [],
    );
  }

  /// ` Log nhiệt độ`
  String get pigTemperatureLog {
    return Intl.message(
      ' Log nhiệt độ',
      name: 'pigTemperatureLog',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
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
