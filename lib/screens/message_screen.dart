import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylittlewallet/screens/login_screen.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Finance-Wallet-icon.png',
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  const Text(
                    "MyLittleWallet",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w300,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Usuario cadastrado com sucesso!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.green]),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        registerBalance();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "IR PARA LOGIN",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void registerBalance() {
    var user = FirebaseAuth.instance.currentUser;
    String? uid = user?.uid;
    var collection = FirebaseFirestore.instance.collection('users');

    Map<String, Object?> dadosBancarios = {
      'balance': 0.0,
      'receita': 0.0,
      'despesa': 0.0
    };

    collection.doc(uid).set(dadosBancarios);
  }
}
