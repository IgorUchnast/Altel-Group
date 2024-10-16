import 'package:altel_group_web/widgets/google_maps_view.dart';
import 'package:altel_group_web/widgets/subtitle.dart';
import 'package:altel_group_web/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactTabBarView extends StatefulWidget {
  const ContactTabBarView({
    super.key,
    required this.containerHeight,
    required this.pageText,
    required this.pageTitle,
  });

  final double containerHeight;
  final String pageTitle;
  final String pageText;

  @override
  State<ContactTabBarView> createState() => _ContactTabBarViewState();
}

class _ContactTabBarViewState extends State<ContactTabBarView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: widget.containerHeight > 80
          ? const EdgeInsets.only(
              top: 20,
              bottom: 20,
            )
          : const EdgeInsets.all(0),
      color: Colors.transparent,
      width: screenSize.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.containerHeight > 75)
                  const PageTitle(subtitle: "Kontakt", fontSizeTitle: 25),
                if (widget.containerHeight > 90)
                  const Subtitle(
                    subtitle: "Numer Telefonu",
                    fontSizeSubtitle: 18,
                  ),
                if (widget.containerHeight > 110)
                  const BulletPoint(textBulletPoint: "00 48 322 668 047"),
                if (widget.containerHeight > 120)
                  const BulletPoint(textBulletPoint: "00 48 322 668 047"),
                if (widget.containerHeight > 130)
                  const Subtitle(
                    subtitle: "Adres",
                    fontSizeSubtitle: 18,
                  ),
                if (widget.containerHeight > 140)
                  const BulletPoint(
                      textBulletPoint: "ul. Małobądzka 143,\n42-500 Będzin"),
                if (widget.containerHeight > 150)
                  const Subtitle(
                    subtitle: "Adres emial",
                    fontSizeSubtitle: 18,
                  ),
                if (widget.containerHeight > 160)
                  const BulletPoint(textBulletPoint: "biuro@altel-lift.pl"),
              ],
            ),
          ),
          Container(
            height: widget.containerHeight * 2,
            width: screenSize.width > 680
                ? screenSize.width * 0.65 - screenSize.width * 0.15
                : 200,
            color: Colors.white,
            // child: Image.asset("images/mapa.png", fit: BoxFit.cover),
            child: const MapSample(),
          ),
        ],
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  const BulletPoint({
    super.key,
    required this.textBulletPoint,
  });
  final String textBulletPoint;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.brightness_1,
        size: 8,
      ), // Punktor
      title: Text(
        textBulletPoint,
        textAlign: TextAlign.justify,
        style: GoogleFonts.roboto(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
