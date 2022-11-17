import 'package:flutter/material.dart';
import 'package:mylittlewallet/data/globals.dart' as globals;
import 'package:mylittlewallet/screens/receita_screen.dart';
import 'package:mylittlewallet/screens/despesa_screen.dart';
import 'package:mylittlewallet/screens/detail_screen.dart';

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

  Color corSaldo = globals.moneyColor;

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
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
          children: [
            // SizedBox como espaço
            const SizedBox(
              height: 15,
            ),
            Container(
              // cor para teste, será aplicada variavel com coloração a partir do saldo
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                color: corSaldo,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // SizedBox como espaço
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Saldo Atual",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  // SizedBox como espaço
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "R\$$allMoney",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox como espaço
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(50.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Receita: R\$$receitaValue",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(type: "receita"),
                        ),
                      );
                    },
                    icon: const Icon(
                        Icons.account_tree,
                        size: 18
                    ),
                    label: const Text("Detalhes"),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.green)
                    ),
                  ),
                  // SizedBox como espaço
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Despesa: R\$$despesaValue",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(type: "despesa"),
                        ),
                      );
                    },
                    icon: const Icon(
                        Icons.account_tree,
                        size: 18
                    ),
                    label: const Text("Detalhes"),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)
                    ),
                  ),
                  // SizedBox como espaço
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              child: Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ReceitaScreen()),
                      );
                    },
                    icon: const Icon(
                        Icons.add_circle,
                        size: 18
                    ),
                    label: const Text("Receita"),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.green)
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DespesaScreen()),
                      );
                    },
                    icon: const Icon(
                        Icons.add_circle,
                        size: 18
                    ),
                    label: const Text("Despesa"),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)
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