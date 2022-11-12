import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tienda_02/models/productos.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_02/models/productos_report.dart';
import 'package:tienda_02/models/productos_report_response.dart';
import 'package:tienda_02/models/productos_response.dart';

class ProductosProvider extends ChangeNotifier {
  String _baseUrl = '192.168.42.34:3999';

  List<Productos> listaProductos = [];
  List<ProductosReport> listaProductosReport = [];

  ProductosProvider() {
    print('Ingresando a ProductosProvider');
    this.getProductosList();
    this.reporteProductos();
  }
  getProductosList() async {
    var url = Uri.http(_baseUrl, '/api/productos');
    final response = await http.get(url);
    print(response.body);
    final productosReponse = ProductosResponse.fromJson(response.body);
    listaProductos = productosReponse.productos;
    notifyListeners();
  }

  postsaveProductos(Productos productos) async {
    var url = Uri.http(_baseUrl, '/api/productos/save');
    print(productos.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: productos.toJson());
    print(response);
    getProductosList();
    reporteProductos();
    notifyListeners();
  }

  reporteProductos() async {
    var url = Uri.http(_baseUrl, '/api/reportes/productosReport');
    final response = await http.get(url);
    print(response.body);
    final productosReportResponse =
        ProductosReportResponse.fromJson(response.body);
    listaProductosReport = productosReportResponse.productosReport;
    notifyListeners();
  }
}
