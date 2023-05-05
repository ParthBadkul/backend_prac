class DataModel {
  final String activity;
  final String type;
  final int participants;
  final String price;
  final String link;
  final String key;
  final String accessiblity;

  DataModel({
    required this.accessiblity,
    required this.activity,
    required this.key,
    required this.link,
    required this.participants,
    required this.price,
    required this.type,
  });

  Future<void> reset() async {
    //Todo: set data notfier setter
    //await setDataNotifier();
  }

  void logData() {
    //TODO ; set data log
  }
}
