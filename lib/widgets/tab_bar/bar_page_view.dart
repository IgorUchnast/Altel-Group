import 'package:altel_group_web/widgets/title.dart';
import 'package:flutter/material.dart';

class TabBarPageView extends StatefulWidget {
  const TabBarPageView({
    super.key,
    required this.containerHeight,
    required this.pageText,
    required this.pageTitle,
  });
  final double containerHeight;
  final String pageTitle;
  final String pageText;
  @override
  State<TabBarPageView> createState() => _TabBarPageViewState();
}

class _TabBarPageViewState extends State<TabBarPageView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: widget.containerHeight > 80
          ? const EdgeInsets.all(20)
          : const EdgeInsets.all(0),
      color: Colors.transparent,
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          if (widget.containerHeight > 75)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PageTitle(subtitle: widget.pageTitle, fontSizeTitle: 25),
              ],
            ),
          if (widget.containerHeight > 100)
            const SizedBox(
              height: 40,
            ),
          if (widget.containerHeight > 150)
            if (screenSize.width > 300)
              if (widget.containerHeight > 100)
                Text(
                  widget.pageText,
                  style: TextStyle(
                    fontSize:
                        screenSize.width < 700 ? 13 : screenSize.width * 0.017,
                  ),
                ),
        ],
      ),
    );
  }
}
