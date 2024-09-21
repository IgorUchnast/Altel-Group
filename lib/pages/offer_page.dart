import 'package:altel_group_web/widgets/navigated_button.dart';
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
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    if (widget.containerKey != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollTo(widget.containerKey!);
        _scrollController.jumpTo(0);
      });
    }
  }

  // @override
  // void dispose() {
  //   _scrollController.dispose(); // Pamiętaj o zwolnieniu kontrolera
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            NavigatingButton(
              containerKey: offerContainerKey,
              navigatingText: "dźwigi",
            ),
            NavigatingButton(
              containerKey: offerContainerKey,
              navigatingText: "usługi",
            ),
            NavigatingButton(
              containerKey: offerContainerKey,
              navigatingText: "serwis",
            ),
            NavigatingButton(
              containerKey: offerContainerKey,
              navigatingText: "technologia",
            ),
            NavigatingButton(
              containerKey: offerContainerKey,
              navigatingText: "szkolenia",
            ),
          ],
        ),
        const Divider(),
        Container(
          color: const Color(0xFFD0E2E8),
          height: 200,
          width: 500,
        ),
        Container(
          // key: widget.containerKey,
          key: offerContainerKey,
          color: Colors.white,
          height: 500,
          // width: screenSize.width * 0.6,
        ),
        Container(
          key: widget.containerKey,
          color: Colors.blue,
          height: 500,
          // width: screenSize.width * 0.6,
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
