//**************************************** POPRAWNA WERSJA ****************************************
import 'package:altel_group_web/widgets/contact_container.dart';
import 'package:altel_group_web/widgets/tab_bar/bar_page_view.dart';
import 'package:altel_group_web/widgets/tab_bar/contact_tab_bar_view.dart';
import 'package:altel_group_web/widgets/tab_bar/tab_bar_home_view.dart';
import 'package:flutter/material.dart';
import '../widgets/tab_bar/tab_bar.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({
    super.key,
    required this.page,
    required this.pageName,
  });
  final Widget page;
  final String pageName;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(20);
    });
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
                maxHeight:
                    screenSize.width > 250 ? 700 : screenSize.height * 0.7,
                screenSize: screenSize,
                scrollOffset:
                    _scrollController.hasClients ? _scrollController.offset : 0,
                pageName: widget.pageName,
                scrollController: _scrollController,
              ),
            ),
            SliverToBoxAdapter(
              child: widget.page,
            ),
            const SliverToBoxAdapter(
              child: ContactContainer(
                contactContainerText:
                    "Dbamy o wszystko co wiąże się ze zrównoważonym biznesem. Od usług prawnych po zmieniające życie miast rozwiązania proekologiczne. ALTEL GROUP sp. z o.o. dostarcza najlepszą jakość w branży od 2001 roku.",
                iconText1: "biuro@altel-lift.pl",
                iconText2: "00 48 322 668 047",
                iconText3: "ul. Małobądzka 143,\n 42-500 Będzin",
              ),
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
  final String pageName;
  final ScrollController scrollController;

  // final Widget tabBarView;

  MySliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.screenSize,
    required this.scrollOffset,
    required this.pageName,
    required this.scrollController,
    // required this.tabBarView,
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
            // child: Image.asset("images/homePage.jpg", fit: BoxFit.cover),
            child: _buildHeaderBackground(pageName),
          ),
          _buildHeaderContent(containerHeight, screenSize, imageOpacity,
              textOpacity, pageName, appbarHeight),
        ],
      ),
    );
  }

  Widget _buildHeaderBackground(String pageName) {
    switch (pageName) {
      case 'initail':
        return Image.asset("images/homePage.jpg", fit: BoxFit.cover);
      case 'home-page':
        return Image.asset("images/homePage.jpg", fit: BoxFit.cover);
      case 'about-us':
        return Image.asset("images/about_us.jpg", fit: BoxFit.cover);
      case 'offer':
        return Image.asset("images/offer.jpg", fit: BoxFit.cover);
      case 'career':
        return Image.asset("images/image2.jpg", fit: BoxFit.cover);
      case 'contact':
        return Image.asset("images/image1.jpg", fit: BoxFit.cover);
      default:
        return Image.asset("images/homePage.jpg", fit: BoxFit.cover);
    }
  }

  Widget _buildHeaderContent(
      double containerHeight,
      Size screenSize,
      double imageOpacity,
      double textOpacity,
      String pageName,
      double appbarHeight) {
    return Container(
      // margin: const EdgeInsets.all(40),
      margin: screenSize.width > 900
          ? const EdgeInsets.all(30)
          : const EdgeInsets.all(10),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color:
            appbarHeight > 0.9 ? Colors.white : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 7, // How much the shadow is blurred
            offset: const Offset(0, 3),
            color: Colors.grey.withOpacity(0.4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TabBarNavigator(
            scrollController: scrollController,
            tabBarDrawerHeight: screenSize.height,
            tabBarDrawerWidth: screenSize.width,
            tabBarHeight: containerHeight,
          ),
          const Divider(),
          _buildContentTabBar(pageName, containerHeight, imageOpacity),
        ],
      ),
    );
  }

  Widget _buildContentTabBar(
      String pageName, double containerHeight, double opacityContainer) {
    switch (pageName) {
      case 'initial':
        return TabBarHomePageView(
          opacityContainer: opacityContainer,
          containerHeight: containerHeight,
        );
      case 'home-page':
        // return Container();
        return TabBarHomePageView(
          opacityContainer: opacityContainer,
          containerHeight: containerHeight,
        );
      case 'about-us':
        return TabBarPageView(
          pageTitle: "o firmie",
          pageText:
              "Potrzebujesz czegoś? Możemy pomóc. Niezależnie od rodzaju działalności, wielkości firmy czy lokalizacji nasze specjalistyczne usługi pomogą Ci zaoszczędzić czas, osiągać zyski i jak najlepiej wykonywać prace. Oferujemy światowej klasy technologie i usługi dostosowane do każdego budżetu i wyznaczonego celu. Wybieraj spośród opcji, które pozwalają na samodzielne wykonywanie czynności serwisowych, aż po pełne wsparcie techniczne w miejscu wykonywania prac, zapewniane przez największą w branży sieć dealerów. Osiągniesz swój cel. Możesz liczyć na naszą pomoc. Zróbmy to razem.",
          containerHeight: containerHeight,
        );
      case 'offer':
        return TabBarPageView(
          pageTitle: "oferta",
          pageText:
              "Potrzebujesz czegoś? Możemy pomóc. Niezależnie od rodzaju działalności, wielkości firmy czy lokalizacji nasze specjalistyczne usługi pomogą Ci zaoszczędzić czas, osiągać zyski i jak najlepiej wykonywać prace. Oferujemy światowej klasy technologie i usługi dostosowane do każdego budżetu i wyznaczonego celu. Wybieraj spośród opcji, które pozwalają na samodzielne wykonywanie czynności serwisowych, aż po pełne wsparcie techniczne w miejscu wykonywania prac, zapewniane przez największą w branży sieć dealerów. Osiągniesz swój cel. Możesz liczyć na naszą pomoc. Zróbmy to razem.",
          containerHeight: containerHeight,
        );
      case 'career':
        return TabBarPageView(
          pageTitle: "kariera",
          pageText:
              "Potrzebujesz czegoś? Możemy pomóc. Niezależnie od rodzaju działalności, wielkości firmy czy lokalizacji nasze specjalistyczne usługi pomogą Ci zaoszczędzić czas, osiągać zyski i jak najlepiej wykonywać prace. Oferujemy światowej klasy technologie i usługi dostosowane do każdego budżetu i wyznaczonego celu. Wybieraj spośród opcji, które pozwalają na samodzielne wykonywanie czynności serwisowych, aż po pełne wsparcie techniczne w miejscu wykonywania prac, zapewniane przez największą w branży sieć dealerów. Osiągniesz swój cel. Możesz liczyć na naszą pomoc. Zróbmy to razem.",
          containerHeight: containerHeight,
        );
      case 'contact':
        return ContactTabBarView(
          pageTitle: "kontakt",
          pageText:
              "Potrzebujesz czegoś? Możemy pomóc. Niezależnie od rodzaju działalności, wielkości firmy czy lokalizacji nasze specjalistyczne usługi pomogą Ci zaoszczędzić czas, osiągać zyski i jak najlepiej wykonywać prace. Oferujemy światowej klasy technologie i usługi dostosowane do każdego budżetu i wyznaczonego celu. Wybieraj spośród opcji, które pozwalają na samodzielne wykonywanie czynności serwisowych, aż po pełne wsparcie techniczne w miejscu wykonywania prac, zapewniane przez największą w branży sieć dealerów. Osiągniesz swój cel. Możesz liczyć na naszą pomoc. Zróbmy to razem.",
          containerHeight: containerHeight,
        );
      default:
        return TabBarHomePageView(
          opacityContainer: opacityContainer,
          containerHeight: containerHeight,
        );
    }
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
