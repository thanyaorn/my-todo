import 'package:flutter/material.dart';
import 'package:workshop_04/models/todo.dart';

class TODOCard extends StatefulWidget{
  final TODO todo;
  TODOCard(this.todo);

  @override
  _TODOCardState createState() => _TODOCardState(this.todo);
}

class _TODOCardState extends State<TODOCard>{
  TODO todo;

  _TODOCardState(this.todo);

  void _onCheckBoxChanged(bool value)
  {
    setState(() {
      todo.isDone = value;
    });
  }

  TextDecoration _getTextDecoration(bool value)
  {
    if(value)
      return TextDecoration.lineThrough;
    else
      return TextDecoration.none;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(todo.name,
            style: TextStyle(
              fontSize: 24,
              decoration: _getTextDecoration(todo.isDone),
            ),),
          ),
          Checkbox(
            value: todo.isDone,
            onChanged: (value){
              _onCheckBoxChanged(value);
            },
          )
        ],
      ),
    );
  }
}