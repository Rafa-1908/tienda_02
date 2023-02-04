import 'dart:convert';

import 'package:tienda_02/models/venta.dart';

class VentaResponse {
  VentaResponse({
    required this.ventas,
  });

  List<Venta> ventas;

  factory VentaResponse.fromJson(String str) =>
      VentaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VentaResponse.fromMap(Map<String, dynamic> json) => VentaResponse(
        ventas: List<Venta>.from(json["ventas"].map((x) => Venta.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "ventas": List<dynamic>.from(ventas.map((x) => x.toMap())),
      };
}
