import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylittlewallet/screens/dashboard_screen.dart';

class DespesaScreen extends StatefulWidget {
  const DespesaScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DespesaScreenState();
  }
}

class _DespesaScreenState extends State<DespesaScreen> {
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
              "Despesa",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: descController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Nome da Despesa",
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
                labelText: "Valor da Despesa",
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
                    const LinearGradient(colors: [Colors.blue, Colors.red]),
              ),
              child: MaterialButton(
                onPressed: () {
                  if (descController.text.isNotEmpty &&
                      valueController.text.isNotEmpty) {
                    cadastrarDespesa();
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

  void cadastrarDespesa() async {
    String? uid = user?.uid;

    // adicionar balanço da conta
    var collectionUsers = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collectionUsers.doc(uid).get();
    Map<String, dynamic>? data = docSnapshot.data();

    String balanceAcc = data!['balance'].toString();
    String despesaAcc = data!['despesa'].toString();

    double balanceDouble = double.parse(balanceAcc);
    double despesaDouble = double.parse(despesaAcc);
    double addDespesa = double.parse(valueController.text);

    double novoValor = balanceDouble - addDespesa;
    double novaDespesa = despesaDouble + addDespesa;

    Map<String, Object?> updateAcc = {
      'balance': novoValor,
      'despesa': novaDespesa
    };

    collectionUsers.doc(uid).update(updateAcc);

    // adicionar lancamentos
    var collectionLancamentos = FirebaseFirestore.instance.collection('lancamentos');

    Map<String, Object?> addLancamento = {
      'descricao': descController.text,
      'id_usuario': uid,
      'tipo_lancamento': 'despesa',
      'valor': valueController.text
    };

    collectionLancamentos.add(addLancamento);
  }
}
