import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:comic_reader/models/comics.dart';
import 'package:comic_reader/ui/screens/search_page.dart';
import 'list_chapter_comic.dart';

void main() {
  runApp(MaterialApp(
    home: DetailComicPage(
      comic: Comic(
        title: '',
        author: '',
        thumbnailComic: '',
        sId: '',
        timestamp: '',
        description: '',
        view: '',
        rating: '',
        genres: [],
        chapters: [],
      ),
    ),
  ));
}

class DetailComicPage extends StatefulWidget {
  final Comic comic;
  const DetailComicPage({super.key, required this.comic});

  @override
  State<DetailComicPage> createState() => _DetailComicPageState();
}

class _DetailComicPageState extends State<DetailComicPage> {
  void _navigateToSearchPage(String genre) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchPage(initialGenre: genre),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "DOCTRUYENHANH",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.grey.withOpacity(0.4),
                        BlendMode.srcATop
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.comic.thumbnailComic,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      imageBuilder: (context, imageProvider) => Image(
                        image: ResizeImage(
                          imageProvider,
                          width: MediaQuery.of(context).size.width.toInt(),
                        ),
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 190,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 15,
                                blurRadius: 17,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: widget.comic.thumbnailComic,
                              fit: BoxFit.cover,
                              width: 160,
                              height: 190,
                              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              imageBuilder: (context, imageProvider) => Image(
                                image: ResizeImage(
                                  imageProvider,
                                  width: 160,
                                  height: 190,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.comic.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.comic.author,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1600,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(39, 106, 212, 1),
                    Color.fromRGBO(81, 15, 131, 76),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Thể loại",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ButtonGroup(
                      genres: widget.comic.genres ?? [],
                      onGenreSelected: _navigateToSearchPage,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Nội dung",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ContentBox(description: widget.comic.description ?? 'No description available'),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(209, 213, 219, 1),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Đọc từ đầu',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Danh sách chương",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ListChapterComic(
                      chapters: widget.comic.chapters,
                      comic: widget.comic, // Thêm comic vào đây
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentBox extends StatelessWidget {
  final String description;

  const ContentBox({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: SizedBox(
        width: 800,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w300,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonGroup extends StatelessWidget {
  final List<String> genres;
  final void Function(String genre) onGenreSelected;

  const ButtonGroup({super.key, required this.genres, required this.onGenreSelected});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: genres.map((genre) {
        return SizedBox(
          width: 100,
          height: 40,
          child: ElevatedButton(
            onPressed: () => onGenreSelected(genre),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              backgroundColor: const Color.fromRGBO(255, 186, 106, 1),
            ),
            child: Text(
              genre,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
