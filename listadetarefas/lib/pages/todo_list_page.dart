//******************/
//Home do aplicativo
//******************/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listadetarefas/models/Task.dart';

import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  //1ª Forma para recuperar as informações que o usuário digitou no campo
  List<Task> tasks = [];
  Task? deletedTask;
  int? deletedTodoPos;

  final TextEditingController btnTodoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Scaffold não pode deixar de existir.
    return SafeArea(
      //A tela fica na área segura do dispositivo (sem as bordinha)
      child: Scaffold(
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
                      //Permite que filhos preencham
                      // de forma flexivel o espaço existente,
                      //evitando overflow de pixels de acordo com um alinhamento.
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
                          Task novaTask = Task(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          tasks.add(novaTask);
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
                    //Faz com que a lista tenha o tamanho exato dos componentes internos
                    shrinkWrap: true,
                    children: [
                      for (Task task in tasks)
                        TodoListItem(
                          //Importante passar o objeto inteiro para o TodoListItem objeto.
                          //Assim, ele terá o acesso à todos os itens.
                          task: task,
                          onDelete: onDelete,
                        ),
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
                      child:
                          Text('Você possui ${tasks.length} tarefas pendentes'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: showDeleteTasksConfirmationDialog,
                      child: Text('Limpar tudo'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Vamos fazer todo_list_item.dart enviar uma operação delete para
  //a lista da todo_list_page.dart
  //callback será usado
  void onDelete(Task task) {
    deletedTask = task;
    deletedTodoPos = tasks.indexOf(task);
    setState(() {
      tasks.remove(task);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${task.title} foi removida com sucesso',
          style: TextStyle(
            color: Color(0xff060708),
          ),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'desfazer',
          textColor: const Color(0x4400d7f3),
          onPressed: () {
            //! Garante que eles não são nulos
            setState(() {
              //insere na posição indicada a task inicialmente deletada.
              tasks.insert(deletedTodoPos!, deletedTask!);
            });
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  //Função de confirmação da deleção com deleção de todos os itens.
  void showDeleteTasksConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Deseja limpar tudo?"),
        content: Text("Tem certeza que deseja apagar TODAS as tarefas?"),
        actions: [
          TextButton(
            onPressed: () {
              //Fechar dialogo com Navigator
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Color(0xff99d7f3),
            ),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTasks();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: Text('Limpar tudo'),
          ),
        ],
      ),
    );
  }

  void deleteAllTasks() {
    setState(() {
      tasks.clear();
    });
  }
}
