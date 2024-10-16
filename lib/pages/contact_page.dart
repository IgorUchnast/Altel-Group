import 'package:altel_group_web/widgets/contact_form.dart';
import 'package:altel_group_web/widgets/google_maps_view.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({
    super.key,
    required this.containerKey,
  });

  final GlobalKey? containerKey;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
    if (widget.containerKey != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollTo(widget.containerKey!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            // Container(
            //   color: Colors.amber,
            //   height: 500,
            //   width: 500,
            //   child: const MapSample(),
            // ),
            // const MapSample(),
            // Container(
            //   child: const MapSample(),
            // ),
            ContactForm(
              key: widget.containerKey,
            ),
          ],
        ),
      ],
    );
  }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
