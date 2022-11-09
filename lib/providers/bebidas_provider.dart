import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:tienda_02/models/bebidas.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_02/models/bebidas_response.dart';

class BebidasProvider extends ChangeNotifier {
  String _baseUrl = '192.168.42.34:3999';

  List<Bebidas> listaBebidas = [];

  BebidasProvider() {
    print('Ingresando a BebidasProvider');
    this.getBebidasList();
  }
  getBebidasList() async {
    var url = Uri.http(_baseUrl, '/api/bebidas');
    final response = await http.get(url);
    print(response.body);
    final bebidasReponse = BebidasResponse.fromJson(response.body);
    listaBebidas = bebidasReponse.bebidas;
    notifyListeners();
  }

  postsaveBebidas(Bebidas bebidas) async {
    var url = Uri.http(_baseUrl, '/api/bebidas/save');
    print(bebidas.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: bebidas.toJson());
    print(response);
    getBebidasList();
    notifyListeners();
  }
}
