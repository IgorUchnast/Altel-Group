import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarNavigatorButton extends StatefulWidget {
  const TabBarNavigatorButton({
    super.key,
    required this.buttonTitle,
    required this.pageName,
    required this.scrollController,
  });
  final String buttonTitle;
  final String pageName;
  final ScrollController scrollController;
  @override
  State<TabBarNavigatorButton> createState() => TabBarNavigatorButtonState();
}

class TabBarNavigatorButtonState extends State<TabBarNavigatorButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.scrollController.jumpTo(20);
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
              ? GoogleFonts.roboto(
                  color: Colors.lightBlue,
                  // color: Color(0xFFD0E2E8),
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                )
              : GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                ),
          child: Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 15),
            child: Text(
              widget.buttonTitle.toUpperCase(),
            ),
          ),
        ),
      ),
    );
  }
}
