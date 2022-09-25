import 'package:mylittlewallet/data/globals.dart' as globals;

void addMoney(String value){

  double money = double.parse(value);

  globals.allMoney = globals.allMoney + money;
  globals.allReceita = globals.allReceita + money;

}

void removeMoney(String value){

  double money = double.parse(value);

  globals.allMoney = globals.allMoney - money;
  globals.allDespesa = globals.allDespesa + money;

}