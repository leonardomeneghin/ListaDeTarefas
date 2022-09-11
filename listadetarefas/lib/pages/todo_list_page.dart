//******************/
//Home do aplicativo
//******************/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  //1ª Forma para recuperar as informações que o usuário digitou no campo
  List<String> tasks = [];

  final TextEditingController btnTodoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Scaffold não pode deixar de existir.
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            //COLUMN
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex. Estudar Flutter',
                      ),
                      controller: btnTodoController,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String text = btnTodoController.text;
                      setState(() {
                        tasks.add(text);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(181, 0, 158, 179),
                      padding: EdgeInsets.all(15),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                //Separação vertical
                height: 16,
              ),
              Flexible(
                //Permite scroll entre os itens
                child: ListView(
                  shrinkWrap:
                      true, //Faz com que a lista tenha o tamanho exato dos componentes internos
                  children: [
                    for (String task in tasks) TodoListItem(),
                  ],
                ),
              ),
              SizedBox(
                //Separação vertical
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('Você possui 0 tarefas pendentes'),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Limpar tudo'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
