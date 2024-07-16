import 'package:flutter/material.dart';
import 'package:comic_reader/models/comics.dart';

class ReadComicPage extends StatefulWidget {
  final Chapters chapter;

  const ReadComicPage({Key? key, required this.chapter}) : super(key: key);

  @override
  _ReadComicPageState createState() => _ReadComicPageState();
}

class _ReadComicPageState extends State<ReadComicPage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.comment),
          ),
          IconButton(
            onPressed: () {
              _scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            icon: Icon(Icons.arrow_upward),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.chapter.images?.length,
          itemBuilder: (context, index) {
            return Image.network(
              widget.chapter.images?[index].imageUrl ?? '',
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.width *
                  (4 / 3), // Chiều cao tương ứng với tỉ lệ 4:3
            );
          },
        ),
      ),
    );
  }
}
