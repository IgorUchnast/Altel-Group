import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({
    super.key,
    required this.subtitle,
    required this.fontSizeSubtitle,
  });
  final String subtitle;
  final double fontSizeSubtitle;

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
                      style: TextStyle(
                        fontSize: fontSizeSubtitle,
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
