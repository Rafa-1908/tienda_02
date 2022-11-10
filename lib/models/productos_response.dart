import 'dart:convert';

import 'package:tienda_02/models/productos.dart';

class ProductosResponse {
  ProductosResponse({
    required this.productos,
  });

  List<Productos> productos;

  factory ProductosResponse.fromJson(String str) =>
      ProductosResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductosResponse.fromMap(Map<String, dynamic> json) =>
      ProductosResponse(
        productos: List<Productos>.from(
            json["productos"].map((x) => Productos.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "bebidas": List<dynamic>.from(productos.map((x) => x.toMap())),
      };
}
