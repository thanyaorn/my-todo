import 'package:flutter/material.dart';
import 'package:workshop_04/models/todo.dart';
import 'package:workshop_04/screens/home/widgets/todo_card.dart';
import 'package:workshop_04/screens/add_todo/add_todo_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TODO> todoList;

  void _incrementCounter() async {
    TODO todo = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTODOPage()));
    if (todo != null)
      setState(() {
        todoList.add(todo);
      });
  }

  @override
  void initState() {
    super.initState();
    todoList = List<TODO>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (buildContext, position) {
            return TODOCard(todoList[position]);
          },
          itemCount: todoList.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
