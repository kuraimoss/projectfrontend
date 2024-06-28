import 'package:flutter/material.dart';
import 'package:kelompok/Activity/dashboard.dart';
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
    return MaterialApp(
        theme: ThemeData.light().copyWith(
          useMaterial3: false,
          colorScheme: ColorScheme.light().copyWith(primary: Color(0xFF107d72)),
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark().copyWith(primary: Color(0xFF107d72)),
        ),
        themeMode: Provider.of<myProv>(context).isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light,
        home: myHome());
  }
}
