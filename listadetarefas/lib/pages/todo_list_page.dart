//******************/
//Home do aplicativo
//******************/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Scaffold não pode deixar de existir.
    return Scaffold(
      //Adicionando Center para centralizar (dãa)
      body: Center(
        //Adicionando padding para criar afastamento nas bordas
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Medida',
              hintText: 'exemplo@exemplo.com',
              border: InputBorder.none,
              errorText: null,
              prefixText: 'R\$ ',
              labelStyle: TextStyle(
                fontSize: 20,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
