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
import 'package:altel_group_web/widgets/navigated_button.dart';
import 'package:altel_group_web/widgets/text_container.dart';
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
  final GlobalKey referenceContainerKey = GlobalKey();
  final GlobalKey rangeOfExperticeContainerKey = GlobalKey();
  final GlobalKey cadreContainerKey = GlobalKey();
  final GlobalKey rightsContainerKey = GlobalKey();
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
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            NavigatingButton(
              containerKey: referenceContainerKey,
              navigatingText: "Referencje",
            ),
            NavigatingButton(
              containerKey: rangeOfExperticeContainerKey,
              navigatingText: "Zakres działalności",
            ),
            NavigatingButton(
              containerKey: cadreContainerKey,
              navigatingText: "Kadra",
            ),
            NavigatingButton(
              containerKey: rightsContainerKey,
              navigatingText: "Uprawnienia",
            ),
          ],
        ),
        const Divider(),
        Container(
          key: widget.containerKey,
          child: TextContainer(
            key: referenceContainerKey,
            subtitle: "Referencje",
            txt: "",
          ),
        ),
        TextContainer(
          key: rangeOfExperticeContainerKey,
          subtitle: "Zakres działalności",
          txt: "",
        ),
        TextContainer(
          key: cadreContainerKey,
          subtitle: "Kadra",
          txt: "",
        ),
        TextContainer(
          key: rightsContainerKey,
          subtitle: "Uprawnienia",
          txt: "",
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
