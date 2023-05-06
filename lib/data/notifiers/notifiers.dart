import 'package:flutter/material.dart';

import '../../models/data_model.dart';

ValueNotifier<DataModel> dataNotifier = ValueNotifier(
  DataModel(
      accessiblity: 'accessiblity',
      activity: 'activity',
      key: 'key',
      link: 'link',
      participants: 0,
      price: 'price',
      type: 'type'),
);

ValueNotifier<bool> isConnectedNotifier = ValueNotifier(false);
