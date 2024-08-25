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
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true, // Nagłówek będzie przypięty u góry
              delegate: MySliverAppBarDelegate(
                minHeight: 100.0,
                maxHeight: 600.0,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 1100) {
                      return Container(
                        color: Colors.blue,
                        width: screenSize.width,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              "images/homePage.jpg",
                              fit: BoxFit.cover,
                            ),
                            Container(
                              margin: const EdgeInsets.all(40),
                              padding: const EdgeInsets.all(10),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ],
                        ),
                        // child: Center(
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       context.goNamed(
                        //         RouteNames.homePage,
                        //       ); // Przekierowanie do HomePage
                        //     },
                        //     child: const Text(
                        //       "Przejdź do HomePage",
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 18,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      );
                    } else {
                      return Container(
                        color: Colors.red,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              context.goNamed(
                                RouteNames.homePage,
                              ); // Przekierowanie do HomePage
                            },
                            child: const Text(
                              "Przejdź do HomePage",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
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
  final Widget child;

  MySliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(MySliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
