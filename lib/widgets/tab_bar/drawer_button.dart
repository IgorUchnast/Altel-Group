import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerButtonNavigator extends StatefulWidget {
  const DrawerButtonNavigator({
    super.key,
    required this.containerWidth,
    required this.closeDrawer,
    required this.buttonText,
    required this.pageName,
  });
  final double containerWidth;
  final String buttonText;
  final String pageName;
  final void Function() closeDrawer;
  @override
  State<DrawerButtonNavigator> createState() => _DrawerButtonNavigatorState();
}

class _DrawerButtonNavigatorState extends State<DrawerButtonNavigator> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.closeDrawer();
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
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: isSelected ? Colors.lightBlue.withOpacity(0.5) : Colors.white,
          // color: isSelected ? const Color(0xFFD0E2E8) : Colors.white,
          width: widget.containerWidth,
          height: 60,
          child: Text(
            widget.buttonText.toUpperCase(),
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
