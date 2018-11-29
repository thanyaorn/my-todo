import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:workshop_04/screens/home/home_page.dart';
import 'package:workshop_04/redux/app_state.dart';
import 'package:workshop_04/redux/app_reducer.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final store = Store<AppState>(appReducer,
      initialState: AppState(actionCount: 0), middleware: []);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'TODO List',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'TODO List'),
        ));
  }
}

