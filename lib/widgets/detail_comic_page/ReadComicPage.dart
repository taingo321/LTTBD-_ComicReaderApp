import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import '../../models/comics.dart';
import 'list_chapter_comic.dart';

class ReadComicPage extends StatefulWidget {
  final Chapters chapter;
  final Comic comic;

  const ReadComicPage({Key? key, required this.chapter, required this.comic}) : super(key: key);

  @override
  _ReadComicPageState createState() => _ReadComicPageState();
}

class _ReadComicPageState extends State<ReadComicPage> {
  ScrollController _scrollController = ScrollController();
  bool _isBottomNavBarVisible = true;
  bool _isScrollingDown = false;
  bool _showFAB = true;
  int _currentChapterIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentChapterIndex = widget.comic.chapters?.indexOf(widget.chapter) ?? 0;

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          setState(() {
            _isScrollingDown = true;
            _isBottomNavBarVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (_isScrollingDown) {
          setState(() {
            _isScrollingDown = false;
            _isBottomNavBarVisible = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _navigateToChapter(int index) {
    if (index >= 0 && index < (widget.comic.chapters?.length ?? 0)) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ReadComicPage(
            chapter: widget.comic.chapters![index],
            comic: widget.comic,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.chapter.images?.length ?? 0,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: widget.chapter.images?[index].imageUrl ?? '',
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.width * (5 / 3),
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          },
        ),
      ),
      bottomNavigationBar: _isBottomNavBarVisible
          ? BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios),
            label: "Chap trước",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Danh sách',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_ios),
            label: "Chap sau",
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              if (_currentChapterIndex > 0) {
                _navigateToChapter(_currentChapterIndex - 1);
              }
              break;
            case 1:
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ListChapterComic(
                    chapters: widget.comic.chapters,
                    comic: widget.comic,
                  );
                },
              );
              break;
            case 2: // Chap sau
              if (_currentChapterIndex < (widget.comic.chapters?.length ?? 0) - 1) {
                _navigateToChapter(_currentChapterIndex + 1);
              }
              break;
          }
        },
      )
          : SizedBox.shrink(),
      floatingActionButton: _showFAB
          ? FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.arrow_upward),
      )
          : null,
    );
  }
}
