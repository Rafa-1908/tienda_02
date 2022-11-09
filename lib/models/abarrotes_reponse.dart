import 'dart:convert';

import 'package:tienda_02/models/abarrotes.dart';

class AbarrotesResponse {
  AbarrotesResponse({
    required this.abarrotes,
  });

  List<Abarrotes> abarrotes;

  factory AbarrotesResponse.fromJson(String str) =>
      AbarrotesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AbarrotesResponse.fromMap(Map<String, dynamic> json) =>
      AbarrotesResponse(
        abarrotes: List<Abarrotes>.from(
            json["bebidas"].map((x) => Abarrotes.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "abarrotes": List<dynamic>.from(abarrotes.map((x) => x.toMap())),
      };
}
