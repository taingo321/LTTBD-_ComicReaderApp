import 'package:flutter/material.dart';
import 'package:textfield_shadow/textfield_shadow.dart';

class Chapter {
  final String title;

  Chapter(this.title);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Danh sách chương truyện'),
        ),
        body: ListChapterComic(),
      ),
    );
  }
}

class ListChapterComic extends StatelessWidget {
  final List<Chapter> chapters = [
    Chapter('Chương 1'),
    Chapter('Chương 2'),
    Chapter('Chương 3'),
    Chapter('Chương 4'),
    Chapter('Chương 5'),
    Chapter('Chương 6'),
    Chapter('Chương 7'),
    Chapter('Chương 8'),
    Chapter('Chương 9'),
    Chapter('Chương 10'),
    Chapter('Chương 11'),
    Chapter('Chương 12'),
    Chapter('Chương 13'),
    // Thêm các chương khác nếu cần
  ];

  ListChapterComic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 400,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12), // Đặt bán kính bo góc ở đây
      ),
      child: SingleChildScrollView(
        child: Column(
          children: chapters.map((chapter) {
            return ListTile(
              title: Text(chapter.title,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w300,
              ),
              ),
              onTap: () {
                // Xử lý khi người dùng chọn một chương
                // Ở đây bạn có thể thực hiện hành động nào đó, chẳng hạn như hiển thị nội dung của chương
                print('Đã chọn chương ${chapter.title}');
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
