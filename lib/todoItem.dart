import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:todo/todo.dart';

class ToDoItem extends StatelessWidget {

  final ToDo todo;
  const ToDoItem({Key? key, required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () {
          print('Clicked to do item');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: white,
        leading: Icon( todo.isDone ? Icons.check_box : Icons.check_box_outline_blank, color: selected),
        title: Text(todo.toDoText, style: TextStyle(fontSize:20, color: black, decoration: todo.isDone ? TextDecoration.lineThrough : null ),),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 25,
          width: 35,
          decoration: BoxDecoration(
            color: delete,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: white,
            iconSize: 10,
            icon: Icon(Icons.delete),
            onPressed: (){
              print('Clicked to do item for delete');
            },
          ),
        ),
      ),
    );
  }
}
