import 'package:backend/data/notifiers/manage_notfiers.dart';
import 'package:backend/data/shared_pref.dart';

Future<void> initApp() async {
  // Future.delayed(Duration(seconds: 1));
  await initSharedPref();
  await initDataNotfier();
}

Future<void> initSharedPref() async {
//TODO shared pref
  await sharedPref.init();
}

Future<void> initDataNotfier() async {
  await setDataNotifier();
}
