import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('User Profile'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/facebook_icon.png', // Thay đổi đường dẫn tài nguyên tại đây
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'dinh duc',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildInfoField(
                labelText: "Tên người dùng",
                value: "dinh duc",
                icon: Icons.person_outline,
              ),
              _buildInfoField(
                labelText: "Email",
                value: "dinhduc123@gmail.com",
                icon: Icons.email_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoField({
    required String labelText,
    required String value,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          initialValue: value,
          enabled: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w300,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 15.0),
          ),
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: UserProfile(),
  ));
}
