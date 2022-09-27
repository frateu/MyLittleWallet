library globals;

class Lancamento {
  String desc;
  double value;

  Lancamento({required this.desc, required this.value});
}

double allMoney    = 0;
double allReceita  = 0;
double allDespesa  = 0;

List<Lancamento> lancamentosReceita = [];
List<Lancamento> lancamentosDespesa = [];