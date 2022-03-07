// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(id) => "Mã số: ${id}";

  static String m1(t) => "Nhiệt độ: ${t}°C";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Pig Farm"),
        "celcius": MessageLookupByLibrary.simpleMessage("°C"),
        "dangerHighAt": MessageLookupByLibrary.simpleMessage(
            "Cảnh cáo khi thân nhiệt trên:"),
        "dangerLowAt": MessageLookupByLibrary.simpleMessage(
            "Cảnh báo khi thân nhiệt dưới:"),
        "dateRow": MessageLookupByLibrary.simpleMessage("Ngày nhập chuồng: "),
        "deviceOffset":
            MessageLookupByLibrary.simpleMessage("Bù nhiệt thiết bị đo: "),
        "guideWarningInput": MessageLookupByLibrary.simpleMessage(
            "Điều kiện nhập:  mức cảnh báo nhiệt độ thấp <  mức cảnh báo nhiệt độ cao "),
        "id": m0,
        "idRow": MessageLookupByLibrary.simpleMessage("Mã số: "),
        "initializing": MessageLookupByLibrary.simpleMessage("Đang tải..."),
        "locationRow": MessageLookupByLibrary.simpleMessage("Địa chỉ: "),
        "notRanging": MessageLookupByLibrary.simpleMessage("Dừng theo dõi"),
        "notScanning": MessageLookupByLibrary.simpleMessage(
            "Đã dừng quét các thiết bị Beacon. \nVui lòng bật tính năng BlueTooth, Vị trí\n và bấm nút Bắt đầu theo dõi"),
        "notVaccinated": MessageLookupByLibrary.simpleMessage("chưa tiêm"),
        "pigDetail":
            MessageLookupByLibrary.simpleMessage("Thông tin truy xuất"),
        "pigTemperatureLog":
            MessageLookupByLibrary.simpleMessage(" Log nhiệt độ"),
        "ranging": MessageLookupByLibrary.simpleMessage("Đang theo dõi"),
        "reset": MessageLookupByLibrary.simpleMessage("Đặt lại"),
        "retry": MessageLookupByLibrary.simpleMessage("Thử lại"),
        "save": MessageLookupByLibrary.simpleMessage("Lưu"),
        "setting": MessageLookupByLibrary.simpleMessage("Cài đặt"),
        "showAsGrid":
            MessageLookupByLibrary.simpleMessage("Hiển thị dạng lưới"),
        "showAsList":
            MessageLookupByLibrary.simpleMessage("Hiển thị dạng danh sách"),
        "startObserve":
            MessageLookupByLibrary.simpleMessage("bắt đầu theo dõi"),
        "stopObserve": MessageLookupByLibrary.simpleMessage("dừng"),
        "tempRow": MessageLookupByLibrary.simpleMessage("Thân nhiệt: "),
        "temperature": m1,
        "vaccinateRow":
            MessageLookupByLibrary.simpleMessage("Tình trạng tiêm Vắc-xin: "),
        "vaccinated": MessageLookupByLibrary.simpleMessage("đã tiêm"),
        "warningLevelSetting":
            MessageLookupByLibrary.simpleMessage("Cài đặt cấu hình đo")
      };
}
