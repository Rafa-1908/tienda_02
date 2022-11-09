import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:tienda_02/models/abarrotes.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_02/models/abarrotes_reponse.dart';

class AbarrotesProvider extends ChangeNotifier {
  String _baseUrl = '192.168.42.34:3999';

  List<Abarrotes> listaAbarrotes = [];

  AbarrotesProvider() {
    print('Ingresando a AbarrotesProvider');
    this.getAbarrotesList();
  }
  getAbarrotesList() async {
    var url = Uri.http(_baseUrl, '/api/abarrotes');
    final response = await http.get(url);
    print(response.body);
    final abarrotesReponse = AbarrotesResponse.fromJson(response.body);
    listaAbarrotes = abarrotesReponse.abarrotes;
    notifyListeners();
  }

  postsaveBebidas(Abarrotes abarrotes) async {
    var url = Uri.http(_baseUrl, '/api/abarrotes/save');
    print(abarrotes.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: abarrotes.toJson());
    print(response);
    getAbarrotesList();
    notifyListeners();
  }
}
