import 'package:altel_group_web/widgets/subtitle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
    required this.txt,
    required this.subtitle,
  });
  final String txt;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SelectionArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          // border: Border.all(
          //   color: Colors.black.withOpacity(0.01),
          //   width: 2,
          // ),
        ),
        padding: const EdgeInsets.all(40),
        margin: EdgeInsets.fromLTRB(
          screenSize.width * 0.19,
          40,
          screenSize.width * 0.19,
          40,
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Subtitle(subtitle: subtitle, fontSizeSubtitle: 18),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
                bottom: 20,
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  txt,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
