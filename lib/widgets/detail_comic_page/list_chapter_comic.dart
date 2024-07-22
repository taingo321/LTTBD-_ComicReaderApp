import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:comic_reader/models/comics.dart';
import 'package:comic_reader/widgets/detail_comic_page/ReadComicPage.dart';

class ListChapterComic extends StatelessWidget {
  final List<Chapters>? chapters;

  ListChapterComic({super.key, required this.chapters});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 400,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: chapters != null
              ? chapters!.map((chapter) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tập ${chapter.title.toString()}',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    _formatDate(chapter.timestamp),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReadComicPage(chapter: chapter),
                  ),
                );
              },
            );
          }).toList()
              : [const Center(child: Text('No chapters available'))],
        ),
      ),
    );
  }

  String _formatDate(String? date) {
    if (date != null) {
      DateTime dateTime = DateTime.parse(date);
      return DateFormat('dd-MM-yyyy').format(dateTime);
    }
    return '';
  }
}
