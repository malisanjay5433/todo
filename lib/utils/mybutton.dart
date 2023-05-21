// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onpressed;

  MyButton({
    Key? key,
    required this.text,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
