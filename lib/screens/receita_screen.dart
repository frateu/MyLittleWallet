import 'package:flutter/material.dart';
import 'package:mylittlewallet/screens/dashboard_screen.dart';
import 'package:mylittlewallet/functions/money.dart';

class ReceitaScreen extends StatefulWidget {
  const ReceitaScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReceitaScreenState();
  }
}

class _ReceitaScreenState extends State<ReceitaScreen> {

  final descController   = TextEditingController();
  final valueController  = TextEditingController();
  bool shouldPop = true;

  @override
  Widget build(BuildContext context){
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
      body:
      Container(
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
            children: [
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
                  gradient: const LinearGradient(colors: [Colors.blue, Colors.green]),
                ),
                child: MaterialButton(
                  onPressed: (){
                    if (descController.text.isNotEmpty && valueController.text.isNotEmpty) {
                      addMoney(descController.text, valueController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DashboardScreen()),
                      );
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
            ]
        ),
      ),
    ),
    );
  }
}