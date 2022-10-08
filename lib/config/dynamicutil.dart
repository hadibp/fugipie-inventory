import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class AppUtill {
  static Future<String> buildDynamiclink() async {
    String url = 'https://fugipie.page.link';

    final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: url,
        link: Uri.parse('$url/post/56'),
        androidParameters: AndroidParameters(
            packageName: "com.example.fugipie_inventory", minimumVersion: 0),
        iosParameters:
            IOSParameters(bundleId: 'com.example.fugipie_inventory'),
            socialMetaTagParameters: SocialMetaTagParameters(description: 'ghj'));
            
    final  dynamicLink = await parameters.link;
    return dynamicLink.authority.toString();
  }
}
 