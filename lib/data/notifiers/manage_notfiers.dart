import 'package:backend/data/notifiers/notifiers.dart';
import 'package:backend/functions/manage_data.dart';
import 'package:backend/functions/utils.dart';

Map<String, dynamic> dataMapCurrent = {};

Future<void> setDataNotifier() async {
  if (isConnectedNotifier.value) {
    dataMapCurrent = await getExternalData();
  } else {
    dataMapCurrent = await getInternalData();
  }
  if (dataMapCurrent.isNotEmpty) {
    dataNotifier.value = fromMaptoDatamodel(map: dataMapCurrent);
  }
}
