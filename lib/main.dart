import 'package:flutter/material.dart';
import 'package:grocerygo/Screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GroceryGo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
    );
  }
}
