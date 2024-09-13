import 'package:altel_group_web/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabBarNavigator extends StatefulWidget {
  const TabBarNavigator({
    super.key,
    required this.tabBarHeight,
  });
  final double tabBarHeight;

  @override
  State<TabBarNavigator> createState() => _TabBarNavigatorState();
}

class _TabBarNavigatorState extends State<TabBarNavigator> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Szerokość np. dla iPhone'a 16 Pro to około 430px
        if (constraints.maxWidth > 800) {
          // Dla większych ekranów wyświetlaj Row
          return Container(
            margin: EdgeInsets.fromLTRB(
              10,
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
                    TabBarNavigatorButton(buttonTitle: "o firmie"),
                    TabBarNavigatorButton(buttonTitle: "oferta"),
                    TabBarNavigatorButton(buttonTitle: "kariera"),
                    TabBarNavigatorButton(buttonTitle: "kontakt"),
                  ],
                ),
              ],
            ),
          );
        } else {
          // Dla mniejszych ekranów wyświetlaj Drawer
          return Container(
            margin: EdgeInsets.fromLTRB(
              10,
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
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Otwórz Drawer
                  },
                ),
              ],
            ),
          );
        }
      },
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
