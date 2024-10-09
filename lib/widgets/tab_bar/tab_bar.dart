import 'package:altel_group_web/routes/routes_name.dart';
import 'package:altel_group_web/widgets/tab_bar/drawer_button.dart';
import 'package:altel_group_web/widgets/tab_bar/icon_navigator_button.dart';
import 'package:altel_group_web/widgets/tab_bar/tab_bar_button.dart';
import 'package:flutter/material.dart';

class TabBarNavigator extends StatefulWidget {
  const TabBarNavigator({
    super.key,
    required this.tabBarHeight,
    required this.tabBarDrawerHeight,
    required this.tabBarDrawerWidth,
    required this.scrollController,
  });
  final double tabBarHeight;
  final double tabBarDrawerHeight;
  final double tabBarDrawerWidth;
  final ScrollController scrollController;

  @override
  State<TabBarNavigator> createState() => _TabBarNavigatorState();
}

class _TabBarNavigatorState extends State<TabBarNavigator> {
  OverlayEntry? _overlayEntry;
  bool isSelected = false;
  void showMenuOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: widget.tabBarDrawerWidth * 0.7,
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
                      scrollController: widget.scrollController,
                      pageName: RouteNames.homePage,
                      buttonText: "strona główna",
                      closeDrawer: hideMenuOverlay,
                      containerWidth: widget.tabBarDrawerWidth * 0.6,
                    ),
                    DrawerButtonNavigator(
                      scrollController: widget.scrollController,
                      pageName: RouteNames.aboutUs,
                      buttonText: "o firmie",
                      closeDrawer: hideMenuOverlay,
                      containerWidth: widget.tabBarDrawerWidth * 0.6,
                    ),
                    DrawerButtonNavigator(
                      scrollController: widget.scrollController,
                      pageName: RouteNames.offer,
                      buttonText: "oferta",
                      closeDrawer: hideMenuOverlay,
                      containerWidth: widget.tabBarDrawerWidth * 0.6,
                    ),
                    DrawerButtonNavigator(
                      scrollController: widget.scrollController,
                      pageName: RouteNames.career,
                      buttonText: "kariera",
                      closeDrawer: hideMenuOverlay,
                      containerWidth: widget.tabBarDrawerWidth * 0.6,
                    ),
                    DrawerButtonNavigator(
                      scrollController: widget.scrollController,
                      pageName: RouteNames.contact,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconNavigatorButton(
                      scrollController: widget.scrollController,
                      pageName: RouteNames.homePage,
                    ),
                    TabBarNavigatorButton(
                      scrollController: widget.scrollController,
                      buttonTitle: "o firmie",
                      pageName: RouteNames.aboutUs,
                    ),
                    TabBarNavigatorButton(
                      scrollController: widget.scrollController,
                      buttonTitle: "oferta",
                      pageName: RouteNames.offer,
                    ),
                    TabBarNavigatorButton(
                      scrollController: widget.scrollController,
                      buttonTitle: "kariera",
                      pageName: RouteNames.career,
                    ),
                    TabBarNavigatorButton(
                      scrollController: widget.scrollController,
                      buttonTitle: "kontakt",
                      pageName: RouteNames.contact,
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
