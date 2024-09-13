import 'package:altel_group_web/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabBar extends StatefulWidget {
  const TabBar({
    super.key,
    required this.tabBarHeight,
  });
  final double tabBarHeight;
  @override
  State<TabBar> createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        10,
        // 20,
        // widget.tabBarHeight / 10,
        0,
        10,
        widget.tabBarHeight / 10,
      ),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            "images/logo.png",
            scale: 2,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, size: 25),
              TabBarNavigatorButton(
                buttonTitle: "o firmie",
              ),
              TabBarNavigatorButton(
                buttonTitle: "oferta",
              ),
              TabBarNavigatorButton(
                buttonTitle: "kariera",
              ),
              TabBarNavigatorButton(
                buttonTitle: "kontakt",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabBarNavigatorButton extends StatefulWidget {
  const TabBarNavigatorButton({
    super.key,
    required this.buttonTitle,
  });
  final String buttonTitle;
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
          RouteNames.aboutUs,
        );
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
            margin: const EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 15,
              top: 15,
            ),
            child: Text(
              widget.buttonTitle.toUpperCase(),
              // style: AGfonts.tabBarFont,
            ),
          ),
        ),
      ),
    );
  }
}
