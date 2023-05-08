import 'dart:convert';

import 'package:backend/models/data_model.dart';

String fromMaptoString({required Map<String, dynamic> map}) {
  String jsonString = json.encode(map);
  return jsonString;
}

Map<String, dynamic> fromStringtoMap({required String jsonString}) {
  Map<String, dynamic> map = json.decode(jsonString);
  return map;
}

DataModel fromMaptoDatamodel({required Map<String, dynamic> map}) {
  return DataModel(
      accessiblity: map['accessiblity'],
      activity: map['activity'],
      key: map['key'],
      link: map['link'],
      participants: map['participants'],
      price: map['price'],
      type: map['type']);
}
