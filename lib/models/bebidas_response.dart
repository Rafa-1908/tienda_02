import 'dart:convert';

import 'package:tienda_02/models/bebidas.dart';

class BebidasResponse {
  BebidasResponse({
    required this.bebidas,
  });

  List<Bebidas> bebidas;

  factory BebidasResponse.fromJson(String str) =>
      BebidasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BebidasResponse.fromMap(Map<String, dynamic> json) => BebidasResponse(
        bebidas:
            List<Bebidas>.from(json["bebidas"].map((x) => Bebidas.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "bebidas": List<dynamic>.from(bebidas.map((x) => x.toMap())),
      };
}
