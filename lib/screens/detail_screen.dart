import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.type});

  final String type;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool shouldPop = true;

  final user = FirebaseAuth.instance.currentUser;

  List<Map<String, dynamic>> lancamentosMap = [];
  List<Widget> textWidgetList = [];

  // Future getLancamentos() async {
  //   await FirebaseFirestore.instance.collection('lancamentos').get().then(
  //           (snapshot) => snapshot.docs.forEach((element) {
  //             lancamentosMap.add(element.reference);
  //           }));
  // }

  void getLancamentos() async {
    var collectionLancamentos =
        FirebaseFirestore.instance.collection('lancamentos');
    var docsSnapshot = await collectionLancamentos.get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>>? docs = docsSnapshot.docs;

    for (var element in docs) {
      setState(() {
        lancamentosMap.add(element.data());
      });
    }
  }

  @override
  void initState() {
    getLancamentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == "receita") {
      for (var lancamento in lancamentosMap) {
        String? uid = user?.uid;
        String desc = '';
        String value = '';

        if (lancamento['id_usuario'] == uid &&
            lancamento['tipo_lancamento'] == 'receita') {
          desc = lancamento['descricao'].toString();
          value = lancamento['valor'].toString();

          textWidgetList.add(
            Container(
              padding: const EdgeInsets.all(25),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(children: [
                Text(
                  "$desc: R\$$value",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
              ]),
            ),
          );
        }
      }
    } else {
      for (var lancamento in lancamentosMap) {
        String? uid = user?.uid;
        String desc = '';
        String value = '';

        if (lancamento['id_usuario'] == uid &&
            lancamento['tipo_lancamento'] == 'despesa') {
          desc = lancamento['descricao'].toString();
          value = lancamento['valor'].toString();

          textWidgetList.add(
            Container(
              padding: const EdgeInsets.all(25),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(children: [
                Text(
                  "$desc: R\$$value",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
              ]),
            ),
          );
        }
      }
    }

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: textWidgetList,
          ),
        ),
      ),
    );
  }
}
