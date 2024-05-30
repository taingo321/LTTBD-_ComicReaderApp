import 'package:comic_reader/login_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _genderFocusNode = FocusNode();
  final _birthYearFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmationpasswordFocusNode = FocusNode();

  bool _isTextfieldEmpty = true;

  @override
  void initState() {
    super.initState();
    _genderFocusNode.addListener(_onFocusChange);
    _emailFocusNode.addListener(_onFocusChange);
    _birthYearFocusNode.addListener(_onFocusChange);
    _usernameFocusNode.addListener(_onFocusChange);
    _passwordFocusNode.addListener(_onFocusChange);
    _confirmationpasswordFocusNode.addListener(_onFocusChange);


  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _genderFocusNode.removeListener(_onFocusChange);
    _emailFocusNode.removeListener(_onFocusChange);
    _birthYearFocusNode.removeListener(_onFocusChange);
    _usernameFocusNode.removeListener(_onFocusChange);
    _passwordFocusNode.removeListener(_onFocusChange);
    _confirmationpasswordFocusNode.removeListener(_onFocusChange);

    _genderFocusNode.dispose();
    _emailFocusNode.dispose();
    _birthYearFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmationpasswordFocusNode.dispose();
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
                Color.fromRGBO(81, 15, 131, 0.76),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 70), // Khoảng cách giữa "Đăng ký" và khung TextField
              Center(
                child: Text(
                  'Đăng ký',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                      focusNode: _genderFocusNode,
                      onChanged: (value) {
                        setState(() {
                          _isTextfieldEmpty = value.isEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 1, right: 5),
                          child: Icon(Icons.person, color: Colors.grey, size: 35),
                        ),
                        labelText: 'Giới tính',
                        labelStyle: TextStyle(
                          color: _genderFocusNode.hasFocus || !_isTextfieldEmpty
                              ? Colors.black87
                              : Colors.grey.shade700,
                          fontSize: _genderFocusNode.hasFocus || !_isTextfieldEmpty ? 15 : 22,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                      focusNode: _birthYearFocusNode,
                      onChanged: (value) {
                        setState(() {
                          _isTextfieldEmpty = value.isEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 1, right: 5),
                          child: Icon(Icons.calendar_today, color: Colors.grey, size: 35),
                        ),
                        labelText: 'Ngày tháng năm sinh',
                        labelStyle: TextStyle(
                          color: _birthYearFocusNode.hasFocus || !_isTextfieldEmpty
                              ? Colors.grey
                              : Colors.grey.shade700,
                          fontSize: _birthYearFocusNode.hasFocus || !_isTextfieldEmpty ? 15 : 22,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                      focusNode: _emailFocusNode,
                      onChanged: (value) {
                        setState(() {
                          _isTextfieldEmpty = value.isEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 1, right: 5),
                          child: Icon(Icons.email, color: Colors.grey, size: 35),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: _emailFocusNode.hasFocus || !_isTextfieldEmpty
                              ? Colors.grey
                              : Colors.grey.shade700,
                          fontSize: _emailFocusNode.hasFocus || !_isTextfieldEmpty ? 15 : 22,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                          child: Icon(Icons.person, color: Colors.grey, size: 35),
                        ),
                        labelText: 'Tên tài khoản',
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
              SizedBox(height: 20),
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
                          child: Icon(Icons.lock, color: Colors.grey, size: 35),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 1),
                          child: Icon(
                              Icons.remove_red_eye, color: Colors.grey, size: 35),
                        ),
                        labelText: 'Mật khẩu',
                        labelStyle: TextStyle(
                          color: _passwordFocusNode.hasFocus || !_isTextfieldEmpty
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 20, 0),
                    child: TextField(
                      focusNode: _confirmationpasswordFocusNode,
                      onChanged: (value) {
                        setState(() {
                          _isTextfieldEmpty = value.isEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 1, right: 5),
                          child: Icon(Icons.lock, color: Colors.grey, size: 35),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 1),
                          child: Icon(
                              Icons.remove_red_eye, color: Colors.grey, size: 35),
                        ),
                        labelText: 'Xác nhận mật khẩu',
                        labelStyle: TextStyle(
                          color: _confirmationpasswordFocusNode.hasFocus || !_isTextfieldEmpty
                              ? Colors.grey
                              : Colors.grey.shade700,
                          fontSize: _confirmationpasswordFocusNode.hasFocus || !_isTextfieldEmpty ? 15 : 22,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: 180,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 186, 106, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Đăng ký',
                      style: TextStyle(
                          color: Colors.black87, fontSize: 22,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Đã có tài khoản?",
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
                        MaterialPageRoute(builder: (context) => LoginPage(),
                        ));
                  },
                    child: Text("Đăng nhập",
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
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white70,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home,size: 35),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search,size: 35),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.list_alt,size: 35),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications,size: 35),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle,size: 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SignInPage(),
  ));
}
