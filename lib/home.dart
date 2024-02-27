import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/todo.dart';
import 'package:todo/todoItem.dart';

import 'colors.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.toDoList();
  final todoController = TextEditingController();
  List<ToDo> foundToDo = [];

  @override
  void initState() {
    foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grey,
        appBar: _appBar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20, top: 30),
                          child: Text('All To Do',
                            style: TextStyle(
                              fontSize: 30,
                              color: black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        for( ToDo todoo in foundToDo)
                          ToDoItem(
                            todo: todoo,
                            changedToDo: _handleToDo,
                            deleteToDo: _deleteToDo,
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20, right:20, left: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: white,
                          boxShadow: const [BoxShadow(color: delete, offset: Offset(0.0, 0.0), blurRadius: 10.0, spreadRadius: 0.0),],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: todoController,
                          decoration: InputDecoration(
                            hintText: 'Add a new to do item',
                            hintStyle: TextStyle(fontSize: 18),
                            border: InputBorder.none,
                          ),
                        ),
                      ),),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      child: Text('+', style: TextStyle(fontSize: 40, color: white),),
                      onPressed: () {
                        _addToDO(todoController.text);
                        print('Add a new todo item');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selected,
                        minimumSize: Size(60, 60),
                        elevation: 0,
                      ),
                    ),
                  )
                ],
              ) ,
            )
          ],
        )
    );
  }

  void _handleToDo(ToDo toDo){
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void _deleteToDo(String id) {
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }

  void _addToDO(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), toDoText: toDo));
    });
    todoController.clear();
  }

  void _filter(String entered) {
    List<ToDo> results = [];
    if(entered.isEmpty) {
      results = todosList;
    }else {
      results = todosList.where((element) => element.toDoText!.toLowerCase().contains(entered.toLowerCase())).toList();
    }
    setState(() {
      foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _filter(value),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: const Icon(Icons.search, size: 20, color: black),
          prefixIconConstraints: const BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color:grey),
        ),

      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
        backgroundColor: grey,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, size: 30, color: black),
            Container(
              height: 40.0,
              width: 40.0,
              child: ClipRRect(
                child: Image.asset('images/avatar.jpeg'),
              ),
            )
          ],
        )
    );
  }
}
