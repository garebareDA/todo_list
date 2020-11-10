import 'package:flutter/material.dart';
import 'package:moor/moor.dart' as moor;
import 'package:todo_list/db.dart';
import 'package:todo_list/todoMenue.dart';
import 'package:todo_list/main.dart';

class TodoView extends StatefulWidget {
  TodoView({Key key, this.todo}) : super(key: key);
  final Todo todo;
  @override
  _TodoState createState() => new _TodoState();
}

class _TodoState extends State<TodoView> with RouteAware {
  Database db = Database();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
          child: Row(children: [
            Flexible(
              child: Text(
                widget.todo.title,
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
