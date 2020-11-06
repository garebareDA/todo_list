import 'package:flutter/material.dart';
import 'package:todo_list/add_button.dart';
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
  List<Widget> _todoList = List<Widget>();
  Database db = Database();

  void _updateList() {
    setState(() {
      _todoList = [];
    });

    Future<List<Todo>> future = db.allTodoEntries;
    future
        .then((value) => {
              print(value),
              value.forEach((element) {
                print(element.title);
                setState(() {
                  _todoList.add(TodoView(todo: element));
                });
              })
            })
        .catchError((onError) => {print(onError.toString())});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    super.dispose();
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
    return SingleChildScrollView(
      padding: EdgeInsets.all(60),
      child: Column(
        children: _todoList.reversed.toList(),
      ),
    );
  }
}
