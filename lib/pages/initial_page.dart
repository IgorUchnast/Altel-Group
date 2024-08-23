import 'package:altel_group_web/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("INITIAL PAGE"),
        ),
        body: Center(
          child: FloatingActionButton(
            onPressed: () {
              context.goNamed(RouteNames.aboutUs);
            },
          ),
        ),
      ),
    );
  }
}
