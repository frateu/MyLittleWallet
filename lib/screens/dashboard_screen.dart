import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:mylittlewallet/screens/login_screen.dart';
import 'package:mylittlewallet/screens/receita_screen.dart';
import 'package:mylittlewallet/screens/despesa_screen.dart';
import 'package:mylittlewallet/screens/detail_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  final user = FirebaseAuth.instance.currentUser;

  String allMoney = '0.0';
  String receitaValue = '0.0';
  String despesaValue = '0.0';

  Color corSaldo = Colors.black;

  Future getBalance() async {
    String? uid = user?.uid;

    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(uid).get();
    Map<String, dynamic>? data = docSnapshot.data();

    String balanceAcc = data!['balance'].toString();

    if (double.parse(balanceAcc) >= 0) {
      setState(() {
        allMoney = data['balance'].toString();
        receitaValue = data['receita'].toString();
        despesaValue = data['despesa'].toString();
        corSaldo = Colors.green;
      });
    } else {
      setState(() {
        allMoney = data['balance'].toString();
        receitaValue = data['receita'].toString();
        despesaValue = data['despesa'].toString();
        corSaldo = Colors.red;
      });
    }
  }

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
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            singOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.exit_to_app,
            size: 45,
            color: Colors.black,
          ),
          alignment: Alignment.centerRight,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
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
                  Expanded(
                    child: FutureBuilder(
                        future: getBalance(),
                        builder: (context, snapshot) {
                          return Text(
                            "R\$$allMoney",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(50.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Receita: R\$$receitaValue",
                    style: const TextStyle(
                      fontSize: 25,
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
                    icon: const Icon(Icons.account_tree, size: 18),
                    label: const Text("Detalhes"),
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.green)),
                  ),
                  // SizedBox como espaço
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Despesa: R\$$despesaValue",
                    style: const TextStyle(
                      fontSize: 25,
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
                    icon: const Icon(Icons.account_tree, size: 18),
                    label: const Text("Detalhes"),
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.red)),
                  ),
                  // SizedBox como espaço
                  const SizedBox(
                    height: 10,
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
                        MaterialPageRoute(
                            builder: (context) => ReceitaScreen()),
                      );
                    },
                    icon: const Icon(Icons.add_circle, size: 18),
                    label: const Text("Receita"),
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.green)),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DespesaScreen()),
                      );
                    },
                    icon: const Icon(Icons.add_circle, size: 18),
                    label: const Text("Despesa"),
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.red)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future singOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
