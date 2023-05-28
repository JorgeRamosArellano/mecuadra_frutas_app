import 'package:flutter/foundation.dart';
import 'package:me_cuadra_jorge_ramos_app/models/fruit.dart';
import 'package:me_cuadra_jorge_ramos_app/services/sqlite/sqldb.dart';

class FruitProvider extends ChangeNotifier {
  List<Fruit> fruits = [];

  Future<bool> onEdit(Map<String, dynamic> data) async {
    final result = await SqlDB.updateFruit(data: data);
    notifyListeners();
    return result;
  }

  Future<bool> onDelete(int fruitId) async {
    final result = await SqlDB.deleteFruit(id: fruitId);
    notifyListeners();
    return result;
  }

  Future<List<Fruit>> getFruits() async {
    final fruitsMap = await SqlDB.getFruits();
    fruits = fruitsMap.map((e) => Fruit.fromJson(e)).toList();
    // notifyListeners();
    return fruits;
  }

  Future<bool> insertFruit(Map<String, dynamic> newFruit) async {
    final result = await SqlDB.insertFruit(newFruit);
    notifyListeners();
    return result;
  }
}
