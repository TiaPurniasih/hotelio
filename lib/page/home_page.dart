
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelio_3/config/app_asset.dart';
import 'package:hotelio_3/config/app_color.dart';
import 'package:hotelio_3/page/history_page.dart';
import 'package:hotelio_3/page/nearby_page.dart';

import '../controller/c_home.dart';


class HomePage extends StatelessWidget{
  HomePage({Key? key}) : super(key: key);
  final cHome = Get.put(CHome());
  final List<Map> listNav = [
    {'icon': AppAsset.iconNearby, 'label': 'Nearby'},
    {'icon': AppAsset.iconHistory, 'label': 'History'},
    {'icon': AppAsset.iconPayment, 'label': 'Payment'},
    {'icon': AppAsset.iconReward, 'label': 'Reward'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (cHome.indexPage == 1) {
          return HistoryPage();
        }
        return NearbyPage();
      }),
      bottomNavigationBar: Obx(
        () {
          return Material(
            elevation: 8,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 8, bottom: 6),
              child: BottomNavigationBar(
                currentIndex: cHome.indexPage,
                onTap: (value) => cHome.indexPage=value,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.black,
                selectedIconTheme: const IconThemeData(
                  color: AppColor.primary,
                ),
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                selectedFontSize: 12,
                items: listNav.map((e) {
                return BottomNavigationBarItem(icon: ImageIcon(AssetImage(e['icon'])),
                label: e['label'],
                );
              }).toList()),
            ),
          );
        }
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('CHome', CHome));
  }
}