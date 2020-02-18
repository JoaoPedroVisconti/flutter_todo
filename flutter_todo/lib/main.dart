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
  
  //Add the task. Accept a string 
  void _addTodoItem(String task){
    // Only add the task if the user actually entered something
    if (task.length > 0){
      // Putting our code inside "setState" tells the app that our state has change
      // and it will automatically re-render the list
      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index){
    setState(() => _todoItems.removeAt(index));
  }

  // Show an alert dialog asking the user to confirm that the task is done
  void _promptRemoveTodoItem(int index){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return new AlertDialog(
          title: new Text('Mark "${_todoItems[index]}" as done?'),
          actions: <Widget>[
            new FlatButton( 
              child: new Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            new FlatButton( 
              child: new Text('MARK AS DONE'),
              onPressed: () {
                _removeTodoItem(index);
                Navigator.of(context).pop();
              }
            ),
          ],
        );
      }
    );
  }

  // Build the whole list of todo items
  Widget _buildTodoList(){
    return new ListView.builder(
      itemBuilder: (context, index){
        // itemBuilder will be automatically called as many times as it takes for the
        // list to be fill up its available space, which is most likely more than the 
        // number of todo items we have. So, we need to chack the index is OK
        if (index < _todoItems.length){
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  //Build a single todo item
  Widget _buildTodoItem(String todoText, int index){
    return new ListTile(
      title: new Text(todoText),
      onTap: () => _promptRemoveTodoItem(index),
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
        onPressed: _pushAddTodoScreen, //Pressing this button opens the new screen
        tooltip: "Add task",
        child: new Icon(Icons.add),
      ),
    );
  }

  void _pushAddTodoScreen (){
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well
      // as adding a back button to close it
      new MaterialPageRoute(
        builder: (context){
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Add a new task"),
            ),
            body: new TextField(
              autofocus: true,
              onSubmitted: (val){
                _addTodoItem(val);
                Navigator.pop(context); // Close the add todo screen
              },
              decoration: new InputDecoration(
                hintText: 'Enter something to do.....',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            ),
          );
        }
      )
    );
  }
}