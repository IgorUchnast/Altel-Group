import 'package:flutter/material.dart';

class NavigatingButton extends StatefulWidget {
  const NavigatingButton({
    super.key,
    required this.containerKey,
    required this.navigatingText,
  });
  final GlobalKey containerKey;
  final String navigatingText;
  @override
  State<NavigatingButton> createState() => _NavigatingButtonState();
}

class _NavigatingButtonState extends State<NavigatingButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        scrollTo(widget.containerKey);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(
            () {
              isSelected = false;
            },
          );
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          // style: AGfonts.tabBarFont,
          style: isSelected
              ? const TextStyle(color: Colors.black)
              : TextStyle(color: Colors.lightBlue.withOpacity(0.9)),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: const EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //   color: isSelected
            //       ? Colors.lightBlueAccent.withOpacity(0.8)
            //       : const Color(0xFFD0E2E8),
            // ),
            child: Text(
              widget.navigatingText.toUpperCase(),
              style: isSelected
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
}
