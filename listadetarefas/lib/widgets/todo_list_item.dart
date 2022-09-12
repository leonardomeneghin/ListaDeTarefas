import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Task.dart';

class TodoListItem extends StatelessWidget {
  //Não se pode colocar o tipo de uma model no construtor.

  const TodoListItem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //Arredonda a borda no decoration atribute
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(16),
      //Espaçamento fora do container
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, //Alinhamento cruzado no inicio.
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
    );
  }
}
