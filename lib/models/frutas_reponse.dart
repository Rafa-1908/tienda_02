import 'dart:convert';

import 'package:tienda_02/models/frutas.dart';

class FrutasResponse {
  FrutasResponse({
    required this.frutas,
  });

  List<Frutas> frutas;

  factory FrutasResponse.fromJson(String str) =>
      FrutasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FrutasResponse.fromMap(Map<String, dynamic> json) => FrutasResponse(
        frutas: List<Frutas>.from(json["frutas"].map((x) => Frutas.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "frutas": List<dynamic>.from(frutas.map((x) => x.toMap())),
      };
}
