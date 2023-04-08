import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.home,
      spacing: 10,
      spaceBetweenChildren: 20,
      backgroundColor: Color(0xffEFB304),
      overlayColor: Color(0xff9A82E9),
      children: [
        SpeedDialChild(
          child: Icon(Icons.mail),
          label: 'Mailden bize ulasin',
        ),
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.instagram),
          label: 'Mailden bize ulasin',
        ),
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.youtube),
          label: 'Mailden bize ulasin',
        ),
      ],
    );
  }
}
