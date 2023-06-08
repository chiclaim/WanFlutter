import 'package:url_launcher/url_launcher.dart';

class LaunchUtils {
  static Future<bool> launchByBrowser(String url) async {
    return launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
