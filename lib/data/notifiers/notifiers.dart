import 'package:flutter/material.dart';

import '../../models/data_model.dart';

ValueNotifier<DataModel> dataNotifier = ValueNotifier(
  DataModel(
      accessiblity: '0.5',
      activity: 'activity',
      key: 'key',
      link: 'link',
      participants: 0,
      price: '0.05',
      type: 'type'),
);

ValueNotifier<bool> isConnectedNotifier = ValueNotifier(false);
