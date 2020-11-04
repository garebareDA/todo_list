import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => new _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  String task = "";
  String memo = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => {
            Navigator.of(context).pop()
          },
        ),
      ),
    );
  }
}
