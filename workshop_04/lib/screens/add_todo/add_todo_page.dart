import 'package:flutter/material.dart';
import 'package:workshop_04/models/todo.dart';

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
          padding:EdgeInsets.all(15),
          child:TextField(
        style: TextStyle(
          fontSize: 24,
          color: Colors.black
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter todo here...'),
        onSubmitted: (text) {
          Navigator.pop(context, TODO(name: text, isDone: false));
        },
      )),
    );
  }
}
