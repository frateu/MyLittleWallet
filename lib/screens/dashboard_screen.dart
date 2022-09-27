import 'package:flutter/material.dart';
import 'package:mylittlewallet/data/globals.dart' as globals;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {

  var moneyController = TextEditingController();

  String allMoney      = globals.allMoney.toString();
  String receitaValue  = globals.allReceita.toString();
  String despesaValue  = globals.allDespesa.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyLittleWallet',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_balance_wallet,
            size: 45,
            color: Colors.black,
          ),
        ),
      ),
      body:
      Container(
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Saldo Atual",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.teal,
              ),
            ),
            Text(
              "R\$$allMoney",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.teal,
              ),
            ),
            const SizedBox(
              height: 105,
            ),
            Container(
              padding: const EdgeInsets.all(50.0),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Text(
                    "Receita: R\$$receitaValue",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Despesa: R\$$despesaValue",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                    },
                    icon: const Icon(
                        Icons.add_circle,
                        size: 18
                    ),
                    label: Text("Receita"),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                    },
                    icon: const Icon(
                        Icons.add_circle,
                        size: 18
                    ),
                    label: Text("Despesa"),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}