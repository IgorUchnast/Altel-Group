// import 'package:altel_group_web/routes/routes_name.dart';
import 'package:altel_group_web/widgets/contact_container.dart';
import 'package:altel_group_web/widgets/subtitle.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey aboutUsContainerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubSubTitle(subsubTitleText: "o nas"),
          ],
        ),
        Container(
          width: screenSize.width * 0.7,
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.only(top: 10, right: 0, left: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Text(
            "Najdłużej działająca na rynku firma środowiskowa łącząca wiedzę, technologię i naukę z biznesem.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 17,
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubSubTitle(subsubTitleText: "usługi"),
          ],
        ),
        const Wrap(
          children: [
            InformationContainer(
              text: "SERWIS DŹWIGÓW",
              text1: "images/service_elevator.png",
            ),
            InformationContainer(
              text: "KONSERWACJA\n DŹWIGÓW",
              text1: "images/repair.png",
            ),
          ],
        ),
        const Wrap(
          children: [
            InformationContainer(
              text: "PLATFORMA DŹWIGOWA",
              text1: "images/wheelchair.png",
            ),
            InformationContainer(
              text: "SZKOLENIA",
              text1: "images/onboarding.png",
            ),
          ],
        ),
        const ContactContainer(),
      ],
    );
  }
}

class SubSubTitle extends StatelessWidget {
  const SubSubTitle({
    super.key,
    required this.subsubTitleText,
  });
  final String subsubTitleText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Column(
            children: [
              Text(
                subsubTitleText.toUpperCase(),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Color.fromARGB(255, 112, 112, 112),
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                color: Colors.lightBlueAccent.withOpacity(0.5),
                height: 2,
                width: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InformationContainer extends StatefulWidget {
  const InformationContainer({
    super.key,
    // required this.icon,
    required this.text,
    required this.text1,
    // required this.iconText,
  });

  // final IconData icon;
  final String text;
  final String text1;
  // final String iconText;

  @override
  State<InformationContainer> createState() => _InformationContainerState();
}

class _InformationContainerState extends State<InformationContainer> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isSelected = true;
        });
      },
      onExit: (_) {
        setState(() {
          isSelected = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            bottom: 20,
            left: 10,
            right: 10,
            top: 20,
          ),
          padding: const EdgeInsets.only(top: 40, left: 40),
          constraints: const BoxConstraints(minWidth: 300),
          // width: 500,
          width: screenSize.width * 0.4,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? Colors.grey.withOpacity(0.2)
                    : Colors.transparent,
                spreadRadius: 5,
                blurRadius: 7, // How much the shadow is blurred
                offset: const Offset(0, 3), // Changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Subtitle(
                subtitle: widget.text,
                fontSizeSubtitle: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 0,
                    ),
                    child: Image.asset(
                      widget.text1,
                      color: isSelected
                          ? Colors.lightBlue.withOpacity(0.5)
                          : Colors.black,
                      scale: 4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
