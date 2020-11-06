import 'package:flutter/material.dart';
import 'package:moor/moor.dart' as moor;
import 'package:todo_list/db.dart';

class TodoView extends StatefulWidget {
  TodoView({Key key, this.todo}) : super(key: key);
  final Todo todo;
  @override
  _TodoState createState() => new _TodoState();
}

class _TodoState extends State<TodoView> {
  bool _isChecked = false;
  Database db = Database();

  void changeCheck() {
    db.updateTodo(
        widget.todo.id,
        TodosCompanion(
          title: moor.Value(widget.todo.title),
          details: moor.Value(widget.todo.details),
          isdone: moor.Value(!_isChecked),
        ));
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  @override
  void initState() {
    super.initState();
    bool value = widget.todo.isdone;
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.todo.title),
      value: _isChecked,
      onChanged: (_) {
        changeCheck();
      },
    );
  }
}
