import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/Task.dart';

const CHAVE_TASK_LIST = 'tasks';

class TasksRepository {
  //Chamando SharedPreferences no construtor

//Variável será inicializada apenas no futuro
  late SharedPreferences sharedPreferences;

/*
 * Após fazer encode da lista de task, podemos salvar estes valores no shared preferences.
 * A page chama o saveTaskList para salvar a tarefa que está sendo incluida. 
 */
  void saveTaskList(List<Task> tasks) {
    final String jsonString = json.encode(tasks);
    sharedPreferences.setString(CHAVE_TASK_LIST, jsonString);
  }

  Future<List<Task>> recuperaTaskList() async {
    //sharedPreference tem padrão SINGLETON
    //Fazendo com que só haja UMA instância da classe no projeto inteiro.
    sharedPreferences = await SharedPreferences.getInstance();
    //A primeira vez que se inicia o app, não foi salvo nada, então ele recuperará algo nulo.
    final String jsonString =
        sharedPreferences.getString(CHAVE_TASK_LIST) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Task.fromJson(e)).toList();
  }
}
