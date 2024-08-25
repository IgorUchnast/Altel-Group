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
              : const TextStyle(color: Colors.blue),
          // child: Container(
          //   color: Colors.white,
          //   padding: const EdgeInsets.only(top: 20, bottom: 20),
          //   margin: const EdgeInsets.only(
          //     left: 25,
          //     right: 25,
          //     bottom: 15,
          //     top: 15,
          //   ),
          //   child: Text(
          //     widget.navigatingText.toUpperCase(),
          //     style:
          //         isSelected ? AGfonts.navigatorHover : AGfonts.navigatorFont,
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              right: 20,
              left: 20,
            ),
            child: Text(
              widget.navigatingText.toUpperCase(),
              style: isSelected
                  ? const TextStyle(color: Colors.red)
                  : const TextStyle(color: Colors.blue),
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
