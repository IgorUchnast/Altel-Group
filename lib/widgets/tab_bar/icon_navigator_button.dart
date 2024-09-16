import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IconNavigatorButton extends StatefulWidget {
  const IconNavigatorButton({
    super.key,
    // required this.buttonIcon,
    required this.pageName,
  });
  // final Icons buttonIcon;
  final String pageName;
  @override
  State<IconNavigatorButton> createState() => IconNavigatorButtonState();
}

class IconNavigatorButtonState extends State<IconNavigatorButton> {
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
        child: Icon(
          Icons.home,
          size: 25,
          color: isSelected ? Colors.lightBlue : Colors.black,
        ),
      ),
    );
  }
}
