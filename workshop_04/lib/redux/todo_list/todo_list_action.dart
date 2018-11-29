import 'package:workshop_04/models/todo.dart';

class AddTODOAction {
  final String title;

  AddTODOAction(this.title);
}

class DeleteTODOAction {
  final TODO todo;

  DeleteTODOAction(this.todo);
}

class ChangeIsDoneAction {
  final TODO todo;
  ChangeIsDoneAction(this.todo);
}

class CompleteRefreshingAction {}
