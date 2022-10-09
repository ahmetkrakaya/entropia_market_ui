import 'package:entropia_market_ui/core/color_scheme.dart';
import 'package:entropia_market_ui/app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entropia Market UI Screen',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blue.shade900,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: const TextStyle(fontSize: 18,color: colorSheme.darkBlue),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(24),right: Radius.circular(24)),
          ),
        ),
        primaryColor: colorSheme.darkBlue
      ),
      home: const LoginPage(),
    );
  }
}