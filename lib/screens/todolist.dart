import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  DbHelper helper = DbHelper();
  List<Todo> todos;
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    ListView todoListItems() {
        return ListView.builder(
          itemCount:  count,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(this.todos[position].id.toString())
                  ),
                  title: Text(this.todos[position].title),
                  subtitle: Text(this.todos[position].date),
                  onTap: () {
                    debugPrint('Tapped on ' + this.todos[position].id.toString());
                  },
              ),
            );
          }
        );


    }
    
    if (todos == null) {
      todos = List<Todo>();
      getData();
    }
    return Scaffold(
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add new Todo',
        child: new Icon(Icons.add),
      ),
    );
  }

  void getData() {
    final dbFuture = helper.initializeDb();
    dbFuture.then((result) {
      final todoFuture = helper.getTodos();
      todoFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        count = todoList.length;
        for (int i=0; i<count; i++) {
          todoList.add(Todo.fromObject(result[i]));
          debugPrint(todoList[i].toString());
        }
        setState(() {
          todos = todoList;
          count = count;
        debugPrint('Items ' + count.toString());
        });
      });
    
    });

  }
}
