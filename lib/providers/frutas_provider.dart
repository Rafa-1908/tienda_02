import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:tienda_02/models/frutas.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_02/models/frutas_reponse.dart';

class FrutasProvider extends ChangeNotifier {
  String _baseUrl = '192.168.42.34:3999';

  List<Frutas> listaFrutas = [];

  FrutasProvider() {
    print('Ingresando a FrutasProvider');
    this.getFrutasList();
  }
  getFrutasList() async {
    var url = Uri.http(_baseUrl, '/api/frutas');
    final response = await http.get(url);
    print(response.body);
    final frutasReponse = FrutasResponse.fromJson(response.body);
    listaFrutas = frutasReponse.frutas;
    notifyListeners();
  }

  postsaveFrutas(Frutas frutas) async {
    var url = Uri.http(_baseUrl, '/api/frutas/save');
    print(frutas.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: frutas.toJson());
    print(response);
    getFrutasList();
    notifyListeners();
  }
}
