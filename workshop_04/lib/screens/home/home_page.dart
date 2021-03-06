import 'package:flutter/material.dart';
import 'package:workshop_04/models/todo.dart';
import 'package:workshop_04/screens/home/widgets/todo_card.dart';
import 'package:workshop_04/screens/add_todo/add_todo_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTODOPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO List'),
      ),
      body: _buildRow(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _buildRow(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('todo')
//          .orderBy('isDone', descending: true)
//          .orderBy('title')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<TODO> _todoList = snapshot
        .map((documentSnapshot) => TODO.fromSnapshot(documentSnapshot))
        .toList();
    return ListView.builder(
      itemBuilder: (buildContext, position) {
        return TODOCard(_todoList[position]);
      },
      itemCount: _todoList.length,
    );
  }
}
