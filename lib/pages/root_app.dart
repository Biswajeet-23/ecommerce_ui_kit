import 'package:flutter/material.dart';
import 'package:ecommerce_ui_kit/json/constant.dart';
import 'package:ecommerce_ui_kit/pages/account_page.dart';
import 'package:ecommerce_ui_kit/pages/cart_page.dart';
import 'package:ecommerce_ui_kit/pages/home_page.dart';
import 'package:ecommerce_ui_kit/pages/more_page.dart';
import 'package:ecommerce_ui_kit/pages/store_page.dart';
import 'package:ecommerce_ui_kit/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  // appbar
  AppBar appbar = AppBar(
    elevation: 0.8,
    backgroundColor: Colors.white,
    title: Text(
      "Default Title",
      style: TextStyle(color: Colors.black),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        StorePage(),
        AccountPage(),
        CartPage(),
        MorePage()
      ],
    );
  }

  AppBar? getAppBar() {
    switch (activeTab) {
      case 0:
        return null;
      case 1:
        return null;
      case 2:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: Text(
            "ACCOUNT",
            style: TextStyle(color: black),
          ),
        );
      case 3:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: Text(
            "CART",
            style: TextStyle(color: black),
          ),
        );
      case 4:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: Text(
            "MORE",
            style: TextStyle(color: black),
          ),
        );
      default:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: Text(
            "Default",
            style: TextStyle(color: black),
          ),
        );
    }
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(itemsTab.length, (index) {
              return IconButton(
                  icon: Icon(
                    itemsTab[index]['icon'],
                    size: itemsTab[index]['size'],
                    color: activeTab == index ? accent : black,
                  ),
                  onPressed: () {
                    setState(() {
                      activeTab = index;
                    });
                  });
            })),
      ),
    );
  }
}
