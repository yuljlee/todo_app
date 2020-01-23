import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';
import 'package:intl/intl.dart';

class TodoDetail extends StatefulWidget {
  final Todo todo;

  @override
  State<StatefulWidget> createState() => TodoDetailState();

}

class TodoDetailState extends State {
  Todo todo;
  TodoDetailState(this.todo);
  final _priorities = ['High', 'Medium', 'Low'];
  String _priority = 'Low';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(todo.title),
        ),
    );
    
  }
  
}