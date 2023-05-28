import 'package:flutter/material.dart';
import 'package:me_cuadra_jorge_ramos_app/pages/home_page.dart';
import 'package:me_cuadra_jorge_ramos_app/providers/fruit_provider.dart';
import 'package:me_cuadra_jorge_ramos_app/services/sqlite/sqldb.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlDB.initDB();
  runApp(const MyAppState());
}

class MyAppState extends StatelessWidget {
  const MyAppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FruitProvider() ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Me cuadra app',
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}
