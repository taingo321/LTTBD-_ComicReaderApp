import 'package:comic_reader/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),

        body: Container(
          decoration: const BoxDecoration(
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
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'DOCTRUYENNHANH',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 38,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                    Form(
                    key: _formKey,
                    child: Column(
                        children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Tài khoản",
                                  labelStyle: TextStyle(fontSize: 16,
                                                        fontFamily: 'OpenSans',
                                                        fontWeight: FontWeight.w300,),                                                     
                                  prefixIcon: Icon(Icons.person_2_outlined,
                                                  color: Colors.grey,),
                                  prefixIconConstraints: BoxConstraints(minWidth: 45),
                                ),
                                style: const TextStyle(
                                  fontSize: 16, // Kiểu chữ của nội dung nhập
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black, // Màu chữ của nội dung nhập
                                ),
                                validator: (value) {
                                if (value == null || value.isEmpty) {
                                    return 'Vui lòng nhập tên tài khoản';
                                }
                                return null;
                                },
                              ),                             
                            ),                            
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Thêm padding cho TextFormField mới
                            child: Container(
                                decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: _passwordController, 
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                      
                                      border: InputBorder.none,
                                      labelText: "Mật khẩu",
                                      labelStyle: const TextStyle(fontSize: 16,
                                                        fontFamily: 'OpenSans',
                                                        fontWeight: FontWeight.w300,),
                                      prefixIcon: const Icon(Icons.lock,
                                                      color: Colors.grey,),
                                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() { 
                                          _obscureText = !_obscureText; 
                                            });
                                          },
                                        child: Icon(
                                        _obscureText ? Icons.remove_red_eye : Icons.visibility_off, // Thay đổi icon tùy theo trạng thái
                                        size: 22,
                                        color: Colors.grey,
                                        ),
                                    ),
                                      suffixIconConstraints: BoxConstraints(minWidth: 45)
                                  ),
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                    return 'Vui lòng nhập mật khẩu';
                                    }
                                    return null;
                                  },
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),                              
                  Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(onPressed: () {},
                    child: const Text("Quên mật khẩu",
                      style: TextStyle(
                        color: Color(0xFFEf6969),
                        fontSize: 16,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 186, 106, 1),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20), 
                          textStyle: const TextStyle(
                              fontSize: 22,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600,),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                          ),
                          ),
                          child: const Text('Đăng nhập',
                          style: TextStyle(color: Colors.black87),
                          ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Không có tài khoản?",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage(),
                          ));
                      },
                      child: const Text("Đăng ký",
                        style: TextStyle(
                            color: Color(0xFFEf6969),
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 14), 
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Hoặc đăng nhập bằng",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w300),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterSocialButton(
                    onTap: () {},
                    mini: true,
                    buttonType: ButtonType.facebook,
                  ),
                  FlutterSocialButton(
                    onTap: () {},
                    mini: true,
                    buttonType: ButtonType.email,
                  ),
                  FlutterSocialButton(
                    onTap: () {},
                    mini: true,
                    buttonType: ButtonType.google,
                  ),
                ],
              )
              ],
            ),
          ),
        ),
      ),
    );       
  }
}

