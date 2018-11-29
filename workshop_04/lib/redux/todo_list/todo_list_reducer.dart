import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workshop_04/redux/todo_list/todo_list_action.dart';
import 'package:workshop_04/models/todo.dart';

int todoListReducer(int actionCount, action) {
  if (action is AddTODOAction) {
    AddTODOAction addTODOAction = action;
    Firestore.instance
        .collection('todo')
        .add({'title': addTODOAction.title, 'isDone': false});
    return actionCount + 1;
  } else if (action is DeleteTODOAction) {
    DeleteTODOAction deleteTODOAction = action;
    deleteTODOAction.todo.reference.delete();
    return actionCount + 1;
  } else if (action is ChangeIsDoneAction) {
    ChangeIsDoneAction changeIsDoneAction = action;
    Firestore.instance.runTransaction((transaction) async {
      final freshSnapshot = await transaction.get(changeIsDoneAction.todo.reference);
      final fresh = TODO.fromSnapshot(freshSnapshot);

      await transaction.update(changeIsDoneAction.todo.reference,
          {'isDone': !fresh.isDone});
    });
    return actionCount + 1;
  } else if (action is CompleteRefreshingAction) {}
  return actionCount;
}
