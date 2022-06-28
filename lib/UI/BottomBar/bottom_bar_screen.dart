import 'package:ecom_adidas_demo/UI/home_page.dart';
import 'package:ecom_adidas_demo/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:get/get.dart';
import '../../controllers/bottom_bar_screen_controller.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreenController bottomBarScreenController = Get.put(BottomBarScreenController());

  final allPage = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  BottomBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              if (bottomBarScreenController.pageIndex.value == 1 ||
                  bottomBarScreenController.pageIndex.value == 2 ||
                  bottomBarScreenController.pageIndex.value == 3 ||
                  bottomBarScreenController.pageIndex.value == 4) {
                bottomBarScreenController.pageChangeMethode(0);

                // debugPrint('tabIndex.value : ${bottomNavBarController.tabIndex.value}');
              } else if (Platform.isAndroid) {
                if (bottomBarScreenController.pageIndex.value == 0) {
                  exitAppDialog(context);
                }
              }
              return false;
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              extendBody: true,
              body: allPage[bottomBarScreenController.pageIndex.value],
              bottomNavigationBar: !bottomBarScreenController.pageChange.value
                  ? Container(
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: primaryRed, borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          navigationItem("assets/homepage.png", 0),
                          navigationItem("assets/shoppingList.png", 1),
                          navigationItem("assets/shoppingCart.png", 2),
                          navigationItem("assets/user.png", 3),
                        ],
                      ),
                    )
                  : Container(),
            ),
          ),
        ));
  }

  Future<dynamic> exitAppDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('Are you sure to want Exit?'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'NO',
                style: TextStyle(color: primaryRed),
              ),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text(
                'YES',
                style: TextStyle(color: primaryRed),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget navigationItem(String path, int i) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          bottomBarScreenController.pageChangeMethode(i);
        },
        child: Image.asset(
          path,
          width: 33,
          height: 33,
          color: bottomBarScreenController.pageIndex.value == i ? white : darkGray,
          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) => const SizedBox(),
        ),
      ),
    );
  }
}
