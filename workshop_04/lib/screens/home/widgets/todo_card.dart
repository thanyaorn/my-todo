import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:workshop_04/models/todo.dart';
import 'package:workshop_04/redux/app_state.dart';
import 'package:workshop_04/redux/todo_list/todo_list_action.dart';

class TODOCard extends StatelessWidget {
  final TODO todo;

  TODOCard(this.todo);

  TextDecoration _getTextDecoration(bool value) {
    if (value)
      return TextDecoration.lineThrough;
    else
      return TextDecoration.none;
  }

  Future<void> _askDelete(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete \'${todo.name}\'?'),
          actions: <Widget>[
            StoreConnector<AppState, VoidCallback>(
                converter: (store) => () {
                  Navigator.of(context).pop();
                  store.dispatch(DeleteTODOAction(todo));
                },
                builder: (context, callback) {
                  return FlatButton(
                    child: Text('Yes'),
                    onPressed: callback,
                  );
                }),
            FlatButton(
              child: Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          _askDelete(context);
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  todo.name,
                  style: TextStyle(
                    fontSize: 24,
                    decoration: _getTextDecoration(todo.isDone),
                  ),
                ),
              ),
              StoreConnector<AppState, ValueChanged<bool>>(
                  converter: (store) =>
                      (value) => store.dispatch(ChangeIsDoneAction(todo)),
                  builder: (context, callback) {
                    return Checkbox(
                      value: todo.isDone,
                      onChanged: callback,
                    );
                  })
            ],
          ),
        ));
  }
}