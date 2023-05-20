import 'dart:ffi';

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  Function(bool?)? onchanged;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.isTaskCompleted,
      required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Checkbox(value: isTaskCompleted, onChanged: onchanged),
            Text(taskName),
          ],
        ),
      ),
    );
  }
}
