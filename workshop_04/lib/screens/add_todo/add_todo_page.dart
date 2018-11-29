import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:workshop_04/redux/app_state.dart';
import 'package:workshop_04/redux/todo_list/todo_list_action.dart';

class AddTODOPage extends StatefulWidget {
  AddTODOPage({Key key}) : super(key: key);

  @override
  _AddTODOPageState createState() => _AddTODOPageState();
}

class _AddTODOPageState extends State<AddTODOPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: StoreConnector<AppState, ValueChanged<String>>(
              converter: (store) => (text) {
                    if (text.trim().isNotEmpty) {
                      Navigator.of(context).pop();
                      store.dispatch(AddTODOAction(text));
                    }
                  },
              builder: (context, callback) {
                return TextField(
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Enter todo here...'),
                  onSubmitted: callback,
                );
              })),
    );
  }
}
