import 'package:flutter/material.dart';
import 'package:login/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormScreen(),
    );
  }
}