import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../models/Task.dart';

class TodoListItem extends StatelessWidget {
  //Não se pode colocar o tipo de uma model no construtor.

  const TodoListItem({
    super.key,
    required this.task,
    required this.onDelete,
  });
  //Passamos a função por parâmetro

  final Task task;
  final Function(Task) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      //Padding agora está por fora do container, criando espaçamento por fora.
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              //task ja existe, usaremos a atribuição dela para enviar o delete na função
              onPressed: onDelete(task),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Deletar',
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            //Arredonda a borda no decoration atribute
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            //Alinhamento cruzado no inicio.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //Evita bug de espaçamento errado entre botão e Container
            children: [
              Text(
                //Formatação da data e hora
                DateFormat('dd/MM/yyyy - HH:mm').format(task.dateTime),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                task.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
