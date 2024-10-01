import 'package:altel_group_web/pages/home_page.dart';
import 'package:altel_group_web/widgets/navigated_button.dart';
import 'package:altel_group_web/widgets/text_container.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({
    super.key,
    required this.containerKey,
  });

  final GlobalKey? containerKey;

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  final GlobalKey offerContainerKey = GlobalKey();
  final GlobalKey cranesContainerKey = GlobalKey();
  final GlobalKey servicesContainerKey = GlobalKey();
  final GlobalKey technologyContainerKey = GlobalKey();
  final GlobalKey trainingContainerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    if (widget.containerKey != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollTo(widget.containerKey!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            NavigatingButton(
              containerKey: cranesContainerKey,
              navigatingText: "dźwigi",
            ),
            NavigatingButton(
              containerKey: servicesContainerKey,
              navigatingText: "usługi",
            ),
            NavigatingButton(
              containerKey: technologyContainerKey,
              navigatingText: "technologia",
            ),
            NavigatingButton(
              containerKey: trainingContainerKey,
              navigatingText: "szkolenia",
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubSubTitle(
              key: cranesContainerKey,
              subsubTitleText: "Dźwigi",
            ),
          ],
        ),
        TextContainer(
          key: widget.containerKey,
          subtitle: "WÓZKI WIDŁOWE",
          txt: "",
        ),
        const TextContainer(
          subtitle: "platformy\ndźwigowe",
          txt: "",
        ),
        const TextContainer(
          subtitle: "dźwigi\nhydrauliczne",
          txt: "",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubSubTitle(
              key: servicesContainerKey,
              subsubTitleText: "Usługi",
            ),
          ],
        ),
        const TextContainer(
          subtitle: "konserwacje\ndźwigów",
          txt:
              "Potrzebujesz czegoś? Możemy pomóc. Niezależnie od rodzaju działalności, wielkości firmy czy lokalizacji nasze specjalistyczne usługi pomogą Ci zaoszczędzić czas, osiągać zyski i jak najlepiej wykonywać prace. Oferujemy światowej klasy technologie i usługi dostosowane do każdego budżetu i wyznaczonego celu. Wybieraj spośród opcji, które pozwalają na samodzielne wykonywanie czynności serwisowych, aż po pełne wsparcie techniczne w miejscu wykonywania prac, zapewniane przez największą w branży sieć dealerów. Osiągniesz swój cel. Możesz liczyć na naszą pomoc. Zróbmy to razem.",
        ),
        TextContainer(
          key: trainingContainerKey,
          subtitle: "Szkolenia",
          txt: "",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubSubTitle(
              key: technologyContainerKey,
              subsubTitleText: "Technologia",
            ),
          ],
        ),
        const TextContainer(
          subtitle: "ekologiczne\nrozwiązania",
          txt: "",
        ),
      ],
    );
  }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
