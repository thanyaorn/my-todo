import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          var data = Map<String, dynamic>();
          data['title'] = text;
          data['isDone'] = false;
          Firestore.instance.collection('todo').add(data);
          Navigator.pop(context, data);
        },
      )),
    );
  }
}
