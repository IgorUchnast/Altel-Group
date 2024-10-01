import 'package:altel_group_web/widgets/subtitle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(40.0),
      margin: const EdgeInsets.all(40),
      width: screenSize.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Subtitle(subtitle: "formularz zgłoszeniowy", fontSizeSubtitle: 18)
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const TextFieldContainer(
            fieldTitle: "Imię i nazwisko",
            fieldSize: 60,
          ),
          const TextFieldContainer(
            fieldTitle: "Adres email",
            fieldSize: 60,
          ),
          const TextFieldContainer(
            fieldTitle: "Numer telefonu",
            fieldSize: 60,
          ),
          const TextFieldContainer(
            fieldTitle: "Wiadomość",
            fieldSize: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Wyślij",
                  style: GoogleFonts.roboto(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TextFieldContainer extends StatefulWidget {
  const TextFieldContainer({
    super.key,
    required this.fieldTitle,
    required this.fieldSize,
  });
  final String fieldTitle;
  final double fieldSize;
  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(20),
      width: screenSize.width * 0.7,
      height: widget.fieldSize,
      color: const Color(0xFFD0E2E8),
      child: TextField(
        decoration: InputDecoration(
          labelText: widget.fieldTitle,
          filled: true,
          fillColor: const Color(0xFFD0E2E8),
        ),
      ),
    );
  }
}
