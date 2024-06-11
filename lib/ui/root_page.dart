import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:appcomics/constants.dart';

import 'package:appcomics/ui/screens/home_page.dart';
import 'package:appcomics/ui/screens/profile_page.dart';
import 'package:appcomics/ui/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  // List of the pages
  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  // List of the pages icons
  final List<IconData> _iconList = [
    Icons.home,
    Icons.search,
    Icons.person,
  ];

  // List of the pages titles
  final List<String> _titleList = [
    'Home',
    'Search',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Constants.blackColor,
              size: 30.0,
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(_iconList[1]),
              iconSize: _bottomNavIndex == 1 ? 50.0 : 40.0,
              color: _bottomNavIndex == 1 ? Colors.blue : Colors.black.withOpacity(.5),
              onPressed: () {
                setState(() {
                  _bottomNavIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(_iconList[0]),
              iconSize: _bottomNavIndex == 0 ? 50.0 : 40.0,
              color: _bottomNavIndex == 0 ? Colors.blue : Colors.black.withOpacity(.5),
              onPressed: () {
                setState(() {
                  _bottomNavIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(_iconList[2]),
              iconSize: _bottomNavIndex == 2 ? 50.0 : 40.0,
              color: _bottomNavIndex == 2 ? Colors.blue : Colors.black.withOpacity(.5),
              onPressed: () {
                setState(() {
                  _bottomNavIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
