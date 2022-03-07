import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pig_care/l10n/l10n.dart';
import 'package:pig_care/src/model/pig_info.dart';
import 'package:pig_care/src/model/pig_status.dart';
import 'package:pig_care/src/provider/shared_data_provider.dart';
import 'package:pig_care/src/util/shared_colors.dart';

class PigDetailScreen extends StatelessWidget {
  final int id;

  const PigDetailScreen({Key? key, required this.id}) : super(key: key);

  PigInfo get info => PigInfo(
      id: id,
      inDate: DateTime.utc(2021, 3, 1),
      isVaxinated: true,
      location: 'Chuồng 1');

  TextStyle get _style => TextStyle(color: Colors.black54, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    final sharedDataProvider =
        RepositoryProvider.of<SharedDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(L10n.current.pigDetail),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _spacer1,
              _spacer1,

              /// ID
              RichText(
                text: TextSpan(style: _style, children: [
                  TextSpan(text: L10n.current.idRow),
                  TextSpan(
                      text: info.id.toString(),
                      style: _style.copyWith(color: Colors.blue)),
                ]),
              ),
              // Text(L10n.current.idRow(info.id),style: ,
              _spacer1,

              /// temperature
              ValueListenableBuilder<List<PigStatus>>(
                  valueListenable: sharedDataProvider.pigStatuses,
                  builder: (context, value, _) {
                    final temperature = value
                        .firstWhere((element) => element.id == info.id)
                        .temperature;
                    return RichText(
                      text: TextSpan(style: _style, children: [
                        TextSpan(text: L10n.current.tempRow),
                        TextSpan(
                          text: '${temperature} ${L10n.current.celcius}',
                          style: _style.copyWith(
                              color: temperature <
                                          sharedDataProvider.lowAlertLevel ||
                                      temperature >
                                          sharedDataProvider.highAlertLevel
                                  ? SharedColor.alertColor
                                  : SharedColor.normalColor),
                        ),
                      ]),
                    );
                  }),
              _spacer1,

              /// Vaccinxate
              RichText(
                text: TextSpan(style: _style, children: [
                  TextSpan(text: L10n.current.vaccinateRow),
                  TextSpan(
                    text: info.isVaxinated
                        ? L10n.current.vaccinated
                        : L10n.current.notVaccinated,
                    style: _style.copyWith(
                        color: info.isVaxinated ? Colors.green : Colors.red),
                  ),
                ]),
              ),
              _spacer1,
              /// Location
              RichText(
                text: TextSpan(style: _style, children: [
                  TextSpan(text: L10n.current.locationRow),
                  TextSpan(
                      text: info.location,
                      style: _style.copyWith(color: Colors.black)),
                ]),
              ),
              _spacer1,

              /// indate
              RichText(
                text: TextSpan(style: _style, children: [
                  TextSpan(text: L10n.current.dateRow),
                  TextSpan(
                      text: info.dateStr,
                      style: _style.copyWith(color: Colors.black)),
                ]),
              ),

              _spacer1,
              _spacer1,
              _spacer1,

              /// photo
              Image.asset('assets/images/pig_photo.jpg')
            ],
          ),
        ),
      ),
    );
  }

  Widget get _spacer1 => SizedBox(
        height: 15,
      );
}
