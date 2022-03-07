import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pig_care/src/util/common_const.dart';

part 'warning_config.freezed.dart';
part 'warning_config.g.dart';

@freezed
class WarningConfig with _$WarningConfig {
  const WarningConfig._();

  const factory WarningConfig({
    @JsonKey(name: 'alertLow', nullable: true)
    @Default(defaultAlertLow)
        double alertLow,
    @JsonKey(name: 'alertHigh', nullable: true)
    @Default(defaultAlertHigh)
        double alertHigh,
  }) = _WarningConfig;

  factory WarningConfig.fromJson(Map<String, dynamic> json) =>
      _$WarningConfigFromJson(json);
}
