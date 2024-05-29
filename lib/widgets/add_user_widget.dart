import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/users.dart';

class AddUserWidget extends StatefulWidget {
  @override
  _AddUserWidgetState createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      if (_formKey.currentState?.validate() ?? false) {
        Users newUser = Users(
          username: _usernameController.text,
          password: _passwordController.text,
          email: _emailController.text,
        );

        return users
            .add(newUser.toMap())
            .then((value) => print('User aded'))
            .catchError((error) => print('Failed to add user: $error'));
      }
      return Future.value();
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'Tên tài khoản'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập tên tài khoản';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Mật khẩu'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập mật khẩu';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(onPressed: addUser, child: const Text('Thêm người dùng'))
        ],
      ),
    );
  }
}
