//******************/
//Home do aplicativo
//******************/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});
  //1ª Forma para recuperar as informações que o usuário digitou no campo
  //Precisa vincular a controller no parâmetro controller: do widget que queremos o txt.

  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Scaffold não pode deixar de existir.
    return Scaffold(
      //Adicionando Center para centralizar (dãa)
      body: Center(
        //Adicionando padding para criar afastamento nas bordas
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: emailController, //Vinculo com o controller
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.purple,
                ),
              ),
              ElevatedButton(
                onPressed: login,
                child: Text('Entrar'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    String text = emailController.text;
    print(text);
  }
}
