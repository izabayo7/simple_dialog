import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SimpleDialogDemo());
}

class SimpleDialogDemo extends StatelessWidget {
  const SimpleDialogDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleDialog Widget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
