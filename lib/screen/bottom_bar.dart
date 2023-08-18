import 'package:fixerking/screen/Categories.dart';
import 'package:fixerking/screen/manage_Service.dart';
import 'package:fixerking/screen/notification_screen.dart';
import 'package:fixerking/screen/profile_screen.dart';
import 'package:fixerking/utils/colors.dart';
import 'package:fixerking/utils/constant.dart';
import 'package:fixerking/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> bodyList = [HomeScreen(), NotificationScreen(), ManageService(), ProfileScreen()];
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor().colorBg2(),
        body: bodyList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          selectedItemColor: AppColor.PrimaryDark,
          unselectedItemColor: Color(0xff757575),
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(home),
              ),
              label: "Home"
            ),
            BottomNavigationBarItem(
                // icon: Icon(Icons.category),
                icon: ImageIcon(
                    AssetImage(notification)
                ),
                label: "Notification"
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage(
                        addIcon)
                ),
                label: "Manage Service"
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage(profile)
                ),
                label: "My Account"
            ),
          ],
        ),
        /*bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              tabItem(context, 0, home, "Home"),
              tabItem(context, 1, notification, "Notification"),
              tabItem(context, 2, addIcon, "Add Service"),
              tabItem(context, 3, profile, "My Account"),
              // IconButton(
              //   enableFeedback: false,
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.home_outlined,
              //     color: AppColor.PrimaryDark,
              //     size: 35,
              //   ),
              // ),
              // IconButton(
              //   enableFeedback: false,
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.work_outline_outlined,
              //     color: AppColor.PrimaryDark,
              //     size: 35,
              //   ),
              // ),
              // IconButton(
              //   enableFeedback: false,
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.widgets_outlined,
              //     color: AppColor.PrimaryDark,
              //     size: 35,
              //   ),
              // ),
              // IconButton(
              //   enableFeedback: false,
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.person_outline,
              //     color: AppColor.PrimaryDark,
              //     size: 35,
              //   ),
              // ),
            ],
          ),
        ),*/
      ),
    );
  }

  Widget tabItem(BuildContext context, var pos, var icon, String title) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   selectedIndex = pos;
        // });
        if (pos == 1) {
          selectedIndex = 1;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NotificationScreen()));
        }
        // if (pos == 2) {
        //   // Navigator.push(context,
        //   //     MaterialPageRoute(builder: (context) => ProfileScreen()));
        // }
        switch (pos) {
          case 0:
            selectedIndex = 0;
            break;
          case 1:
            selectedIndex = 1;
            break;
          case 2:
            selectedIndex = 2;
            break;
          case 3:
            selectedIndex = 3;
            break;
          default:
            selectedIndex = 0;
        }
        setState(() {});
      },
      child: Container(
        width: 15.63.w,
        height: 6.79.h,
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              icon,
              width: 6.94.w,
              height: 3.90.h,
              color: selectedIndex == pos
                  ? AppColor().colorPrimaryDark()
                  : Color(0xff757575),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  color: selectedIndex == pos
                      ? AppColor().colorPrimaryDark()
                      : Color(0xff757575),
                  fontFamily: fontRegular,
                  fontSize: 8.sp),
            ),
          ],
        ),
      ),
    );
  }
}
