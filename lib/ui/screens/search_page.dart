import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appcomics/models/books.dart';
import 'package:appcomics/constants.dart';
import 'package:appcomics/ui/screens/detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  final List<String> _genres = [
    'Action',
    'Romance',
    'Comedy',
    'Horror',
    'Sci-fi',
    'Drama',
    'Fantasy',
    'Adventure'
  ];
  String _selectedGenre = '';
  bool _showGenres = false;

  late List<Book> _bookList;

  @override
  void initState() {
    super.initState();
    _bookList = Book.bookList;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF276AD4), Color(0xFF510F83)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(136, 172, 179, 228).withOpacity(.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: const Color.fromARGB(137, 189, 132, 132)
                        .withOpacity(.6),
                  ),
                  Expanded(
                    child: TextField(
                      showCursor: false,
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm ...',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.mic,
                    color: Color.fromARGB(137, 190, 135, 135).withOpacity(.6),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(_selectedGenre.isEmpty ? 'Thể loại' : _selectedGenre),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      setState(() {
                        _showGenres = !_showGenres;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (_showGenres)
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: _genres.map((genre) {
                    return ChoiceChip(
                      label: Text(genre),
                      selected: _selectedGenre == genre,
                      onSelected: (bool selected) {
                        setState(() {
                          if (_selectedGenre == genre) {
                            _selectedGenre = '';
                          } else {
                            _selectedGenre = genre;
                          }
                          _showGenres = false;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            Expanded(
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: _bookList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final book = _bookList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: DetailPage(
                              storyId: book.storyId,
                            ),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(137, 187, 181, 181),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                book.imageURL,
                                fit: BoxFit.cover,
                                height: 150,
                                width: double.infinity,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              book.storyName,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Constants.blackColor,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              book.category,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Tập ${book.part}',
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
