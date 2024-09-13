import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({
    super.key,
    required this.subtitle,
  });
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                        fontSize: screenSize.width > 300
                            ? 20
                            : screenSize.width * 0.15,
                        fontWeight: FontWeight.w900,
                      ),
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
