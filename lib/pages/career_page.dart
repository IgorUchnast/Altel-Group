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
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              color: const Color(0xFFD0E2E8),
              height: 200,
              width: 500,
            ),
            Container(
              key: widget.containerKey,
              color: Colors.white,
              height: 500,
              width: screenSize.width * 0.6,
            ),
            // const ContactContainer(),
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
