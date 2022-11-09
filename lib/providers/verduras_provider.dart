import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:tienda_02/models/verduras.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_02/models/verduras_reponse.dart';

class VerdurasProvider extends ChangeNotifier {
  String _baseUrl = '192.168.42.34:3999';

  List<Verduras> listaVerduras = [];

  VerdurasProvider() {
    print('Ingresando a VerdurasProvider');
    this.getVerdurasList();
  }
  getVerdurasList() async {
    var url = Uri.http(_baseUrl, '/api/verduras');
    final response = await http.get(url);
    print(response.body);
    final verdurasReponse = VerdurasResponse.fromJson(response.body);
    listaVerduras = verdurasReponse.verduras;
    notifyListeners();
  }

  postsaveVerduras(Verduras verduras) async {
    var url = Uri.http(_baseUrl, '/api/bebidas/save');
    print(verduras.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: verduras.toJson());
    print(response);
    getVerdurasList();
    notifyListeners();
  }
}
