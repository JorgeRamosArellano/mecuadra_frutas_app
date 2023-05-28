import 'package:flutter/material.dart';
import 'package:me_cuadra_jorge_ramos_app/models/fruit.dart';
import 'package:me_cuadra_jorge_ramos_app/widgets/fruit_card.dart';
import 'package:provider/provider.dart';

import '../handlers/fruit_handler.dart';
import '../providers/fruit_provider.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FruitHandler.initHandler(context);
    final fruitProvider = Provider.of<FruitProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit App', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        // backgroundColor: Color.fromARGB(255, 241, 255, 47),
        elevation: 1,
      ),
      body: FutureBuilder(
        future: fruitProvider.getFruits(),
        builder: (context, snapshot) {
          
          if(!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          
          List<Fruit> fruitList = fruitProvider.fruits.reversed.toList();
          
          if(fruitList.isEmpty){
            return const Center(
              child: Text('Aún no tiene frutas agregadas.'),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            padding: const EdgeInsets.all(10),
            itemCount: fruitList.length,
            itemBuilder:(context, index) => FruitCard(
              fruit: fruitList[index],
              onPressEdit: () => FruitHandler.onEdit(context, fruitList[index].id!),
              onPressDelete: () => FruitHandler.onDelete(context, fruitList[index].id!),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Color.fromARGB(255, 241, 255, 47),
        onPressed: () => FruitHandler.insert(context),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
