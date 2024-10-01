import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerButtonNavigator extends StatefulWidget {
  const DrawerButtonNavigator({
    super.key,
    required this.containerWidth,
    required this.closeDrawer,
    required this.buttonText,
    required this.pageName,
    required this.scrollController,
  });
  final double containerWidth;
  final String buttonText;
  final String pageName;
  final void Function() closeDrawer;
  final ScrollController scrollController;

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
        widget.scrollController.jumpTo(0);
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
          width: widget.containerWidth,
          height: 60,
          child: Text(
            widget.buttonText.toUpperCase(),
            style: GoogleFonts.roboto(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
