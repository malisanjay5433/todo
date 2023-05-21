import 'package:flutter/material.dart';
import 'package:todo/utils/mybutton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            //User input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'Save', onpressed: onSave),
                MyButton(text: 'Cancel', onpressed: onCancel)
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.yellow[300],
    );
  }
}
