import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Mi Aplicación'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Acción para seleccionar moneda
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Acción para abrir ventana de búsqueda
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Opciones'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Opcion1'),
              onTap: () {
                // Asegúrate de que la ruta de destino exista en tu gráfico de navegación
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: HomePageBodyContentState(),
    );
  }
}

class HomePageBodyContentState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CreditCard(),
        // Agregamos un Card para los ingresos y gastos
        Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TotalSummaryRow(),
          ),
        ),
      ],
    );
  }
}

class TotalSummaryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TotalColumn(title: 'Ingresos', value: 0.0),
        TotalColumn(title: 'Gastos', value: 0.0),
        TotalColumn(title: 'Total', value: 0.0),
      ],
    );
  }
}

class TotalColumn extends StatelessWidget {
  final String title;
  final double value;

  TotalColumn({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title),
        Text('\$${value.toStringAsFixed(2)}'),
      ],
    );
  }
}

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Tarjeta de Crédito'),
            SizedBox(height: 8.0),
            Text('Saldo Actual: \$0.00'),
          ],
        ),
      ),
    );
  }
}