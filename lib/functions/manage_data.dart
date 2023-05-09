import 'package:backend/data/dio.dart';
import 'package:backend/data/shared_pref.dart';
import 'package:backend/functions/utils.dart';

Future<Map<String, dynamic>> getExternalData() async {
  Map<String, dynamic> map = await getHttp();

  String jsonString = fromMaptoString(map: map);
  await saveNewInternalData(externaldata: jsonString);
  return map;
}

Future<void> saveNewInternalData({required String externaldata}) async {
  sharedPref.saveInternalData(jsonString: externaldata);
}

Future<Map<String, dynamic>> getInternalData() async {
  //TODO: await sahred.getdata
  //TODO : set the map under
  await sharedPref.getData();
  Map<String, dynamic> map = sharedPref.data;
  return map;
}
