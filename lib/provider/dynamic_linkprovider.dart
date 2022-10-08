import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fugipie_inventory/componants/stocklistitem.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';

class DynamicLinkService {
  static Future<String> CreateDynamic(bool short, SalesProducts salesdata) async {
    String _linkmessage;

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link:
          Uri.parse("https://www.fugipie.com/salesdata?id=${salesdata.docId}"),
      uriPrefix: "https://fugipie.page.link",
      androidParameters: const AndroidParameters(
        packageName: "com.example.fugipie_inventory",
        minimumVersion: 0,
      ),
    );
    Uri url;
    if (short) {
      final ShortDynamicLink shortLink =
          await FirebaseDynamicLinks.instance.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await FirebaseDynamicLinks.instance.buildLink(parameters);
    }
    _linkmessage = url.toString();
    return _linkmessage;
  }

  static Future<void>? initdyanamiclink(BuildContext context) async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamiclinkdata) async {
      final Uri deeplink = dynamiclinkdata.link;
       bool isStroy = deeplink.pathSegments.contains('salesdata');

//  final Uri uri = dynamiclinkdata.link;
//       final quarryparams = uri.queryParameters;
      if (isStroy) {
        String? id = deeplink.queryParameters['id'];
        if (deeplink != null) {
          try {
            await FirebaseFirestore.instance
                .collection('stocklist')
                .doc(id)
                .get()
                .then((snapshot) {
              SalesProducts salesProducts =
                  SalesProducts.fromsnapshot(snapshot);
              return Navigator.of(context).push(
               
                  MaterialPageRoute(
                      builder: (context) =>
                          StockListItem(data: salesProducts),),);
            },);
          } catch (e) {
            print(e);
          }
        } else {
          return null;
        }
      }
    }, onError: (e) async {
      print(" error on loading page" + e);
    });

    final PendingDynamicLinkData? pendingDynamicLinkData =await FirebaseDynamicLinks.instance.getInitialLink();

    final Uri? deeplink = pendingDynamicLinkData?.link;

    bool? isStroy = deeplink?.pathSegments.contains('salesdata');

    if (isStroy ?? true) {
      String? id = deeplink?.queryParameters['id'];
      if (deeplink != null) {
        try {
          await FirebaseFirestore.instance
              .collection('stocklist')
              .doc(id)
              .get()
              .then((snapshot) {
            SalesProducts salesProducts = SalesProducts.fromsnapshot(snapshot);
            return Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StockListItem(data: salesProducts)));
          });
        } catch (e) {
          print(e);
        }
      } else {
        return null;
      }
    }
  }
}
