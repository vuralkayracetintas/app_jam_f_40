import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Sanırım Arızalı $url';
  }
}

var launched;
final Uri akademiMail = Uri(
    scheme: 'https', host: 'mailto:info@oyunveuygulamaakademisi.com', path: '');

final Uri akademiLinkedin = Uri(
    scheme: 'https',
    host: 'www.linkedin.com',
    path: '/company/oyun-ve-uygulama-akademisi/');
final Uri akademiInstagram = Uri(
    scheme: 'https',
    host: 'www.instagram.com',
    path: '/oyunveuygulamaakademisi/');

final Uri akademiYoutube = Uri(
    scheme: 'https',
    host: 'www.youtube.com',
    path: '/channel/UCqkkmOkMnpPJtkgPTwHrtEg/');

final Uri akademiTwitter =
    Uri(scheme: 'https', host: 'www.twitter.com', path: '/oyunveuygulama/');

final Uri akademiFacebook = Uri(
    scheme: 'https',
    host: 'www.facebook.com',
    path: '/oyunveuygulamaakademisi/');

//https://www.facebook.com/oyunveuygulamaakademisi/