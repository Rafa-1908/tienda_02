import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/providers/abarrotes_provider.dart';
import 'package:tienda_02/providers/productos_provider.dart';
import 'package:tienda_02/providers/frutas_provider.dart';
import 'package:tienda_02/providers/limpieza_provider.dart';
import 'package:tienda_02/providers/verduras_provider.dart';
import 'package:tienda_02/screens/abarrotes_form_screen.dart';
import 'package:tienda_02/screens/abarrotes_screen.dart';
import 'package:tienda_02/screens/productos_screen.dart';
import 'package:tienda_02/screens/productos_form_screen.dart';
import 'package:tienda_02/screens/frutas_screen.dart';
import 'package:tienda_02/screens/frutas_form_screen.dart';
import 'package:tienda_02/screens/verduras_screen.dart';
import 'package:tienda_02/screens/verduras_form_screen.dart';
import 'package:tienda_02/screens/limpieza_screen.dart';
import 'package:tienda_02/screens/limpieza_form_screen.dart';
import 'package:tienda_02/screens/principal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*return */

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductosProvider()),
          ChangeNotifierProvider(create: (_) => LimpiezaProvider()),
          ChangeNotifierProvider(create: (_) => FrutasProvider()),
          ChangeNotifierProvider(create: (_) => AbarrotesProvider()),
          ChangeNotifierProvider(create: (_) => VerdurasProvider()),
        ],
        child: MaterialApp(
          title: 'TIENDITA DE DON PIERO',
          debugShowCheckedModeBanner: false,
          initialRoute: 'principal',
          routes: {
            'principal': (_) => const PrincipalScreen(),
            'abarrotes': (_) => const AbarrotesScreen(),
            'abarrotes_form': (_) => const AbarrotesFormScreen(),
            'bebidas': (_) => const ProductosScreen(),
            'bebidas_form': (_) => const ProductosFormScreen(),
            'frutas': (_) => const FrutasScreen(),
            'frutas_form': (_) => const FrutasFormScreen(),
            'limpieza': (_) => const LimpiezaScreen(),
            'limpieza_form': (_) => const LimpiezaFormScreen(),
            'verduras': (_) => const VerdurasScreen(),
            'verduras_form': (_) => const VerdurasFormScreen(),
          },
        ));
  }
}
