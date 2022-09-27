import 'package:mylittlewallet/data/globals.dart' as globals;

void addMoney(String descMoney, String valueMoney){

  double money = double.parse(valueMoney);

  globals.allMoney = globals.allMoney + money;
  globals.allReceita = globals.allReceita + money;

  globals.lancamentosReceita.add(globals.Lancamento(desc: descMoney, value: money));

}

void removeMoney(String descMoney, String valueMoney){

  double money = double.parse(valueMoney);

  globals.allMoney = globals.allMoney - money;
  globals.allDespesa = globals.allDespesa + money;

  globals.lancamentosDespesa.add(globals.Lancamento(desc: descMoney, value: money));

}