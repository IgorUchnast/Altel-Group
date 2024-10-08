import 'package:altel_group_web/widgets/subtitle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerNavigator extends StatefulWidget {
  const ContainerNavigator({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    required this.subtitle,
    required this.containerText,
    required this.textNumber,
    required this.textSize,
    required this.textOpacity,
    required this.containerName,
  });
  final double containerHeight;
  final double containerWidth;
  final String subtitle;
  final String containerName;
  final List<String> containerText;
  final int textNumber;
  final double textSize;
  final double textOpacity;
  @override
  State<ContainerNavigator> createState() => _ContainerNavigatorState();
}

class _ContainerNavigatorState extends State<ContainerNavigator> {
  bool isSelected = false;
  final GlobalKey aboutUsContainerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          widget.containerName,
          extra: aboutUsContainerKey,
        );
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(
            () {
              isSelected = false;
            },
          );
        },
        child: Opacity(
          opacity: widget.textOpacity,
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.only(
              top: widget.containerHeight / 15,
              right: 10,
              left: 10,
              // right: screenSize.width > 300 ? 20 : 10,
              // left: screenSize.width > 300 ? 20 : 10,
              bottom: widget.containerHeight / 15,
            ),
            // constraints: const BoxConstraints(minHeight: 60, minWidth: 200),
            height: widget.containerHeight,
            width: widget.containerWidth,
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
              children: [
                Subtitle(
                  fontSizeSubtitle: widget.containerWidth > 300 ? 18 : 13,
                  subtitle: widget.subtitle,
                ),
                if (widget.containerHeight > 180)
                  if (widget.containerWidth > 250)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Opacity(
                        opacity: widget.textOpacity,
                        child: Text(
                          widget.containerText[widget.textNumber],
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: widget.textSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
