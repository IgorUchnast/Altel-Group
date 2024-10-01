import 'package:altel_group_web/routes/routes_name.dart';
import 'package:altel_group_web/widgets/tab_bar/container_navigator.dart';
import 'package:flutter/material.dart';

class TabBarHomePageView extends StatefulWidget {
  const TabBarHomePageView({
    super.key,
    required this.containerHeight,
    required this.opacityContainer,
  });
  final double containerHeight;
  final double opacityContainer;
  @override
  State<TabBarHomePageView> createState() => _TabBarHomePageViewState();
}

class _TabBarHomePageViewState extends State<TabBarHomePageView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        if (widget.containerHeight > 86)
          _buildRow(
            [
              "Referencje",
              "Dźwigi",
            ],
            [RouteNames.aboutUs, RouteNames.offer],
            screenSize.width > 400 ? screenSize : screenSize * 0.9,
            screenSize.width > 550 ? widget.containerHeight : 120,
            [
              "Oferujemy profesjonalne usługi serwisowe zapewniające niezawodność i bezpieczeństwo wszystkich instalacji.",
              "Specjalizujemy się w dostarczaniu nowoczesnych i bezpiecznych rozwiązań dźwigowych, dopasowanych do indywidualnych potrzeb klientów."
            ],
            screenSize.width * 0.012,
            1,
            // widget.opacityContainer,
          ),
        if (widget.containerHeight > 110)
          _buildRow(
            [
              "Co oferujemy?",
              "Formularz\nzgłoszeniowy",
            ],
            [
              RouteNames.career,
              RouteNames.contact,
            ],
            screenSize.width > 400 ? screenSize : screenSize,
            screenSize.width > 550 ? widget.containerHeight : 120,
            [
              "Zaufaj naszym realizacjom – współpracowaliśmy z wieloma zadowolonymi klientami z różnych branż.",
              "Bądź na bieżąco z najnowszymi informacjami i osiągnięciami firmy ALTEL Group."
            ],
            screenSize.width * 0.012,
            1,
            // widget.opacityContainer,
            // 1
          ),
      ],
    );
  }

  Row _buildRow(
    List<String> subtitles,
    List<String> texTitle,
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
            containerName: texTitle[index],
            textOpacity: textOpacity,
            subtitle: subtitles[index],
            containerHeight: containerHeight,
            containerWidth:
                screenSize.width * 0.4 > 250 ? screenSize.width * 0.4 : 170,
            textSize: textSize,
            containerText: containerText,
            textNumber: index,
          ),
        );
      }),
    );
  }
}
