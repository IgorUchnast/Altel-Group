//**************************************** POPRAWNA WERSJA ****************************************
import 'package:altel_group_web/widgets/tab_bar/container_navigator.dart';
import 'package:flutter/material.dart';
import '../widgets/tab_bar/tab_bar.dart';

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
            tabBarDrawerHeight: screenSize.height,
            tabBarDrawerWidth: screenSize.width,
            tabBarHeight: containerHeight,
          ),
          const Divider(),
          TabBarInfoView(containerHeight: containerHeight),
          // Column(
          //   children: [
          //     if (containerHeight > 86)
          //       _buildRow(
          //         [
          //           "Serwis",
          //           "Dźwigi",
          //         ],
          //         // screenSize ,
          //         screenSize.width > 400 ? screenSize : screenSize * 0.9,
          //         // containerHeight,
          //         screenSize.width > 550 ? containerHeight : 120,
          //         [
          //           "Oferujemy profesjonalne usługi serwisowe zapewniające niezawodność i bezpieczeństwo wszystkich instalacji.",
          //           "Specjalizujemy się w dostarczaniu nowoczesnych i bezpiecznych rozwiązań dźwigowych, dopasowanych do indywidualnych potrzeb klientów."
          //         ],
          //         screenSize.width * 0.012,
          //         1,
          //       ),
          //     if (containerHeight > 100)
          //       _buildRow(
          //         [
          //           "Referencje",
          //           "Aktualności",
          //         ],
          //         // screenSize,
          //         // containerHeight,
          //         screenSize.width > 400 ? screenSize : screenSize,
          //         screenSize.width > 550 ? containerHeight : 120,
          //         [
          //           "Zaufaj naszym realizacjom – współpracowaliśmy z wieloma zadowolonymi klientami z różnych branż.",
          //           "Bądź na bieżąco z najnowszymi informacjami i osiągnięciami firmy ALTEL Group."
          //         ],
          //         screenSize.width * 0.012,
          //         1,
          //       ),
          //   ],
          // ),
          // if (containerHeight > 86)
          //   _buildRow(
          //     [
          //       "Serwis",
          //       "Dźwigi",
          //     ],
          //     // screenSize ,
          //     screenSize.width > 400 ? screenSize : screenSize * 0.9,
          //     // containerHeight,
          //     screenSize.width > 550 ? containerHeight : 120,
          //     [
          //       "Oferujemy profesjonalne usługi serwisowe zapewniające niezawodność i bezpieczeństwo wszystkich instalacji.",
          //       "Specjalizujemy się w dostarczaniu nowoczesnych i bezpiecznych rozwiązań dźwigowych, dopasowanych do indywidualnych potrzeb klientów."
          //     ],
          //     screenSize.width * 0.012,
          //     1,
          //   ),
          // if (containerHeight > 100)
          //   _buildRow(
          //     [
          //       "Referencje",
          //       "Aktualności",
          //     ],
          //     // screenSize,
          //     // containerHeight,
          //     screenSize.width > 400 ? screenSize : screenSize,
          //     screenSize.width > 550 ? containerHeight : 120,
          //     [
          //       "Zaufaj naszym realizacjom – współpracowaliśmy z wieloma zadowolonymi klientami z różnych branż.",
          //       "Bądź na bieżąco z najnowszymi informacjami i osiągnięciami firmy ALTEL Group."
          //     ],
          //     screenSize.width * 0.012,
          //     1,
          //   ),
        ],
      ),
    );
  }

  // Row _buildRow(
  //   List<String> subtitles,
  //   Size screenSize,
  //   double containerHeight,
  //   List<String> containerText,
  //   double textSize,
  //   double textOpacity,
  // ) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: List.generate(subtitles.length, (index) {
  //       return AnimatedOpacity(
  //         opacity: containerHeight > 50 ? 1.0 : 0.0,
  //         duration: const Duration(milliseconds: 300),
  //         child: ContainerNavigator(
  //           textOpacity: textOpacity,
  //           subtitle: subtitles[index],
  //           containerHeight: containerHeight,
  //           containerWidth:
  //               screenSize.width * 0.4 > 250 ? screenSize.width * 0.4 : 150,
  //           textSize: textSize,
  //           containerText: containerText,
  //           textNumber: index,
  //         ),
  //       );
  //     }),
  //   );
  // }

  @override
  bool shouldRebuild(MySliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        screenSize != oldDelegate.screenSize ||
        scrollOffset != oldDelegate.scrollOffset;
  }
}

// ******************************************************************************************

class TabBarInfoView extends StatefulWidget {
  const TabBarInfoView({
    super.key,
    required this.containerHeight,
  });
  final double containerHeight;
  @override
  State<TabBarInfoView> createState() => _TabBarInfoViewState();
}

class _TabBarInfoViewState extends State<TabBarInfoView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        if (widget.containerHeight > 86)
          _buildRow(
            [
              "Serwis",
              "Dźwigi",
            ],
            // screenSize ,
            screenSize.width > 400 ? screenSize : screenSize * 0.9,
            // containerHeight,
            screenSize.width > 550 ? widget.containerHeight : 120,
            [
              "Oferujemy profesjonalne usługi serwisowe zapewniające niezawodność i bezpieczeństwo wszystkich instalacji.",
              "Specjalizujemy się w dostarczaniu nowoczesnych i bezpiecznych rozwiązań dźwigowych, dopasowanych do indywidualnych potrzeb klientów."
            ],
            screenSize.width * 0.012,
            1,
          ),
        if (widget.containerHeight > 100)
          _buildRow(
            [
              "Referencje",
              "Aktualności",
            ],
            // screenSize,
            // containerHeight,
            screenSize.width > 400 ? screenSize : screenSize,
            screenSize.width > 550 ? widget.containerHeight : 120,
            [
              "Zaufaj naszym realizacjom – współpracowaliśmy z wieloma zadowolonymi klientami z różnych branż.",
              "Bądź na bieżąco z najnowszymi informacjami i osiągnięciami firmy ALTEL Group."
            ],
            screenSize.width * 0.012,
            1,
          ),
      ],
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
            subtitle: subtitles[index],
            containerHeight: containerHeight,
            containerWidth:
                screenSize.width * 0.4 > 250 ? screenSize.width * 0.4 : 150,
            textSize: textSize,
            containerText: containerText,
            textNumber: index,
          ),
        );
      }),
    );
  }
}
