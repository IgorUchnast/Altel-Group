import 'package:altel_group_web/routes/routes_name.dart';
import 'package:altel_group_web/widgets/subtitle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  });
  final double containerHeight;
  final double containerWidth;
  final String subtitle;
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
          RouteNames.aboutUs,
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
          setState(() {
            isSelected = false;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.only(
            top: widget.containerHeight / 10,
            right: 20,
            left: 20,
          ),
          constraints: const BoxConstraints(minHeight: 60, minWidth: 200),
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
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Subtitle(
                subtitle: widget.subtitle,
                fontSizeSubtitle: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Opacity(
                  opacity: widget.textOpacity,
                  child: Text(
                    widget.containerText[widget.textNumber],
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: widget.textSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
