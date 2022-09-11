import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //Arredonda a borda no decoration atribute
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, //Alinhamento cruzado no inicio.
        children: [
          Text(
            '10/10/2022',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            'Tarefa 123',
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
