import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylittlewallet/screens/dashboard_screen.dart';

class ReceitaScreen extends StatefulWidget {
  ReceitaScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReceitaScreenState();
  }
}

class _ReceitaScreenState extends State<ReceitaScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final descController = TextEditingController();
  final valueController = TextEditingController();
  bool shouldPop = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
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
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          alignment: Alignment.center,
          child: Column(children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Receita",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: descController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Nome da Receita",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.abc),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: valueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Valor da Receita",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.add_chart),
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient:
                    const LinearGradient(colors: [Colors.blue, Colors.green]),
              ),
              child: MaterialButton(
                onPressed: () {
                  if (descController.text.isNotEmpty &&
                      valueController.text.isNotEmpty) {
                    cadastrarReceita();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                      return const DashboardScreen();
                    }), (r){
                      return false;
                    });
                  }
                },
                child: const Text(
                  "Confirmar",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void cadastrarReceita() async {
    String? uid = user?.uid;

    // adicionar balanço da conta
    var collectionUsers = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collectionUsers.doc(uid).get();
    Map<String, dynamic>? data = docSnapshot.data();

    String balanceAcc = data!['balance'].toString();
    String receitaAcc = data!['receita'].toString();

    double balanceDouble = double.parse(balanceAcc);
    double receitaDouble = double.parse(receitaAcc);
    double addReceita = double.parse(valueController.text);

    double novoValor = balanceDouble + addReceita;
    double novaReceita = receitaDouble + addReceita;

    Map<String, Object?> updateAcc = {
      'balance': novoValor,
      'receita': novaReceita
    };

    collectionUsers.doc(uid).update(updateAcc);

    // adicionar lancamentos
    var collectionLancamentos = FirebaseFirestore.instance.collection('lancamentos');

    Map<String, Object?> addLancamento = {
      'descricao': descController.text,
      'id_usuario': uid,
      'tipo_lancamento': 'receita',
      'valor': valueController.text
    };

    collectionLancamentos.add(addLancamento);
  }
}
