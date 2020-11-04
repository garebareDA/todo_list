import 'package:flutter/material.dart';
import 'package:todo_list/add_todo.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) => AddTodo()));
      },
      child: Icon(Icons.add),
    );
  }
}
