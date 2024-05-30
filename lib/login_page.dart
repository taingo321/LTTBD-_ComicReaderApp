import 'package:comic_reader/sign_in_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _selectedIndex = 0;
  List<Widget> screens = [Home(), Search(), ListAlt(), Notifications(), AccountCircle()];
  Widget _selectedScreen = Home();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _isTextfieldEmpty = true;

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(_onFocusChange);
    _passwordFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _usernameFocusNode.removeListener(_onFocusChange);
    _passwordFocusNode.removeListener(_onFocusChange);
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(39, 106, 212, 1),
                Color.fromRGBO(81, 15, 131, 76),
              ],
            ),
          ),

          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DOCTRUYENNHANH',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 38,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 20, 0),
                        child: TextField(
                          focusNode: _usernameFocusNode,
                          onChanged: (value) {
                            setState(() {
                              _isTextfieldEmpty = value.isEmpty;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 1, right: 5),
                              child: Icon(
                                  Icons.person, color: Colors.grey, size: 35),
                            ),
                            labelText: 'Nhập tên tài khoản',
                            labelStyle: TextStyle(
                              color: _usernameFocusNode.hasFocus || !_isTextfieldEmpty
                                  ? Colors.grey
                                  : Colors.grey.shade700,
                              fontSize: _usernameFocusNode.hasFocus || !_isTextfieldEmpty ? 15 : 22,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 20, 0),
                        child: TextField(
                          focusNode: _passwordFocusNode,
                          onChanged: (value) {
                            setState(() {
                              _isTextfieldEmpty = value.isEmpty;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 1, right: 5),
                              child: Icon(
                                  Icons.lock, color: Colors.grey, size: 35),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(left: 25, right: 1),
                              child: Icon(
                                  Icons.remove_red_eye, color: Colors.grey, size: 35),
                            ),
                            labelText: 'Nhập mật khẩu',
                            labelStyle: TextStyle(
                              color: _passwordFocusNode.hasFocus ||
                                  !_isTextfieldEmpty
                                  ? Colors.grey
                                  : Colors.grey.shade700,
                              fontSize: _passwordFocusNode.hasFocus || !_isTextfieldEmpty ? 15 : 22,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(onPressed: () {},
                    child: Text("Quên mật khẩu",
                      style: TextStyle(
                        color: Color(0xFFEf6969),
                        fontSize: 20,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 410,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 186, 106, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Không có tài khoản?",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage(),
                          ));
                      },
                          child: Text("Đăng ký",
                            style: TextStyle(
                              color: Color(0xFFEf6969),
                              fontSize: 20,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      )
                    ],
                  ),
                  SizedBox(height: 27),
                  Image.asset(
                    'assets/Line 29.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/Gmail_icon 1.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/facebook_icon.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.black87,
                  ),
                  label: "Trang chủ",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search,
                    size: 30,
                    color: Colors.black87,
                  ),
                  label: "Tìm kiếm"
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list_alt,
                    size: 30,
                    color: Colors.black87,
                  ),
                  label: "Danh mục"
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.black87,
                  ),
                  label: "Thông báo"
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.account_circle,
                      size: 30,
                      color: Colors.black87,
                  ),
                  label: "Tài khoản"
              ),
            ],
            selectedItemColor: Colors.black87, // Màu sắc của label được chọn
            unselectedItemColor: Colors.black87, // Màu sắc của label chưa được chọn
            selectedLabelStyle: TextStyle(
              fontSize: 18, // Kích cỡ của label được chọn
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 10, // Kích cỡ của label chưa được chọn
              color: Colors.black87, // Màu sắc của label chưa được chọn
            ),
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                _selectedScreen = screens[index];
              });
            }
        ),
      ),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}

class MyCustomBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Custom Body'),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search'),
    );
  }
}

class ListAlt extends StatelessWidget {
  const ListAlt({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('List Alt'),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notifications'),
    );
  }
}
class AccountCircle extends StatelessWidget {
  const AccountCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Account Circle'),
    );
  }
}



void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
