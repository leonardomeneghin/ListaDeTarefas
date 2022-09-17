// ignore: file_names
import 'dart:convert';

class Task {
  //Pode receber 2 parâmetros
  Task({required this.title, required this.dateTime}); //Construtor da classe

  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        dateTime = DateTime.parse(json['dateTime']); //Convertendo para data

  String title;
  DateTime dateTime;
  //JSON para armazenar dados
  /*
   *Converte um objeto para JSON
   * Salvando String : tipoDinamico
  */
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'dateTime': dateTime
          .toIso8601String(), //Importante para facilitar armazenar dados do tipo data
    };
  }
}
