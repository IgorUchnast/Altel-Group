import 'package:altel_group_web/routes/routes_name.dart';
import 'package:altel_group_web/widgets/tab_bar/drawer_button.dart';
import 'package:altel_group_web/widgets/tab_bar/tab_bar_button.dart';
import 'package:flutter/material.dart';

class TabBarNavigator extends StatefulWidget {
  const TabBarNavigator({
    super.key,
    required this.tabBarHeight,
    required this.tabBarDrawerHeight,
    required this.tabBarDrawerWidth,
  });
  final double tabBarHeight;
  final double tabBarDrawerHeight;
  final double tabBarDrawerWidth;

  @override
  State<TabBarNavigator> createState() => _TabBarNavigatorState();
}

class _TabBarNavigatorState extends State<TabBarNavigator> {
  OverlayEntry? _overlayEntry;
  bool isSelected = false;
  void showMenuOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        // top: widget.tabBarHeight * 0.5, // Pozycja menu poniżej TabBar
        top: 0,
        right: 0, // Pozycja menu przy prawej krawędzi
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: widget.tabBarDrawerWidth * 0.6,
            height: widget.tabBarDrawerHeight,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                isSelected = false;
              },
              child: MouseRegion(
                onExit: (_) {
                  setState(() {
                    isSelected = false;
                    if (isSelected == false) {
                      hideMenuOverlay();
                    }
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DrawerButtonNavigator(
                      pageName: RouteNames.homePage,
                      buttonText: "strona główna",
                      closeDrawer: hideMenuOverlay,
                      containerWidth: widget.tabBarDrawerWidth * 0.6,
                    ),
                    DrawerButtonNavigator(
                      pageName: RouteNames.aboutUs,
                      buttonText: "o firmie",
                      closeDrawer: hideMenuOverlay,
                      containerWidth: widget.tabBarDrawerWidth * 0.6,
                    ),
                    DrawerButtonNavigator(
                      pageName: RouteNames.aboutUs,
                      buttonText: "oferta",
                      closeDrawer: hideMenuOverlay,
                      containerWidth: widget.tabBarDrawerWidth * 0.6,
                    ),
                    DrawerButtonNavigator(
                      pageName: RouteNames.aboutUs,
                      buttonText: "kariera",
                      closeDrawer: hideMenuOverlay,
                      containerWidth: widget.tabBarDrawerWidth * 0.6,
                    ),
                    DrawerButtonNavigator(
                      pageName: RouteNames.aboutUs,
                      buttonText: "kontakt",
                      closeDrawer: hideMenuOverlay,
                      containerWidth: widget.tabBarDrawerWidth * 0.6,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hideMenuOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
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
                    TabBarNavigatorButton(
                      buttonTitle: "o firmie",
                      pageName: RouteNames.aboutUs,
                    ),
                    TabBarNavigatorButton(
                      buttonTitle: "oferta",
                      pageName: RouteNames.aboutUs,
                    ),
                    TabBarNavigatorButton(
                      buttonTitle: "kariera",
                      pageName: RouteNames.aboutUs,
                    ),
                    TabBarNavigatorButton(
                      buttonTitle: "kontakt",
                      pageName: RouteNames.aboutUs,
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
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
                GestureDetector(
                  onTap: () {
                    if (_overlayEntry == null) {
                      showMenuOverlay(context);
                    } else {
                      hideMenuOverlay();
                    }
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
                      Icons.menu,
                      color: isSelected ? Colors.lightBlue : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
