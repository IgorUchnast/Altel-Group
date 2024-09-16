import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.subtitle,
    required this.fontSizeTitle,
  });
  final String subtitle;
  final double fontSizeTitle;

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SelectionArea(
                    child: Text(
                      subtitle.toUpperCase(),
                      style: TextStyle(
                        fontSize: fontSizeTitle,
                        fontWeight: FontWeight.w900,
                      ),
                      // textAlign: Align.,
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
