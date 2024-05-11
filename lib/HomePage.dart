import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Transaction> transactions = [];

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    transactions = await getTransactions();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Column(
        children: <Widget>[
          Image.asset('assets/credit_card.png'),
          Text('Saldo: \$${getCurrentBalance()}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Gastos: \$${getTotalExpenses()}'),
              Text('Ingresos: \$${getTotalIncome()}'),
              Text('Total: \$${getCurrentBalance()}'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  title: Text(transaction.description),
                  subtitle: Text(transaction.date.toString()),
                  trailing: Text(
                    '\$${transaction.amount}',
                    style: TextStyle(
                      color: transaction.isIncome ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  double getCurrentBalance() {
    // Implementa esta función para calcular el saldo actual
    return 0.0; // valor predeterminado
  }

  double getTotalExpenses() {
    // Implementa esta función para calcular el total de gastos
    return 0.0; // valor predeterminado
  }

  double getTotalIncome() {
    // Implementa esta función para calcular el total de ingresos
    return 0.0; // valor predeterminado
  }


  Future<List<Transaction>> getTransactions() {
    // Implementa esta función para obtener las transacciones del usuario
    return Future.value([]); // valor predeterminado
  }
}

class Transaction {
  final String description;
  final double amount;
  final DateTime date;
  final bool isIncome;

  Transaction({
    required this.description,
    required this.amount,
    required this.date,
    required this.isIncome,
  });
}
