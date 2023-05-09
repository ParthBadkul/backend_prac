import 'package:backend/const.dart';
import 'package:backend/functions/manage_data.dart';
import 'package:backend/functions/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPref sharedPref = SharedPref();

class SharedPref {
  late SharedPreferences _instances;
  late Map<String, dynamic> data;

  Future<void> init() async {
    _instances = await SharedPreferences.getInstance();
    await getData;
  }

  Future<void> getData() async {
    final String jsonString =
        _instances.getString(keyInternalData) ?? await saveInternalData();
    Map<String, dynamic> map = fromStringtoMap(jsonString: jsonString);
    data = map;
  }

  Future<String> saveInternalData({
    String jsonString = '{}',
  }) async {
    String jsonStringinitValue = jsonString;
    await _instances.setString(keyInternalData, jsonStringinitValue);
    return jsonStringinitValue;
  }
}
