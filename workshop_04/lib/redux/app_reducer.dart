import 'app_state.dart';
import 'package:workshop_04/redux/todo_list/todo_list_reducer.dart';

AppState appReducer(AppState state, action){
  return AppState(actionCount: todoListReducer(state.actionCount, action));
}