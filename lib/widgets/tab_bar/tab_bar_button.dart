import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabBarNavigatorButton extends StatefulWidget {
  const TabBarNavigatorButton({
    super.key,
    required this.buttonTitle,
    required this.pageName,
  });
  final String buttonTitle;
  final String pageName;
  @override
  State<TabBarNavigatorButton> createState() => TabBarNavigatorButtonState();
}

class TabBarNavigatorButtonState extends State<TabBarNavigatorButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          widget.pageName,
        );
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          style: isSelected
              ? const TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                )
              : const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
          child: Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 15),
            child: Text(widget.buttonTitle.toUpperCase()),
          ),
        ),
      ),
    );
  }
}
