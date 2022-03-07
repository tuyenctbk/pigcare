class PigInfo {
  final int id;
  final DateTime inDate;
  final bool isVaxinated;
  final String location;

  PigInfo(
      {required this.id,
      required this.inDate,
      required this.isVaxinated,
      required this.location});

  String get dateStr => '${inDate.day}/${inDate.month}/${inDate.year}';
}
