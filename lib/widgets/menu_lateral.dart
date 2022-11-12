import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          const DrawerHeader(
            child: Text('INICIO'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bakerylogo.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: Text('Principal'),
            onTap: () {
              Navigator.pushNamed(context, 'principal');
            },
          ),
          ListTile(
            leading: const Icon(Icons.cookie),
            title: Text('Productos'),
            onTap: (() {
              Navigator.pushNamed(context, 'productos');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.water),
            title: Text('Proveedores'),
            onTap: (() {
              Navigator.pushNamed(context, 'abarrotes');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.apple),
            title: Text('Frutas'),
            onTap: (() {
              Navigator.pushNamed(context, 'frutas');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: Text('Verduras'),
            onTap: (() {
              Navigator.pushNamed(context, 'verduras');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: Text('Limpieza'),
            onTap: (() {
              Navigator.pushNamed(context, 'limpieza');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: Text('Reportes'),
            onTap: (() {
              Navigator.pushNamed(context, 'reportes');
            }),
          ),
        ],
      ),
    );
  }
}
