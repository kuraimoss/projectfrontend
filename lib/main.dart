import 'package:flutter/material.dart';
import 'package:kelompok/Activity/createnewpswd.dart';
import 'package:kelompok/Activity/daftar.dart';
import 'package:kelompok/Activity/dashboard.dart';
import 'package:kelompok/Activity/home.dart';
import 'package:kelompok/Activity/login.dart';
import 'package:kelompok/Activity/resetpw.dart';
import 'package:kelompok/Activity/verify.dart';
import 'package:kelompok/Provider/provider.dart';
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
    return  MaterialApp(
      theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.light(primary: Color(0xFF468a55))),
      home: Myhome()
    );
  }
}
