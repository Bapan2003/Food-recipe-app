import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHelper{
  /// to check internet connection
  static checkInternetConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }


  static openUrl(String url) {
    _launchUrl(url);
  }

  static Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url),
          // mode: LaunchMode.platformDefault,
          mode: LaunchMode.externalApplication,
          webViewConfiguration:
          const WebViewConfiguration(enableJavaScript: true));
    } else {
      throw 'Could not launch $url';
    }
  }
}