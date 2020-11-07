import 'package:flutter/material.dart';
import 'package:todo_list/addButton.dart';
import 'package:todo_list/db.dart';
import 'package:todo_list/todo.dart';

void main() {
  runApp(MyApp());
}

final RouteObserver routeObserver = RouteObserver();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo_lsit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tasks',
              style: TextStyle(
                fontSize: 40,
              )),
        ),
        body: Body(),
        floatingActionButton: AddButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
      ),
      navigatorObservers: [routeObserver],
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State<Body> with RouteAware {
  List<Todo> _col = [];
  Database db = Database();

  void _updateList() {
    List<Todo> todoList = [];
    Future<List<Todo>> future = db.allTodoEntries;
    future.then((value) => {
          value.forEach((element) {
            todoList.add(element);
          }),
          setState(() {
            _col = todoList.reversed.toList();
          }),
        });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateList();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    super.dispose();
    _updateList();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _updateList();
  }

  @override
  void initState() {
    super.initState();
    _updateList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(60),
      itemCount: _col.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoView(todo:_col[index]);
      },
    );
  }
}
