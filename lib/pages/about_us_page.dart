// import 'package:flutter/material.dart';

// class AboutUsPage extends StatefulWidget {
//   const AboutUsPage({
//     super.key,
//     required this.containerKey,
//   });
//   final GlobalKey containerKey;
//   @override
//   State<AboutUsPage> createState() => _AboutUsPageState();
// }

// class _AboutUsPageState extends State<AboutUsPage> {
//   @override
//   void initState() {
//     super.initState();
//     // Przewinięcie do konkretnego kontenera po załadowaniu strony
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       scrollTo(widget.containerKey);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Column(
//           children: [
//             Container(
//               color: Colors.green,
//               height: 2000,
//               width: 500,
//             ),
//             Container(
//               key: widget.containerKey,
//               color: Colors.yellow,
//               height: 2000,
//               width: 500,
//               child: const Text("DUPA"),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   void scrollTo(GlobalKey key) {
//     final context = key.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
// }

// *******************************************************************
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({
    super.key,
    required this.containerKey,
  });

  final GlobalKey? containerKey;

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  void initState() {
    super.initState();
    if (widget.containerKey != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollTo(widget.containerKey!);
      });
    }
  }

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
            ),
            Container(
              key: widget.containerKey,
              color: Colors.red,
              height: 2000,
              width: 500,
              child: const Text("DUPA"),
            ),
          ],
        ),
      ],
    );
  }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
