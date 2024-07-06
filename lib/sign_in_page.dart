import 'package:comic_reader/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

void main() {
  runApp(MaterialApp(
    home: SignInPage(),
  ));
}
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmationpasswordController = TextEditingController();
  

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
                Color.fromRGBO(81, 15, 131, 0.76),
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Center(
                      child: Text(
                        'Đăng ký',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          
                        ),
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
                                      labelText: "Tên Tài khoản",
                                      labelStyle: TextStyle(fontSize: 16,
                                                            fontFamily: 'OpenSans',
                                                            fontWeight: FontWeight.w300,),                                                     
                                      prefixIcon: Icon(Icons.person_outline,
                                                      color: Colors.grey,),
                                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16, 
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black, 
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
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Email",
                                      labelStyle: TextStyle(fontSize: 16,
                                                            fontFamily: 'OpenSans',
                                                            fontWeight: FontWeight.w300,),                                                     
                                      prefixIcon: Icon(Icons.email_outlined,
                                                      color: Colors.grey,),
                                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16, 
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black, 
                                    ),
                                    validator: (value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập Email';
                                    }
                                    return null;
                                    },
                                  ),                             
                                ),                            
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Mật khẩu",
                                      labelStyle: TextStyle(fontSize: 16,
                                                            fontFamily: 'OpenSans',
                                                            fontWeight: FontWeight.w300,),                                                     
                                      prefixIcon: Icon(Icons.lock_outline,
                                                      color: Colors.grey,),
                                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16, 
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black, 
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                    controller: _confirmationpasswordController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Xác nhận Mật khẩu",
                                      labelStyle: TextStyle(fontSize: 16,
                                                            fontFamily: 'OpenSans',
                                                            fontWeight: FontWeight.w300,),                                                     
                                      prefixIcon: Icon(Icons.lock_outline,
                                                      color: Colors.grey,),
                                      prefixIconConstraints: BoxConstraints(minWidth: 45),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16, 
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black, 
                                    ),
                                    validator: (value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập xác nhận Mật khẩu';
                                    }
                                    return null;
                                    },
                                  ),                             
                                ),                            
                              ),
                            ],
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
                              child: const Text('Đăng ký',
                              style: TextStyle(color: Colors.black87),
                              ),
                          ),
                        ),
                      ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Đã có tài khoản?",
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
                            MaterialPageRoute(builder: (context) => LoginPage(),
                            ));
                      },
                        child: const Text("Đăng nhập",
                          style: TextStyle(
                            color: Color(0xFFEf6969),
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w300,
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
                            child: Text("Hoặc đăng ký bằng",
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
                  ),                  
                ],
              ),
            ),
          ),
        ),
      );
  }
}


