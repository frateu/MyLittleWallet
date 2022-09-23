import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {

  var moneyController = TextEditingController();

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
              TextFormField(
                controller: moneyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Money Test",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monetization_on),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused))
                          return Colors.red;
                        return null; // Defer to the widget's default.
                      }
                  ),
                ),
                onPressed: () {

                },
                child: Text('Make it rain'),
              )
            ]
        ),
      ),
    );
  }
}