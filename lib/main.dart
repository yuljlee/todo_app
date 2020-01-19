import 'package:flutter/material.dart';
import 'package:todo_app/util/dbhelper.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/todolist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // List<Todo> todos = List<Todo>();
    // DbHelper helper = DbHelper();
    // helper.initializeDb().then(
    //   (result) => helper.getTodos().then((result) => todos = result));
    // DateTime today = DateTime.now();
    // Todo todo = Todo('Buy some apples', today.toString(), 1, 'And make sure they are good');
    // helper.insertTodo(todo);

    return MaterialApp(
      title: 'Todos',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Todos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: TodoList(),
    );
  }
}
