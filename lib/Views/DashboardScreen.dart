
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_attendance/Views/AnalyticsScreen.dart';
import 'SalesOrderScreen.dart';
import 'SalesVisitScreen.dart';
import 'SellerScreen.dart';
import 'AccountScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen();

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int currentIndex = 0;


  List<NavigatorItem> navigatorItems = [
    NavigatorItem("Dashboard", "assets/icons/dashboard.svg", 0, AnalyticsScreen()),
    NavigatorItem("Sellers", "assets/icons/seller.svg", 1, SellerScreen()),
    NavigatorItem("Sales Order", "assets/icons/sales-order.svg", 2, SalesOrderScreen()),
    NavigatorItem("Sales Visit", "assets/icons/salesVisit.svg", 3, SalesVisitScreen()),
    // NavigatorItem(
    //     "Favourite", "assets/icons/favourite_icon.svg", 3, FavouriteScreen()),
    NavigatorItem("Account", "assets/icons/account_icon.svg", 4, AccountScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigatorItems[currentIndex].screen,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 37,
                offset: Offset(0, -12)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff53B175),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedItemColor: Colors.black,
            items: navigatorItems.map((e) {
              return getNavigationBarItem(
                  label: e.label, index: e.index, iconPath: e.iconPath);
            }).toList(),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getNavigationBarItem(
      {String label, String iconPath, int index}) {
    Color iconColor =
    index == currentIndex ? Color(0xff53B175) : Colors.black;
    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(
        iconPath,
        color: iconColor,
        height: 30,
      ),
    );
  }
}

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}