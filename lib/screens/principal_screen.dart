import 'package:flutter/material.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PORTADA',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
      drawer: const MenuLateral(),
      body: (
          //child: Text('BIENVENIDO A LA TIENDITA DE DON PIERO'),
          Container(
        child: Image.asset('assets/Tiendita_01.jpg'),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 181, 203, 213),
            border: Border.all(color: Colors.black, width: 4),
            borderRadius: BorderRadius.circular(20)),
      )),
    );
  }
}
