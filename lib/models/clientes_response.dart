import 'dart:convert';

import 'package:tienda_02/models/clientes.dart';

class ClientesResponse {
  ClientesResponse({
    required this.clientes,
  });

  List<Clientes> clientes;

  factory ClientesResponse.fromJson(String str) =>
      ClientesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClientesResponse.fromMap(Map<String, dynamic> json) =>
      ClientesResponse(
        clientes: List<Clientes>.from(
            json["clientes"].map((x) => Clientes.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "clientes": List<dynamic>.from(clientes.map((x) => x.toMap())),
      };
}
