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

  void _changeState() {
    setState(() {
      _isChecked = widget.todo.isdone;
      _changeStyle();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _changeState();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    super.dispose();
    _changeState();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _changeState();
  }

  @override
  void initState() {
    super.initState();
    _changeState(); 
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
