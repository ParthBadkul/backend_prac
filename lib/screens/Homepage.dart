import 'dart:async';

import 'package:backend/data/notifiers/notifiers.dart';
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
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        // no internet conenction
        isConnectedNotifier.value = false;
      } else {
        // have internet connection
        isConnectedNotifier.value = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'Spontanious',
                    style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        letterSpacing: 3),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset('images/globe.png'),
                ),
                ValueListenableBuilder(
                  valueListenable: dataNotifier,
                  builder: (context, data, child) {
                    return Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 130,
                            ),
                            Center(
                              child: Text(
                                data.activity,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 25,
                                  letterSpacing: 2.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'This is  ${data.type} activity',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                letterSpacing: 2.5,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 110),
                              child: ListTile(
                                title: Text(
                                  data.participants.toString(),
                                  style: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                leading: Text(
                                  "Participants",
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              ]),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              // TODO: add onpressed fucntion
              await dataNotifier.value.reset();
            },
            icon: Icon(Icons.add),
            label: Text('New activity'),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                // TODO: add on pressed functions
                dataNotifier.value.logData();
              },
              child: Text('LogData'))
        ],
      ),
    );
  }
}
