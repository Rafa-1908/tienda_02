import 'dart:convert';

import 'package:tienda_02/models/proveedores_report.dart';

class ProveedoresReportResponse {
  ProveedoresReportResponse({
    required this.proveedoresReport,
  });

  List<ProveedoresReport> proveedoresReport;

  factory ProveedoresReportResponse.fromJson(String str) =>
      ProveedoresReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProveedoresReportResponse.fromMap(Map<String, dynamic> json) =>
      ProveedoresReportResponse(
        proveedoresReport: List<ProveedoresReport>.from(
            json["proveedoresReport"].map((x) => ProveedoresReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "proveedoresReport":
            List<dynamic>.from(proveedoresReport.map((x) => x.toMap())),
      };
}
