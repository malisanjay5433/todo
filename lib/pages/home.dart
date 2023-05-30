import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data/database.dart';
import '../utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  TodoDatabase db = TodoDatabase();
  final _myBox = Hive.box('TODO');
  void checkState(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  void dimiss() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get('TODO') == null) {
      db.createInitialData();
    } else {
      db.loadDatabase();
    }
    super.initState();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveTask,
            onCancel: dimiss,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text('TO DO'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                taskName: db.todoList[index][0],
                isTaskCompleted: db.todoList[index][1],
                onchanged: (value) => checkState(value, index),
                deleteFunction: (context) => deleteTask(index));
          },
        ));
  }
}
