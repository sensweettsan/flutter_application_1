import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/info_model.dart';

Future<InfoModel> getAnimalById(int id) async {
  var caminho = 'adocao-production.up.railway.app';
  final Uri url = Uri.https(caminho, '/api/animals/$id', {'populate': '*'});

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var animal = InfoModel.fromJson(json.decode(response.body)['data']);
    return animal;
  } else {
    throw Exception('Request failed with status: ${response.statusCode}.');
  }
}
