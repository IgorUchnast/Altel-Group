import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactContainer extends StatefulWidget {
  const ContactContainer({
    super.key,
    required this.contactContainerText,
    required this.iconText1,
    required this.iconText2,
    required this.iconText3,
  });
  final String contactContainerText;
  final String iconText1;
  final String iconText2;
  final String iconText3;
  @override
  State<ContactContainer> createState() => _ContactContainerState();
}

class _ContactContainerState extends State<ContactContainer> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 90, 196, 246).withOpacity(0.11),
          width: 2,
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 10,
        runSpacing: 30,
        children: [
          SizedBox(
            width: screenSize.width * 0.4,
            child: Text(
              widget.contactContainerText,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 300, // Można dostosować, jeśli to za dużo
            child: Column(
              children: [
                ContactButton(
                  image: "envelope",
                  text: widget.iconText1,
                ),
                ContactButton(
                  image: "phone",
                  text: widget.iconText2,
                ),
                ContactButton(
                  image: "map_pointer",
                  text: widget.iconText3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactButton extends StatefulWidget {
  const ContactButton({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;
  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("images/${widget.image}.png"),
        const SizedBox(
          width: 10,
        ),
        Text(
          widget.text,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        )
      ],
    );
  }
}
