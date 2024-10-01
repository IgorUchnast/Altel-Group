import 'package:altel_group_web/widgets/navigated_button.dart';
import 'package:altel_group_web/widgets/text_container.dart';
import 'package:flutter/material.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({
    super.key,
    required this.containerKey,
  });

  final GlobalKey? containerKey;

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  final GlobalKey careerContainerKey1 = GlobalKey();
  final GlobalKey careerContainerKey2 = GlobalKey();
  final GlobalKey careerContainerKey3 = GlobalKey();
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
              containerKey: careerContainerKey1,
              navigatingText: "Monter urządzeń elektrycznych",
            ),
            NavigatingButton(
              containerKey: careerContainerKey2,
              navigatingText: "Co oferujemy?",
            ),
            NavigatingButton(
              containerKey: careerContainerKey3,
              navigatingText: "Monter urządzeń dźwigowych",
            ),
          ],
        ),
        const Divider(),
        TextContainer(
          key: careerContainerKey1,
          subtitle: "Monter urządzeń\nelektrycznyche",
          txt: "",
        ),
        Container(
          key: widget.containerKey,
          child: TextContainer(
            key: careerContainerKey2,
            subtitle: "Co oferujemy?",
            txt: "",
          ),
        ),
        TextContainer(
          key: careerContainerKey3,
          subtitle: "Monter urządzeń\ndźwigowych",
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
