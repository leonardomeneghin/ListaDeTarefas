//informando função main
import 'package:flutter/material.dart';

void main() {
  //comando runApp para rodar o aplicativo
  runApp(const MyApp()); //app : widget == aplicativo
}

//stless comando | stfull comando
//******************/
//Build do aplicativo : Chamado sempre e em cada reload
//******************/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Aplicativo principal : temas, cultureLocale, localização, etccc
    return MaterialApp(
      home: TodoListPage(),
    );
  }
}

//******************/
//Home do aplicativo
//******************/
class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
