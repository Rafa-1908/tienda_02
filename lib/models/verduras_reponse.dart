import 'dart:convert';

import 'package:tienda_02/models/verduras.dart';

class VerdurasResponse {
  VerdurasResponse({
    required this.verduras,
  });

  List<Verduras> verduras;

  factory VerdurasResponse.fromJson(String str) =>
      VerdurasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VerdurasResponse.fromMap(Map<String, dynamic> json) =>
      VerdurasResponse(
        verduras: List<Verduras>.from(
            json[" verduras"].map((x) => Verduras.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        " verduras": List<dynamic>.from(verduras.map((x) => x.toMap())),
      };
}
