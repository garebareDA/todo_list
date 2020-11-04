import 'package:flutter/material.dart';
import 'package:todo_list/add_button.dart';

void main() {
  runApp(MyApp());
}

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
        body: Column(
          children: [],
        ),
        floatingActionButton: AddButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
      ),
    );
  }
}
