import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: StartOfThePage(),
    );
  }
}

class StartOfThePage extends StatefulWidget {
  const StartOfThePage({super.key});

  @override
  State<StartOfThePage> createState() => _StartOfThePageState();
}

class _StartOfThePageState extends State<StartOfThePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
