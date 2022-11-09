import 'dart:convert';

import 'package:tienda_02/models/limpieza.dart';

class LimpiezaResponse {
  LimpiezaResponse({
    required this.limpieza,
  });

  List<Limpieza> limpieza;

  factory LimpiezaResponse.fromJson(String str) =>
      LimpiezaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LimpiezaResponse.fromMap(Map<String, dynamic> json) =>
      LimpiezaResponse(
        limpieza:
            List<Limpieza>.from(json["frutas"].map((x) => Limpieza.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "limpieza": List<dynamic>.from(limpieza.map((x) => x.toMap())),
      };
}
