import 'package:appcomics/constants.dart';
import 'package:appcomics/models/books.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int storyId;
  const DetailPage({Key? key, required this.storyId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //toggle Favorite butotn
  bool toggleIsFavorated(bool isFavorated) {
    return !isFavorated;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Book> _bookList = Book.bookList;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 134, 189, 234),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            bool isFavorated = toggleIsFavorated(
                                _bookList[widget.storyId].isFavorated);
                            _bookList[widget.storyId].isFavorated = isFavorated;
                          });
                        },
                        icon: Icon(
                          _bookList[widget.storyId].isFavorated == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Constants.primaryColor,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      child: Image.asset(_bookList[widget.storyId].imageURL),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BookFeature(
                            title: 'Ngày Phát Hành',
                            bookFeature:
                                _bookList[widget.storyId].Date.toString(),
                          ),
                          BookFeature(
                            title: 'Tác Giả',
                            bookFeature: _bookList[widget.storyId].TacGia,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.3),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _bookList[widget.storyId].storyName,
                            style: TextStyle(
                              color: Color.fromARGB(255, 239, 172, 15),
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            r'Tap' + _bookList[widget.storyId].part.toString(),
                            style: TextStyle(
                              color: Color.fromARGB(221, 206, 113, 13),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _bookList[widget.storyId].rating.toString(),
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Color.fromARGB(255, 239, 172, 15),
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Expanded(
                        child: Text(
                          _bookList[widget.storyId].decription,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 18,
                            color: Constants.blackColor.withOpacity(.7),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: const Icon(
                Icons.read_more_outlined,
                color: Color.fromARGB(255, 243, 247, 17),
              ),
              decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(.3),
                    ),
                  ]),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(.3),
                      )
                    ]),
                child: const Center(
                  child: Text(
                    'DOC NGAY',
                    style: TextStyle(
                      color: Color.fromARGB(255, 216, 22, 22),
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookFeature extends StatelessWidget {
  final String bookFeature;
  final String title;
  const BookFeature({
    Key? key,
    required this.bookFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          bookFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
