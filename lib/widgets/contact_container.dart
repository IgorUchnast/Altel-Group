import 'package:flutter/material.dart';

class ContactContainer extends StatefulWidget {
  const ContactContainer({super.key});

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
            child: const Text(
              "Dbamy o wszystko co wiąże się ze zrównoważonym biznesem. Od usług prawnych po zmieniające życie miast rozwiązania proekologiczne. ALTEL GROUP sp. z o.o. dostarcza najlepszą jakość w branży od 2001 roku.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(
            width: 300, // Można dostosować, jeśli to za dużo
            child: Column(
              children: [
                ContactButton(
                  image: "envelope",
                  text: "biuro@altel-lift.pl",
                ),
                ContactButton(
                  image: "phone",
                  text: "00 48 322 668 047",
                ),
                ContactButton(
                  image: "map_pointer",
                  text: "ul. Małobądzka 143,\n 42-500 Będzin",
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
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
