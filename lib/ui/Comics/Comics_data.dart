import 'dart:io';
import 'package:flutter/material.dart';
import 'package:comic_reader/constants.dart';
import 'package:comic_reader/models/comics.dart';
import 'package:comic_reader/Data/api_service.dart';

class ComicsBuilder extends StatefulWidget {
  const ComicsBuilder({Key? key}) : super(key: key);

  @override
  State<ComicsBuilder> createState() => _ComicsBuilderState();
}

class _ComicsBuilderState extends State<ComicsBuilder> {
  Future<List<Comic>> _getComic() async {
    return await APIService().fetchComics();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Comic>>(
      future: _getComic(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No comics found'));
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final itemComic = snapshot.data![index];
                return _buildComic(itemComic, context);
                return _buildComic2(itemComic, context);
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildComic(Comic co, BuildContext context) {
    return Opacity(
      opacity: 0.1,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(137, 187, 181, 181),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 100.0, // Increased height for better spacing
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage(co.thumbnailComic),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      width: 128,
                      height: 128,
                      fit: BoxFit.cover,
                      image: FileImage(File(co.thumbnailComic)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        co.title,
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
                        'Tập ${co.chapters}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Constants.primaryColor,
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
    );
  }
  Widget _buildComic2(Comic comic, BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Opacity(
            opacity: 0.1,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(137, 187, 181, 181),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 100.0, // Increased height for better spacing
                  width: 100.0,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.8),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: comic.thumbnailComic.startsWith('http')
                                ? NetworkImage(comic.thumbnailComic)
                                : AssetImage(comic.thumbnailComic) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: comic.thumbnailComic.startsWith('http')
                              ? Image.network(
                            comic.thumbnailComic,
                            width: 128,
                            height: 128,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error);
                            },
                          )
                              : Image.asset(
                            comic.thumbnailComic,
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
                              'Tập ${comic.chapters}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Constants.primaryColor,
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
          );
        },
      ),
    );
  }



}
