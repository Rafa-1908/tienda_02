import 'package:flutter/material.dart';
import 'package:tienda_02/models/productos_report.dart';
import 'package:tienda_02/providers/productos_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteScreen extends StatefulWidget {
  const ReporteScreen({super.key});

  @override
  State<ReporteScreen> createState() => _ReporteScreenState();
}

class _ReporteScreenState extends State<ReporteScreen> {
  @override
  Widget build(BuildContext context) {
    final productosProvider = Provider.of<ProductosProvider>(context);

    final List<ProductosReport> listaProductosReport =
        productosProvider.listaProductosReport;

    List<charts.Series<ProductosReport, String>> serie = [
      charts.Series(
        id: 'Productos',
        data: listaProductosReport,
        domainFn: (ProductosReport serie, _) => serie.id,
        measureFn: (ProductosReport serie, _) => serie.count,
        colorFn: (ProductosReport serie, _) =>
            charts.ColorUtil.fromDartColor(Colors.blueAccent),
      )
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Reportes')),
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
                  Text('REPORTE DE PRODUCTOS POR CATEGORIA DE PANES'),
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
