import 'package:flutter/material.dart';
import 'package:mylittlewallet/data/globals.dart' as globals;

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.type});

  final String type;
  bool shouldPop = true;

  List<Widget> textWidgetList = [];

  @override
  Widget build(BuildContext context) {
    if (type == "receita") {
      for (int i = 0; i < globals.lancamentosReceita.length; i++) {
        String desc = globals.lancamentosReceita[i].desc;
        double value = globals.lancamentosReceita[i].value;

        textWidgetList.add(
          Container(
            padding: const EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Column(children: [
              Text(
                "$desc: R\$$value",
                style: const TextStyle(
                  fontSize: 30,
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
    } else {
      for (int i = 0; i < globals.lancamentosDespesa.length; i++) {
        String desc = globals.lancamentosDespesa[i].desc;
        double value = globals.lancamentosDespesa[i].value;

        textWidgetList.add(
          Container(
            padding: const EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Column(children: [
              Text(
                "$desc: R\$$value",
                style: const TextStyle(
                  fontSize: 30,
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
          child: Column(
            children: textWidgetList,
          ),
        ),
      ),
    );
  }
}
