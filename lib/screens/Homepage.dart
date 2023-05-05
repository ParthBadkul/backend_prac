import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  late StreamSubscription<ConnectivityResult> subscription;
  void initState() {
    subscription =
        Connectivity().onConnectivityChanged.listen((Connectivity result) {
              if (result == ConnectivityResult.none) {
                // no internet conenction
              } else {
                // have internet connection
              }
            } as void Function(ConnectivityResult event)?);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
