import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget{ //Stateless cannot be change dynamically
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Todo List', 
      home: new TodoList()
    );
  }
}

class TodoList extends StatefulWidget{ //Need two classes 1 => Widget it self
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList>{ //2 => Which create the state
  List<String> _todoItems = [];
  
  //This will be called each time the + button is pressed
  void _addTodoItem(){
    // Putting our code inside "setState" tells the app that our state has change
    // and it will automatically re-render the list
    setState(() {
      int index = _todoItems.length;
      _todoItems.add("item" + index.toString());
    });
  }

  // Build the whole list of todo items
  Widget _buildTodoList(){
    return new ListView.builder(
      itemBuilder: (context, index){
        // itemBuilder will be automatically called as many times as it takes for the
        // list to be fill up its available space, which is most likely more than the 
        // number of todo items we have. So, we need to chack the index is OK
        if (index < _todoItems.length){
          return _buildTodoItem(_todoItems[index]);
        }
      }
    );
  }

  //Build a single todo item
  Widget _buildTodoItem(String todoText){
    return new ListTile(
      title: new Text(todoText),
    );
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Todo List"),
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addTodoItem,
        tooltip: "Add task",
        child: new Icon(Icons.add),
      ),
    );
  }
}