import 'package:flutter/material.dart';
import 'package:project/Activity/home.dart';
import 'package:project/Provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => myProv())],
      child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: myHome(),
    );
  }
}
