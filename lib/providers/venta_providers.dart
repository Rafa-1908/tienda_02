import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tienda_02/models/venta.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_02/models/venta_response.dart';

class VentaProvider extends ChangeNotifier {
  String _baseUrl = '192.168.42.80:3999';
  List<Venta> listaVentas = [];

  VentaProvider() {
    print("Ingresando a VentaProvider...");
    this.getVentaList();
  }

  getVentaList() async {
    var url = Uri.http(_baseUrl, '/api/ventas');
    final response = await http.get(url);
    print(response.body);
    final ventaResponse = VentaResponse.fromJson(response.body);
    listaVentas = ventaResponse.ventas;
    notifyListeners();
  }

  postSaveVenta(Venta venta) async {
    var url = Uri.http(_baseUrl, '/api/ventas/save');
    print(venta.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: venta.toJson());
    print(response);
    getVentaList();
    //reportePedido();
    notifyListeners();
  }
}
