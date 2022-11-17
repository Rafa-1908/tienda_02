import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tienda_02/models/proveedores.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_02/models/proveedores_report.dart';
import 'package:tienda_02/models/proveedores_report_response.dart';
import 'package:tienda_02/models/proveedores_reponse.dart';

class ProveedoresProvider extends ChangeNotifier {
  String _baseUrl = '192.168.42.80:3999';

  List<Proveedores> listaProveedores = [];
  List<ProveedoresReport> listaProveedoresReport = [];

  ProveedoresProvider() {
    print('Ingresando a ProveedoresProvider');
    this.getProveedoresList();
    this.reporteProveedores();
  }
  getProveedoresList() async {
    var url = Uri.http(_baseUrl, '/api/proveedores');
    final response = await http.get(url);
    print(response.body);
    final proveedoresReponse = ProveedoresResponse.fromJson(response.body);
    listaProveedores = proveedoresReponse.proveedores;
    notifyListeners();
  }

  postsaveProveedores(Proveedores proveedores) async {
    var url = Uri.http(_baseUrl, '/api/proveedores/save');
    print(proveedores.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: proveedores.toJson());
    print(response);
    getProveedoresList();
    reporteProveedores();
    notifyListeners();
  }

  reporteProveedores() async {
    var url = Uri.http(_baseUrl, '/api/reportes/proveedoresReport');
    final response = await http.get(url);
    print(response.body);
    final proveedoresReportResponse =
        ProveedoresReportResponse.fromJson(response.body);
    listaProveedoresReport = proveedoresReportResponse.proveedoresReport;
    notifyListeners();
  }
}
