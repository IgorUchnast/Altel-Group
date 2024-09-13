// import 'package:altel_group_web/routes/routes_name.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey aboutUsContainerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              color: const Color(0xFFD0E2E8),
              height: 2000,
              width: 500,
              // child: FloatingActionButton(
              //   onPressed: () {
              //     context.goNamed(
              //       RouteNames.aboutUs,
              //       extra: aboutUsContainerKey,
              //     );
              //   },
              //   child: const Icon(Icons.arrow_forward),
              // ),
            ),
          ],
        ),
      ],
    );
  }
}
