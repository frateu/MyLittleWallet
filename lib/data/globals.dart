library globals;

import 'package:flutter/material.dart';

class Lancamento {
  String desc;
  double value;

  Lancamento({required this.desc, required this.value});
}

double allReceita  = 0;
double allDespesa  = 0;

Color moneyColor = Colors.black;

List<Lancamento> lancamentosReceita = [];
List<Lancamento> lancamentosDespesa = [];