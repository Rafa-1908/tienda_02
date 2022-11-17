import 'dart:convert';

import 'package:tienda_02/models/proveedores.dart';

class ProveedoresResponse {
  ProveedoresResponse({
    required this.proveedores,
  });

  List<Proveedores> proveedores;

  factory ProveedoresResponse.fromJson(String str) =>
      ProveedoresResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProveedoresResponse.fromMap(Map<String, dynamic> json) =>
      ProveedoresResponse(
        proveedores: List<Proveedores>.from(
            json["proveedores"].map((x) => Proveedores.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "proveedores": List<dynamic>.from(proveedores.map((x) => x.toMap())),
      };
}
