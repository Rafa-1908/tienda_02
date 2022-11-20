import 'dart:convert';

import 'package:tienda_02/models/trabajadores.dart';

class TrabajadoresResponse {
  TrabajadoresResponse({
    required this.trabajadores,
  });

  List<Trabajadores> trabajadores;

  factory TrabajadoresResponse.fromJson(String str) =>
      TrabajadoresResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TrabajadoresResponse.fromMap(Map<String, dynamic> json) =>
      TrabajadoresResponse(
        trabajadores: List<Trabajadores>.from(
            json["trabajadores"].map((x) => Trabajadores.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "trabajadores": List<dynamic>.from(trabajadores.map((x) => x.toMap())),
      };
}
