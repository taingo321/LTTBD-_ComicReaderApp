import 'package:flutter/material.dart';

void main() {
  runApp(const ListItemButtonSetting());
}

class ListItemButtonSetting extends StatelessWidget {
  const ListItemButtonSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Button Group Example'),
        ),
        body: ButtonList(),
      ),
    );
  }
}

class ButtonList extends StatelessWidget {
  final List<Map<String, dynamic>> buttonData = [
    {'title': 'Danh sách yêu thích', 'icon': Icons.favorite},
    {'title': 'Nâng cấp tài khoản', 'icon': Icons.diamond},
    {'title': 'Lịch sử đọc truyện', 'icon': Icons.history},
    {'title': 'Cài đặt', 'icon': Icons.settings},
  ];

  ButtonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttonData.map((data) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: double.infinity,
              height: 60, // Đặt chiều cao cố định cho các nút
              child: TextButton(
                onPressed: () {
                  // Xử lý khi nút được nhấn
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  backgroundColor: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(data['icon'], color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      data['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
