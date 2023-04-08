import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jam_app/pages/package/use_url.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.account_balance_outlined,
      iconTheme: const IconThemeData(color: Color(0xff7454E1)),
      spacing: 10,
      spaceBetweenChildren: 20,
      backgroundColor: const Color(0xffEFB304),
      overlayColor: const Color(0xff9A82E9),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.mail),
          label: 'info@oyunveuygulamaakademisi.com',
          onTap: () {
            launched = launchInBrowser(akademiMail);
          },
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.linkedin),
          label: 'Oyun ve Uygulama Akademisi',
          onTap: () {
            launched = launchInBrowser(akademiLinkedin);
          },
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.instagram),
          label: 'oyunveuygulamaakademisi',
          onTap: () {
            launched = launchInBrowser(akademiInstagram);
          },
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.youtube),
          label: 'Oyun ve Uygulama Akademisi',
          onTap: () {
            launched = launchInBrowser(akademiYoutube);
          },
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.twitter),
          label: 'oyunveuygulama',
          onTap: () {
            launched = launchInBrowser(akademiTwitter);
          },
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.facebook),
          label: 'Oyun ve Uygulama Akademisi',
          onTap: () {
            launched = launchInBrowser(akademiFacebook);
          },
        ),
      ],
    );
  }
}
