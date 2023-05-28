// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/fruit.dart';
import '../providers/fruit_provider.dart';
import '../widgets/dialogs.dart';

class FruitHandler {
  static FruitProvider? _fruitProvider;
  double opacity = 1.0; 

  static initHandler(BuildContext context) {
    if (_fruitProvider != null) return;
    _fruitProvider = Provider.of<FruitProvider>(context, listen: false);
  }

  static insert(BuildContext context) async {
    final Fruit? newFruit = await Dialogs.showInputText(context, 'Agrega una fruta');
    if(newFruit == null) return;
    Dialogs.showLoading(context, 'Agregando...');
    await Future.delayed(const Duration(seconds: 1));
    await _fruitProvider!.insertFruit(newFruit.toJson());
    Navigator.pop(context);
  }

  static onDelete(BuildContext context, int fruitId) async {
    Dialogs.showLoading(context, 'Eliminando...');
    await Future.delayed(const Duration(seconds: 1));
    await _fruitProvider!.onDelete(fruitId);
    Navigator.of(context).pop();
  }

  static onEdit(BuildContext context, int fruitId) async {
    final Fruit? fruitEdited = await Dialogs.showInputText(context, 'Editar fruta');
    if(fruitEdited == null) return;
    fruitEdited.id = fruitId;
    Dialogs.showLoading(context, 'Actualizando...');
    await Future.delayed(const Duration(seconds: 1));
    await _fruitProvider!.onEdit(fruitEdited.toJson());
    Navigator.of(context).pop();
  }
}
