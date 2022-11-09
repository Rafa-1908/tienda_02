import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:tienda_02/models/limpieza.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_02/models/limpieza_reponse.dart';

class LimpiezaProvider extends ChangeNotifier {
  String _baseUrl = '192.168.42.34:3999';

  List<Limpieza> listaLimpieza = [];

  LimpiezaProvider() {
    print('Ingresando a LimpiezaProvider');
    this.getLimpiezaList();
  }
  getLimpiezaList() async {
    var url = Uri.http(_baseUrl, '/api/limpieza');
    final response = await http.get(url);
    print(response.body);
    final limpiezaReponse = LimpiezaResponse.fromJson(response.body);
    listaLimpieza = limpiezaReponse.limpieza;
    notifyListeners();
  }

  postsaveLimpieza(Limpieza limpieza) async {
    var url = Uri.http(_baseUrl, '/api/limpieza/save');
    print(limpieza.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: limpieza.toJson());
    print(response);
    getLimpiezaList();
    notifyListeners();
  }
}
