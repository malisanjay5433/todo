import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];
  //Reference of our box
  final _myBox = Hive.box('TODO');

  //run the app to load the predefined list
  void createInitialData() {
    todoList = [
      ['Add your todo list here', false]
    ];
  }

  //load the data from database
  void loadDatabase() {
    todoList = _myBox.get('TODO');
  }

  //update the database
  void updateDatabase() {
    _myBox.put('TODO', todoList);
  }
}
