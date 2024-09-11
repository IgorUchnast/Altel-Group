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
//**************************************** POPRAWNA WERSJA ****************************************
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

// class _InitialPageState extends State<InitialPage> {
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;

//     return SelectionArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFFD0E2E8),
//         body: CustomScrollView(
//           slivers: [
//             SliverPersistentHeader(
//               pinned: true, // Nagłówek będzie przypięty u góry
//               delegate: MySliverAppBarDelegate(
//                 minHeight: 170.0,
//                 maxHeight: 700.0,
//                 screenSize: screenSize,
//               ),
//             ),
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
//   final Size screenSize;

//   MySliverAppBarDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.screenSize,
//   });

//   @override
//   double get minExtent => minHeight;

//   @override
//   double get maxExtent => maxHeight;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     // Obliczanie koloru na podstawie shrinkOffset
//     double appbarHeight = shrinkOffset / (maxExtent - minExtent);
//     double containerHeight = 200 * (1 - appbarHeight);
//     double imageOpacity = 1.0 - appbarHeight;

//     return Container(
//       color: Colors.transparent,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           Opacity(
//             opacity: imageOpacity,
//             child: Image.asset(
//               "images/homePage.jpg",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(40),
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.9),
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TabBar(
//                   tabBarHeight: containerHeight,
//                 ),
//                 const Divider(),
//                 if (containerHeight > 50)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ContainerNavigator(
//                         subtitle: "Serwis",
//                         containerHeight: containerHeight,
//                         containerWidth: screenSize.width * 0.4,
//                       ),
//                       ContainerNavigator(
//                         subtitle: "dźwigi",
//                         containerHeight: containerHeight,
//                         containerWidth: screenSize.width * 0.4,
//                       ),
//                     ],
//                   ),
//                 if (containerHeight > 100)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ContainerNavigator(
//                         subtitle: "referencje",
//                         containerHeight: containerHeight,
//                         containerWidth: screenSize.width * 0.4,
//                       ),
//                       ContainerNavigator(
//                         subtitle: "aktualności",
//                         containerHeight: containerHeight,
//                         containerWidth: screenSize.width * 0.4,
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   bool shouldRebuild(MySliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         screenSize != oldDelegate.screenSize;
//   }
// }
class _InitialPageState extends State<InitialPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SelectionArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFD0E2E8),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: MySliverAppBarDelegate(
                minHeight: 170.0,
                maxHeight: 700.0,
                screenSize: screenSize,
                scrollOffset:
                    _scrollController.hasClients ? _scrollController.offset : 0,
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
  final double scrollOffset;

  MySliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.screenSize,
    required this.scrollOffset,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double appbarHeight =
        (scrollOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    double containerHeight = 200 * (1 - appbarHeight);
    double imageOpacity = (1.0 - appbarHeight).clamp(0.0, 1.0);

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
          _buildHeaderContent(containerHeight, screenSize, imageOpacity),
        ],
      ),
    );
  }

  Widget _buildHeaderContent(
      double containerHeight, Size screenSize, double imageOpacity) {
    return Container(
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
          if (containerHeight > 50)
            _buildRow(
              [
                "Serwis",
                "Dźwigi",
              ],
              screenSize,
              containerHeight,
            ),
          if (containerHeight > 100)
            _buildRow(
              [
                "Referencje",
                "Aktualności",
              ],
              screenSize,
              containerHeight,
            ),
        ],
      ),
    );
  }

  Row _buildRow(
      List<String> subtitles, Size screenSize, double containerHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: subtitles.map((subtitle) {
        return ContainerNavigator(
          subtitle: subtitle,
          containerHeight: containerHeight,
          containerWidth: screenSize.width * 0.4,
        );
      }).toList(),
    );
  }

  @override
  bool shouldRebuild(MySliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        screenSize != oldDelegate.screenSize ||
        scrollOffset != oldDelegate.scrollOffset;
  }
}

//**************************************** POPRAWNA WERSJA ****************************************

// ******************************************************************************************

class ContainerNavigator extends StatefulWidget {
  const ContainerNavigator({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    required this.subtitle,
  });
  final double containerHeight;
  final double containerWidth;
  final String subtitle;
  @override
  State<ContainerNavigator> createState() => _ContainerNavigatorState();
}

class _ContainerNavigatorState extends State<ContainerNavigator> {
  bool isSelected = false;
  final GlobalKey aboutUsContainerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          RouteNames.aboutUs,
          extra: aboutUsContainerKey,
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
        child: Container(
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
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? Colors.grey.withOpacity(0.2)
                      : Colors.transparent,
                  spreadRadius: 5,
                  blurRadius: 7, // How much the shadow is blurred
                  offset: const Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
            child: Subtitle(
              subtitle: widget.subtitle,
            )),
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

class Subtitle extends StatelessWidget {
  const Subtitle({
    super.key,
    required this.subtitle,
  });
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SelectionArea(
                    child: Text(
                      subtitle.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.lightBlueAccent.withOpacity(0.5),
                height: 7,
                width: 60,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
