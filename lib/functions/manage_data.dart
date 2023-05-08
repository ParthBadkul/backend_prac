import 'package:backend/data/dio.dart';
import 'package:backend/functions/utils.dart';

Future<Map<String, dynamic>> getExternalData() async {
  Map<String, dynamic> map = await getHttp();

  String jsonString = fromMaptoString(map: map);
  await saveNewInternalData(externaldata: jsonString);
  return map;
}

Future<void> saveNewInternalData({required String externaldata}) async {
//TODO: shared pref save data from json string
}

Future<Map<String, dynamic>> getInternalData() async {
  //TODO: await sahred.getdata
  //TODO : set the map under
  return {};
}
