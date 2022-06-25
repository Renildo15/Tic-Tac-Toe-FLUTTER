import 'package:flutter/material.dart';
import 'package:jogo_da_velha/models/observer.dart';

class BoardTile implements Observer {
  final int id;
  String symbol;
  Color color;
  bool enable;

  BoardTile(this.id,
      {this.symbol = '', this.color = Colors.black26, this.enable = true});

  @override
  void update(String sym, Color col) {
    symbol = sym;
    color = col;
  }
}
