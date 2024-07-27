import 'dart:io';
import 'package:flutter/material.dart';
import 'package:comic_reader/constants.dart';
import 'package:comic_reader/models/comics.dart';
import 'package:comic_reader/Data/api_service.dart';
import '../Slider/SliderSyncDemo.dart';
import 'package:comic_reader/widgets/detail_comic_page/detail_comic_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:provider/provider.dart';
import 'package:comic_reader/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Comic>> futureComics;

  @override
  void initState() {
    super.initState();
    futureComics = APIService().fetchComics();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          Switch(
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF276AD4), Color(0xFF510F83)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SliderSyncDemo(
                largeImageUrls: [
                  'assets/images/Slider_1.png',
                  'assets/images/a2.jpg',
                  'assets/images/a6.jpg',
                ],
                smallImageUrls: [
                  'assets/images/Slider_1.png',
                  'assets/images/a2.jpg',
                  'assets/images/a6.jpg',
                ],
              ),
              _buildSectionTitle('Mới Cập Nhật'),
              FutureBuilder<List<Comic>>(
                future: futureComics,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No comics found'));
                  } else {
                    return Column(
                      children: snapshot.data!.map((comic) {
                        return _buildComic(comic, context);
                      }).toList(),
                    );
                  }
                },
              ),
              _buildSectionTitle('Truyện nổi bật'),
              FutureBuilder<List<Comic>>(
                future: futureComics,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No comics found'));
                  } else {
                    return SizedBox(
                      height: 300,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.5,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          Comic comic = snapshot.data![index];
                          return _buildComic(comic, context);
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 16, bottom: 6, top: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
      ),
    );
  }

  Widget _buildComic(Comic comic, BuildContext context) {
    return VisibilityDetector(
      key: Key(comic.sId.toString()),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0) {
          if (mounted) {
            setState(() {});
          }
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
        child: Opacity(
          opacity: 1,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 100.0, // Increased height for better spacing
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: comic.thumbnailComic.startsWith('http')
                              ? CachedNetworkImageProvider(comic.thumbnailComic)
                              : FileImage(File(comic.thumbnailComic))
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: comic.thumbnailComic.startsWith('http')
                            ? CachedNetworkImage(
                                imageUrl: comic.thumbnailComic,
                                width: 128,
                                height: 128,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )
                            : Image.file(
                                File(comic.thumbnailComic),
                                width: 128,
                                height: 128,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error);
                                },
                              ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comic.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Constants.blackColor,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            comic.author ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Constants.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
