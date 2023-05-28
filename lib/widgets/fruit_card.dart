import 'package:flutter/material.dart';
import 'package:me_cuadra_jorge_ramos_app/models/fruit.dart';

// ignore: must_be_immutable
class FruitCard extends StatelessWidget {
  final Fruit fruit;
  final Function() onPressEdit;
  final Function() onPressDelete;
  const FruitCard({super.key, required this.fruit, required this.onPressDelete, required this.onPressEdit});

  @override
  Widget build(BuildContext context) {

    return AnimatedOpacity(
      duration: const Duration(seconds: 2),
      opacity:1,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        fruit.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        fruit.id.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 255, 228),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: onPressEdit,
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear, color: Colors.red),
                        onPressed: onPressDelete,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
