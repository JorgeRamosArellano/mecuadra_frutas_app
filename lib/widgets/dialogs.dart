import 'package:flutter/material.dart';
import 'package:me_cuadra_jorge_ramos_app/models/fruit.dart';

class Dialogs {
  static showLoading(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                Text(message),
              ],
            ),
          ),
        ),
      );
  }

  static Future<Fruit?> showInputText(BuildContext context, String title) async {
    String fruitName = '';

    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title),
                TextField(
                  onChanged: (String value) => fruitName = value,
                ),
                TextButton(
                  child: const Text('Aceptar', style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    Navigator.of(context).pop(Fruit(name: fruitName));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
