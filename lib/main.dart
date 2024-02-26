import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/colors.dart';
import 'package:todo/todo.dart';
import 'package:todo/todoItem.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'To Do App',
      home: Home(),
    );
  }
}
