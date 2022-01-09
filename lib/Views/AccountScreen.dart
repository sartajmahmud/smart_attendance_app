import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../helpers/column_with_seprator.dart';
import '../styles/colors.dart';
import 'app_text.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading:
                SizedBox(width: 65, height: 65, child: getImageHeader()),
                title: AppText(
                  text: "UserName",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: AppText(
                  text: "PhoneNumber/Email",
                  color: Color(0xff7C7C7C),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              Column(
                children: getChildrenWithSeperator(
                  widgets: accountItems.map((e) {
                    return getAccountItemWidget(e, context);
                  }).toList(),
                  seperator: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              logoutButton(context),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: RaisedButton(
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: Color(0xffF2F3F2),
        textColor: Colors.white,
        elevation: 0.0,
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                "assets/icons/logout_icon.svg",
              ),
            ),
            Text(
              "Log Out",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Container()
          ],
        ),
        onPressed: () {
          //User logout function
          //navigate to login screen
          Navigator.pushReplacementNamed(context,'/login');
        },
      ),
    );
  }

  Widget getImageHeader() {
    String imagePath = "assets/images/user_profile.png";
    return CircleAvatar(
      radius: 5.0,
      backgroundImage: AssetImage(imagePath),
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
    );
  }

  Widget getAccountItemWidget(AccountItem accountItem, BuildContext context) {
    return InkWell(
      onTap: (){
        switch(accountItem.label){
          case 'Orders':
          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OrderHistoryScreen()));
            Navigator.pushNamed(context, '/orderHistoryScreen');
            break;
          case 'My Details':
            Navigator.pushNamed(context, '/userDetailsScreen');
            //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UserDetailsScreen()));
            break;
          case 'Attendance':
            Navigator.pushNamed(context, '/attendanceScreen');
            break;
          case 'Notifications':
            Navigator.pushNamed(context, '/notificationsScreen');
            //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NotificationsScreen()));
            break;
          case 'Conveyance Bill':
            Navigator.pushNamed(context, '/conveyanceBillScreen');
            //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NotificationsScreen()));
            break;
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                accountItem.iconPath,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              accountItem.label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}


class AccountItem {
  final String label;
  final String iconPath;

  AccountItem(this.label, this.iconPath);
}

List<AccountItem> accountItems = [
  //AccountItem("Orders", "assets/icons/orders_icon.svg"),
  AccountItem("My Details", "assets/icons/details_icon.svg"),
  AccountItem("Attendance", "assets/icons/attendance.svg"),
  AccountItem("Conveyance Bill", "assets/icons/bill.svg"),
  // AccountItem("Delivery Access", "assets/icons/account_icons/delivery_icon.svg"),
  //AccountItem("Payment Methods", "assets/icons/account_icons/payment_icon.svg"),
  //AccountItem("Promo Card", "assets/icons/account_icons/promo_icon.svg"),
  AccountItem(
      "Notifications", "assets/icons/notification_icon.svg"),
  //AccountItem("Help", "assets/icons/account_icons/help_icon.svg"),
  //AccountItem("About", "assets/icons/account_icons/about_icon.svg"),
];
