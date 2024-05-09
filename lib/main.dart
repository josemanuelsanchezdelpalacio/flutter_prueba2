import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _loginController = TextEditingController();
  final _registerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: 'Iniciar sesión',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //inicio sesion firebase
              },
              child: Text('Iniciar sesión'),
            ),
            TextField(
              controller: _registerController,
              decoration: InputDecoration(
                labelText: 'Registrarse',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //registro firebase
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
