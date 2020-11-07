import 'package:flutter/material.dart';
import 'package:moor/moor.dart' as moor;
import 'package:todo_list/db.dart';
import 'package:todo_list/todoMenue.dart';

class TodoView extends StatefulWidget {
  TodoView({Key key, this.todo, this.isDone}) : super(key: key);
  final Todo todo;
  final bool isDone;
  @override
  _TodoState createState() => new _TodoState();
}

class _TodoState extends State<TodoView> {
  bool _isChecked;
  Database db = Database();
  TextStyle _style = TextStyle();

  void _changeCheck() {
    db
        .updateTodo(
            widget.todo.id,
            TodosCompanion(
              title: moor.Value(widget.todo.title),
              details: moor.Value(widget.todo.details),
              isdone: moor.Value(!_isChecked),
            ))
        .then((_) => {
              setState(() {
                _isChecked = !_isChecked;
              }),
              _changeStyle()
            });
  }

  void _changeStyle() {
    if (_isChecked) {
      setState(() {
        _style = TextStyle(decoration: TextDecoration.lineThrough);
      });
    } else {
      setState(() {
        _style = TextStyle();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isChecked = widget.todo.isdone;
      _changeStyle();
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
                _changeCheck();
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
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TodoMenue(todo: widget.todo)));
          },
          icon: Icon(Icons.keyboard_arrow_right),
        ),
      ]),
    );
  }
}
