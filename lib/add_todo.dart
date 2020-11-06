import 'package:flutter/material.dart';
import 'package:moor/moor.dart' as moor;
import 'package:todo_list/db.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => new _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  String _task = "";
  String _details = "";
  bool _addButtonEnabled = false;
  Database db = Database();

  void _setTask(String task) {
    if (task != '') {
      setState(() {
        _task = task;
        _addButtonEnabled = true;
      });
    } else {
      setState(() {
        _addButtonEnabled = false;
      });
    }
  }

  void _insertTask(BuildContext context) {
    print(_task);
    print(_details);
    db.addTodoEntry(TodosCompanion(
      title: moor.Value(_task),
      details: moor.Value(_details),
      isdone: moor.Value(false),
    ));
    Navigator.of(context).pop();
  }

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
      floatingActionButton: RaisedButton(
        padding: const EdgeInsets.all(13),
        child: Text('Add',
            style: TextStyle(
              fontSize: 20,
            )),
        color: Colors.blue[500],
        textColor: Colors.white,
        disabledTextColor: Colors.black26,
        shape: StadiumBorder(),
        highlightColor: Colors.blue,
        onPressed: !_addButtonEnabled ? null : () => {_insertTask(context)},
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Task',
                ),
                onChanged: (text) => {_setTask(text)},
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: TextField(
                  maxLines: 9,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Details',
                  ),
                  onChanged: (text) => {_details = text}),
            ),
          ],
        ),
      ),
    );
  }
}
