// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(id) => "PigId: ${id}";

  static String m1(t) => "Temperature: ${t}°C";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Pig Farm"),
        "dangerHighAt": MessageLookupByLibrary.simpleMessage(
            "Alert when temperature above:"),
        "dangerLowAt": MessageLookupByLibrary.simpleMessage(
            "Alert when temperature below:"),
        "guideWarningInput": MessageLookupByLibrary.simpleMessage(
            "Please make sure Alert low temperature level is smaller than Alert high temperature level"),
        "id": m0,
        "initializing": MessageLookupByLibrary.simpleMessage("loading..."),
        "notRanging": MessageLookupByLibrary.simpleMessage("not Ranging"),
        "notScanning": MessageLookupByLibrary.simpleMessage(
            "Stopped scanning. Please make sure that \nBluetooth and Location features are enabled. \nThen press Start observe again"),
        "ranging": MessageLookupByLibrary.simpleMessage("ranging"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "save": MessageLookupByLibrary.simpleMessage("save"),
        "setting": MessageLookupByLibrary.simpleMessage("Setting"),
        "showAsGrid": MessageLookupByLibrary.simpleMessage("Show as grid"),
        "showAsList": MessageLookupByLibrary.simpleMessage("Show as list"),
        "startObserve": MessageLookupByLibrary.simpleMessage("Start observe"),
        "stopObserve": MessageLookupByLibrary.simpleMessage("Stop"),
        "temperature": m1,
        "warningLevelSetting":
            MessageLookupByLibrary.simpleMessage("Warning level setting")
      };
}
