import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/todo.dart';
import 'package:todo/todoItem.dart';

import 'colors.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final todosList = ToDo.toDoList();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    /*return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );*/
    return Scaffold(
        backgroundColor: grey,
        appBar: _appBar(),
        body: Container(
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
                          color: white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    for( ToDo todoo in todosList)
                      ToDoItem(todo: todoo),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
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
