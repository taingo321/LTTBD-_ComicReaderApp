import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_reader/models/comics.dart';
import 'package:comic_reader/models/genres.dart';
import 'package:comic_reader/data/api_service.dart';
import 'package:comic_reader/widgets/detail_comic_page/detail_comic_page.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SearchPage extends StatefulWidget {
  final String initialGenre;

  const SearchPage({Key? key, required this.initialGenre}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<Comic>> futureComics;
  late Future<List<Genre>> futureGenres;
  String _selectedGenre = '';
  bool _showGenres = false;
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _selectedGenre = widget.initialGenre;
    futureComics = _fetchComics();
    futureGenres = APIService().fetchGenres();
  }

  Future<List<Comic>> _fetchComics() async {
    if (_searchText.isNotEmpty) {
      return APIService().fetchComicsByTitle(_searchText);
    } else if (_selectedGenre.isNotEmpty) {
      return APIService().fetchComicsByGenre(_selectedGenre);
    } else {
      return APIService().fetchComics();
    }
  }

  Future<void> _loadComicsByGenre(String genreName) async {
    setState(() {
      _selectedGenre = genreName;
      futureComics = APIService().fetchComicsByGenre(genreName);
    });
  }

  Future<void> _searchComics(String searchText) async {
    setState(() {
      _searchText = searchText;
      futureComics = APIService().fetchComicsByTitle(searchText);
    });
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
                    color: const Color.fromARGB(137, 189, 132, 132).withOpacity(.6),
                  ),
                  Expanded(
                    child: TextField(
                      showCursor: false,
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm ...',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onChanged: _searchComics,
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Genre>>(
              future: futureGenres,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No genres available'),
                  );
                } else {
                  List<Genre> genresList = snapshot.data!;
                  return Container(
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
                  );
                }
              },
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
                child: FutureBuilder<List<Genre>>(
                  future: futureGenres,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text('No genres available'),
                      );
                    } else {
                      List<Genre> genresList = snapshot.data!;
                      return Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: genresList.map((genre) {
                          return ChoiceChip(
                            label: Text(genre.genreName ?? ''),
                            selected: _selectedGenre == genre.genreName,
                            onSelected: (bool selected) {
                              setState(() {
                                _selectedGenre = selected ? genre.genreName ?? '' : '';
                                _showGenres = false;
                                _loadComicsByGenre(_selectedGenre);
                              });
                            },
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
            Expanded(
              child: FutureBuilder<List<Comic>>(
                future: futureComics,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No data available'),
                    );
                  } else {
                    List<Comic> comics = snapshot.data!;
                    return Container(
                      width: size.width,
                      padding: const EdgeInsets.all(18.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: comics.length,
                        itemBuilder: (BuildContext context, int index) {
                          final comic = comics[index];
                          return VisibilityDetector(
                            key: Key(comic.sId.toString()),
                            onVisibilityChanged: (visibilityInfo) {
                              var visiblePercentage = visibilityInfo.visibleFraction * 100;
                              if (visiblePercentage > 50) {
                                // Do something when the comic is more than 50% visible
                              }
                            },
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailComicPage(comic: comic),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        imageUrl: comic.thumbnailComic ?? '',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 160,
                                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            comic.title ?? '',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            comic.author,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            'Views: ${comic.view}',
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
