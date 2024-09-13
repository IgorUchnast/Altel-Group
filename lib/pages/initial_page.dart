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

//**************************************** POPRAWNA WERSJA ****************************************

import 'package:altel_group_web/routes/routes_name.dart';
// import 'package:altel_group_web/widgets/container_navigator.dart';
import 'package:altel_group_web/widgets/subtitle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';
import '../widgets/tab_bar.dart';
// import '../widgets/container_navigator.dart';

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
    double textOpacity = (1.0 - appbarHeight * 5).clamp(0.0, 1.0);

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
          _buildHeaderContent(
            containerHeight,
            screenSize,
            imageOpacity,
            textOpacity,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderContent(
    double containerHeight,
    Size screenSize,
    double imageOpacity,
    double textOpacity,
  ) {
    return Container(
      // margin: const EdgeInsets.all(40),
      margin: screenSize.width > 900
          ? const EdgeInsets.all(40)
          : const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TabBarNavigator(
            tabBarHeight: containerHeight,
          ),
          const Divider(),
          if (containerHeight > 86)
            _buildRow(
              [
                "Serwis",
                "Dźwigi",
              ],
              screenSize,
              containerHeight,
              [
                "Oferujemy profesjonalne usługi serwisowe zapewniające niezawodność i bezpieczeństwo wszystkich instalacji.",
                "Specjalizujemy się w dostarczaniu nowoczesnych i bezpiecznych rozwiązań dźwigowych, dopasowanych do indywidualnych potrzeb klientów."
              ],
              screenSize.width * 0.013,
              1,
            ),
          if (containerHeight > 100)
            _buildRow(
              [
                "Referencje",
                "Aktualności",
              ],
              screenSize,
              containerHeight,
              [
                "Zaufaj naszym realizacjom – współpracowaliśmy z wieloma zadowolonymi klientami z różnych branż.",
                "Bądź na bieżąco z najnowszymi informacjami i osiągnięciami firmy ALTEL Group."
              ],
              screenSize.width * 0.013,
              1,
            ),
        ],
      ),
    );
  }

  Row _buildRow(
    List<String> subtitles,
    Size screenSize,
    double containerHeight,
    List<String> containerText,
    double textSize,
    double textOpacity,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(subtitles.length, (index) {
        return AnimatedOpacity(
          opacity: containerHeight > 50 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: ContainerNavigator(
            textOpacity: textOpacity,
            subtitle: subtitles[index], // Użycie dynamicznego podtytułu
            containerHeight: containerHeight,
            // containerWidth: screenSize.width * 0.4,
            containerWidth:
                screenSize.width * 0.4 > 250 ? screenSize.width * 0.4 : 200,
            // textSize: screenSize.width * 0.013,
            textSize: textSize,
            containerText: containerText,
            textNumber: index, // Użycie dynamicznego indeksu
          ),
        );
      }),
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

// ******************************************************************************************

class ContainerNavigator extends StatefulWidget {
  const ContainerNavigator({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    required this.subtitle,
    required this.containerText,
    required this.textNumber,
    required this.textSize,
    required this.textOpacity,
  });
  final double containerHeight;
  final double containerWidth;
  final String subtitle;
  final List<String> containerText;
  final int textNumber;
  final double textSize;
  final double textOpacity;
  @override
  State<ContainerNavigator> createState() => _ContainerNavigatorState();
}

class _ContainerNavigatorState extends State<ContainerNavigator> {
  bool isSelected = false;
  final GlobalKey aboutUsContainerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
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
          // constraints: const BoxConstraints(minHeight: 60, minWidth: 200),
          height: widget.containerHeight,
          width: widget.containerWidth,
          // width: screenSize > : widget.containerWidth,
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
          child: Column(
            children: [
              Subtitle(
                subtitle: widget.subtitle,
              ),
              if (widget.containerHeight > 180)
                if (widget.containerWidth > 250)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Opacity(
                      opacity: widget.textOpacity,
                      child: Text(
                        widget.containerText[widget.textNumber],
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: widget.textSize,
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
