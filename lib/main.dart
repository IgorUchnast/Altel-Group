// import 'package:altel_group_web/pages/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:altel_group_web/routes/routes_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteConfig.returnRouter(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const InitialPage(),
    );
  }
}
