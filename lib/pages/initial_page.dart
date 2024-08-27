// import 'package:altel_group_web/routes/routes_name.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class InitialPage extends StatefulWidget {
//   const InitialPage({
//     super.key,
//     required this.page,
//   });
//   final Widget page;
//   @override
//   State<InitialPage> createState() => _InitialPageState();
// }

// class _InitialPageState extends State<InitialPage> {
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return SelectionArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFFD0E2E8),
//         body: CustomScrollView(
//           slivers: [
//             // SliverAppBar(
//             //   pinned: true,
//             //   title: Container(
//             //     height: 300,
//             //     width: screenSize.width,
//             //     color: Colors.amber,
//             //     margin: EdgeInsets.all(50),
//             //     child: Text("IGOR"),
//             //   ),
//             // ),
//             SliverPersistentHeader(
//               pinned: true, // Nagłówek będzie przypięty u góry
//               delegate: MySliverAppBarDelegate(
//                 minHeight: 150.0,
//                 maxHeight: 600.0,
//                 child: LayoutBuilder(
//                   builder: (context, constraints) {
//                     if (constraints.maxWidth > 1100) {
//                       return Container(
//                         // color: Colors.grey,
//                         width: screenSize.width,
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: [
//                             Image.asset(
//                               "images/homePage.jpg",
//                               fit: BoxFit.cover,
//                             ),
//                             Container(
//                               margin: const EdgeInsets.all(40),
//                               padding: const EdgeInsets.all(10),
//                               height: 100,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.9),
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: Column(
//                                 children: [
//                                   const Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Text(
//                                         "DUPA",
//                                         style: TextStyle(
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                       Text(
//                                         "O NAS",
//                                         style: TextStyle(
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                       Text(
//                                         "O FIRMIE",
//                                         style: TextStyle(
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                       Text(
//                                         "HOME",
//                                         style: TextStyle(
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(top: 70),
//                                     height: 200,
//                                     width: screenSize.width,
//                                     color: Colors.white,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         // child: Center(
//                         //   child: ElevatedButton(
//                         //     onPressed: () {
//                         //       context.goNamed(
//                         //         RouteNames.homePage,
//                         //       ); // Przekierowanie do HomePage
//                         //     },
//                         //     child: const Text(
//                         //       "Przejdź do HomePage",
//                         //       style: TextStyle(
//                         //         color: Colors.black,
//                         //         fontSize: 18,
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                       );
//                     } else {
//                       return Container(
//                         color: Colors.red,
//                         child: Center(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               context.goNamed(
//                                 RouteNames.homePage,
//                               ); // Przekierowanie do HomePage
//                             },
//                             child: const Text(
//                               "Przejdź do HomePage",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//             // SliverPersistentHeader(
//             //   delegate: MySliverAppBarDelegate(
//             //     maxHeight: 600,
//             //     minHeight: 100,
//             //     child: Image.asset(
//             //       "images/homePage.jpg",
//             //       fit: BoxFit.cover,
//             //     ),
//             //   ),
//             // ),
//             SliverToBoxAdapter(
//               child: widget.page,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;

//   MySliverAppBarDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });

//   @override
//   double get minExtent => minHeight;

//   @override
//   double get maxExtent => maxHeight;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     // Obliczanie koloru na podstawie shrinkOffset
//     double t = shrinkOffset / (maxExtent - minExtent);
//     Color backgroundColor = Color.lerp(Colors.blue, Colors.white, t)!;

//     return Container(
//       color: backgroundColor,
//       child: SizedBox.expand(child: child),
//     );
//   }

//   @override
//   bool shouldRebuild(MySliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }

// ******************************************************************************************
import 'package:altel_group_web/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({
    super.key,
    required this.page,
  });
  final Widget page;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SelectionArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFD0E2E8),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true, // Nagłówek będzie przypięty u góry
              delegate: MySliverAppBarDelegate(
                minHeight: 170.0,
                maxHeight: 800.0,
                screenSize: screenSize,
              ),
            ),
            SliverToBoxAdapter(
              child: widget.page,
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Size screenSize;

  MySliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.screenSize,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Obliczanie koloru na podstawie shrinkOffset
    double appbarHeight = shrinkOffset / (maxExtent - minExtent);
    double containerHeight = 250 * (1 - appbarHeight);
    double imageOpacity = 1.0 - appbarHeight;

    return Container(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: imageOpacity,
            child: Image.asset(
              "images/homePage.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabBar(
                  tabBarHeight: containerHeight,
                ),
                const Divider(),
                if (containerHeight > 20)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerNavigator(
                        containerHeight: containerHeight,
                        containerWidth: screenSize.width * 0.4,
                      ),
                      ContainerNavigator(
                        containerHeight: containerHeight,
                        containerWidth: screenSize.width * 0.4,
                      ),
                    ],
                  ),
                if (containerHeight > 50)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerNavigator(
                        containerHeight: containerHeight,
                        containerWidth: screenSize.width * 0.4,
                      ),
                      ContainerNavigator(
                        containerHeight: containerHeight,
                        containerWidth: screenSize.width * 0.4,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(MySliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        screenSize != oldDelegate.screenSize;
  }
}

// ******************************************************************************************

class ContainerNavigator extends StatefulWidget {
  const ContainerNavigator({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
  });
  final double containerHeight;
  final double containerWidth;
  @override
  State<ContainerNavigator> createState() => _ContainerNavigatorState();
}

class _ContainerNavigatorState extends State<ContainerNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(
        top: widget.containerHeight / 10,
        right: 20,
        left: 20,
      ),
      height: widget.containerHeight,
      width: widget.containerWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Text(
        "KONTAKT",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}

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
  final GlobalKey containerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        10,
        // 20,
        widget.tabBarHeight / 10,
        10,
        widget.tabBarHeight / 10,
      ),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "images/logo.png",
            scale: 3,
          ),
          const Icon(Icons.home),
          const TabBarNavigatorButton(
            buttonTitle: "o firmie",
          ),
          const TabBarNavigatorButton(
            buttonTitle: "oferta",
          ),
          const TabBarNavigatorButton(
            buttonTitle: "kariera",
          ),
          const TabBarNavigatorButton(
            buttonTitle: "kontakt",
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
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                )
              : const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
          child: Container(
            margin: const EdgeInsets.only(
              left: 25,
              right: 25,
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
