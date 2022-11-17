import 'package:flutter/material.dart';
import 'package:tienda_02/models/proveedores_report.dart';
import 'package:tienda_02/providers/proveedores_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteProveScreen extends StatefulWidget {
  const ReporteProveScreen({super.key});

  @override
  State<ReporteProveScreen> createState() => _ReporteProveScreenState();
}

class _ReporteProveScreenState extends State<ReporteProveScreen> {
  @override
  Widget build(BuildContext context) {
    final proveedoresProvider = Provider.of<ProveedoresProvider>(context);

    final List<ProveedoresReport> listaProveedoresReport =
        proveedoresProvider.listaProveedoresReport;

    List<charts.Series<ProveedoresReport, String>> serie = [
      charts.Series(
        id: 'Proveedores',
        data: listaProveedoresReport,
        domainFn: (ProveedoresReport serie, _) => serie.id,
        measureFn: (ProveedoresReport serie, _) => serie.count,
        colorFn: (ProveedoresReport serie, _) =>
            charts.ColorUtil.fromDartColor(Colors.blueAccent),
      )
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Reportes Proveedores')),
      drawer: MenuLateral(),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('REPORTE DE PROVEEDORES DE INSUMOS'),
                  Expanded(
                      child: charts.BarChart(
                    serie,
                    animate: true,
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
