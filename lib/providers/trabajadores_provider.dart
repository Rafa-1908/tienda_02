import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tienda_02/models/trabajadores.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_02/models/trabajadores_report.dart';
import 'package:tienda_02/models/trabajadores_report_response.dart';
import 'package:tienda_02/models/trabajadores_reponse.dart';

class TrabajadoresProvider extends ChangeNotifier {
  String _baseUrl = '192.168.42.80:3999';

  List<Trabajadores> listaTrabajadores = [];
  List<TrabajadoresReport> listaTrabajadoresReport = [];

  TrabajadoresProvider() {
    print('Ingresando a TrabajadoresProvider');
    this.getTrabajadoresList();
    this.reporteTrabajadores();
  }
  getTrabajadoresList() async {
    var url = Uri.http(_baseUrl, '/api/trabajadores');
    final response = await http.get(url);
    print(response.body);
    final trabajadoresReponse = TrabajadoresResponse.fromJson(response.body);
    listaTrabajadores = trabajadoresReponse.trabajadores;
    notifyListeners();
  }

  postsaveTrabajadores(Trabajadores trabajadores) async {
    var url = Uri.http(_baseUrl, '/api/proveedores/save');
    print(trabajadores.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: trabajadores.toJson());
    print(response);
    getTrabajadoresList();
    reporteTrabajadores();
    notifyListeners();
  }

  reporteTrabajadores() async {
    var url = Uri.http(_baseUrl, '/api/reportes/trabajadoresReport');
    final response = await http.get(url);
    print(response.body);
    final trabajadoresReportResponse =
        TrabajadoresReportResponse.fromJson(response.body);
    listaTrabajadoresReport = trabajadoresReportResponse.trabajadoresReport;
    notifyListeners();
  }
}
