library globals;

import 'dart:ui';

import 'package:flutter/material.dart';

class Lancamento {
  String desc;
  double value;

  Lancamento({required this.desc, required this.value});
}

double allMoney    = 0;
double allReceita  = 0;
double allDespesa  = 0;

Color moneyColor = Colors.black;

List<Lancamento> lancamentosReceita = [];
List<Lancamento> lancamentosDespesa = [];