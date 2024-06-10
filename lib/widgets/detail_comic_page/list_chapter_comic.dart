import 'package:flutter/material.dart';
import 'package:textfield_shadow/textfield_shadow.dart';

class Chapter {
  final String title;
  final String date;

  Chapter(this.title, this.date);
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
    Chapter('Chương 1', '01-01-2022'),
    Chapter('Chương 2', '01-01-2022'),
    Chapter('Chương 3', '01-01-2022'),
    Chapter('Chương 4', '01-01-2022'),
    Chapter('Chương 5', '01-01-2022'),
    Chapter('Chương 6', '01-01-2022'),
    Chapter('Chương 7', '01-01-2022'),
    Chapter('Chương 8', '01-01-2022'),
    Chapter('Chương 9', '01-01-2022'),
    Chapter('Chương 10', '01-01-2022'),
    Chapter('Chương 11', '01-01-2022'),
    Chapter('Chương 12', '01-01-2022'),
    Chapter('Chương 13', '01-01-2022'),
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(chapter.title,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    chapter.date,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              onTap: () {
                
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
