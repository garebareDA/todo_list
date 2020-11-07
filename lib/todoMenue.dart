import 'package:flutter/material.dart';
import 'package:moor/moor.dart' as moor;
import 'package:todo_list/db.dart';

class TodoMenue extends StatefulWidget {
  TodoMenue({Key key, this.todo}) : super(key: key);
  final Todo todo;

  @override
  _TodoMenueState createState() => new _TodoMenueState();
}

class _TodoMenueState extends State<TodoMenue> {
  String _task = "";
  String _details = "";
  TextEditingController _taskEditingController;
  TextEditingController _detailsEditingController;
  bool _backButton = true;
  Database db = Database();

  void _update() {
    db
        .updateTodo(
            widget.todo.id,
            TodosCompanion(
              title: moor.Value(_task),
              details: moor.Value(_details),
              isdone: moor.Value(widget.todo.isdone),
            ))
        .then((_) => {Navigator.of(context).pop()});
  }

  void _delete() {
    db.deleteTodo(widget.todo.id).then((_) => {
      Navigator.of(context).pop()
    });
  }

  void _setTask(String task) {
    if (task != '') {
      setState(() {
        _task = task;
        _backButton = true;
      });
    } else {
      setState(() {
        _backButton = false;
      });
    }
  }

  void _setDetails(String details) {
    setState(() {
      _details = details;
    });
  }

  @override
  void initState() {
    super.initState();
    _task = widget.todo.title;
    _details = widget.todo.details;
    _taskEditingController = TextEditingController(text: _task);
    _detailsEditingController = TextEditingController(text: _details);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            disabledColor: Colors.black26,
            onPressed: !_backButton ? null : () => {_update()},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => {_delete()},
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: TextField(
                  controller: _taskEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Task',
                  ),
                  onChanged: (text) => {_setTask(text)},
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextField(
                    controller: _detailsEditingController,
                    maxLines: 12,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Details',
                    ),
                    onChanged: (text) => {_setDetails(text)}),
              ),
            ],
          ),
        ));
  }
}
