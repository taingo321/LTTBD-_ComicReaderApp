import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Editable TextFormField Example'),
        ),
        body: Center(
          child: ListTextformfiledAccountSetting(),
        ),
      ),
    );
  }
}

class ListTextformfiledAccountSetting extends StatefulWidget {
  @override
  ListTextformfiledAccountSettingState createState() => ListTextformfiledAccountSettingState();
}

class ListTextformfiledAccountSettingState extends State<ListTextformfiledAccountSetting> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isEditingUsername = false;
  bool _isEditingPassword = false;

  @override
  void initState() {
    super.initState();
    _usernameController.text = 'Tên đăng nhập'; // tên đăng nhập mặc định
    _passwordController.text = '********'; // mật khẩu mặc định
  }

  void _toggleEditingUsername() {
    setState(() {
      _isEditingUsername = !_isEditingUsername;
    });
  }

  void _toggleEditingPassword() {
    setState(() {
      _isEditingPassword = !_isEditingPassword;
    });
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: _boxDecoration(),
                    width: double.infinity,
                    height: 50,
                    child: Align(
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: _usernameController,
                        enabled: _isEditingUsername,
                        decoration: const InputDecoration(
                          labelText: "Tên tài khoản",
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w300,
                          ),
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            color: Colors.grey,                         
                          ),
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
                ),
                IconButton(
                  icon: Icon(_isEditingUsername ? Icons.check : Icons.edit),
                  onPressed: _toggleEditingUsername,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: _boxDecoration(),
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      controller: _passwordController,
                      enabled: _isEditingPassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Mật khẩu",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w300,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
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
                IconButton(
                  icon: Icon(_isEditingPassword ? Icons.check : Icons.edit),
                  onPressed: _toggleEditingPassword,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Perform form submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form submitted')),
                  );
                }
              },
              child: Text('Xác nhận'),
            ),
          ],
        ),
      ),
    );
  }
}
