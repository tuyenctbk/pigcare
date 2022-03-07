import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pig_care/l10n/l10n.dart';
import 'package:pig_care/src/model/pig_info.dart';
import 'package:pig_care/src/model/pig_status.dart';
import 'package:pig_care/src/provider/shared_data_provider.dart';

class PigHistoryScreen extends StatelessWidget {
  final int id;

  const PigHistoryScreen({Key? key, required this.id}) : super(key: key);

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
        title: Text('Log đo: ${info.id}'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ValueListenableBuilder<List<PigStatus>>(
          valueListenable: sharedDataProvider.pigStatusHistories,
          builder: (context, value, _) {
            final list =
                value.where((element) => element.id == info.id).toList();
            return ListView.separated(
                itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          L10n.current.temperature(list[index].temperature),
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Spacer(),
                        Text(list[index].getLastUpdateTime(
                            now: DateTime.now(), detail: true))
                      ],
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 1,
                    ),
                itemCount: list.length);
          },
        ),
      ),
    );
  }

  Widget get _spacer1 => SizedBox(
        height: 15,
      );
}
