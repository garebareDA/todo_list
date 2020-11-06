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
  TextStyle _style = TextStyle();

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
    _changeStyle();
  }

  void _changeStyle() {
    if (!_isChecked) {
      setState(() {
        _style = TextStyle();
      });
    } else {
      setState(() {
        _style = TextStyle(decoration: TextDecoration.lineThrough);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    bool value = widget.todo.isdone;
    setState(() {
      _isChecked = value;
    });
    _changeStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Expanded(
            child: Container(
          child: Row(children: [
            Checkbox(
              value: _isChecked,
              onChanged: (_) {
                changeCheck();
              },
            ),
            Flexible(
              child: Text(
                widget.todo.title,
                style: _style,
                textAlign: TextAlign.left,
              ),
            ),
          ]),
        )),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_arrow_right),
        ),
      ]),
    );
  }
}
