
import 'package:comic_reader/constants.dart';
import 'package:comic_reader/ui/screens/home_page.dart';
import 'package:comic_reader/ui/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:comic_reader/widgets/add_new_user_widget.dart';
import 'package:comic_reader/ui/screens/app_list_function_page.dart';
class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(initialGenre: '',),
    AppListFunctionPage(),


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
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Constants.blackColor), // Icon dấu ba chấm
              onSelected: (String value) {
                // Xử lý khi người dùng chọn một mục từ menu
                setState(() {
                  // Tùy thuộc vào giá trị value để điều hướng đến trang tương ứng
                  if (value == 'login') {
                    // Chuyển sang trang AddUserWidget
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddUserWidget()),
                    );
                  } else if (value == 'register') {
                    _bottomNavIndex = 1;
                  }
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'login',
                  child: Text('Đăng nhập'),
                ),
                PopupMenuItem<String>(
                  value: 'register',
                  child: Text('Đăng kí'),
                ),
              ],
            ),
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
