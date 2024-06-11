import 'package:appcomics/constants.dart';
import 'package:appcomics/models/books.dart';
import 'package:appcomics/ui/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Slider/SliderSyncDemo.dart';
import 'package:appcomics/filter_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late List<Book> _bookList;
  late List<String> _bookTypes;

  @override
  void initState() {
    super.initState();
    _bookList = Book.bookList;
    _bookTypes = [
      'RECOMMENDED',
      'NỔI BẬT',
      'MỚI NHẤT',
      'THỂ LOẠI',
      'ĐÁNH GIÁ',
    ];
  }

  bool toggleIsFavorated(bool isFavorated) {
    return !isFavorated;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              _buildCategorySelector(size),
              _buildHorizontalBookList(size),
              _buildSectionTitle('Mới Cập Nhật'),
              _buildVerticalBookList(size),
              _buildSectionTitle('Truyện nổi bật'),
              FilterBar(),
              _buildHorizontalBookListWeakMonthYear(size)
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCategorySelector(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 50.0,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _bookTypes.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Text(
                _bookTypes[index],
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.w300,
                  color: selectedIndex == index
                      ? Constants.primaryColor
                      : Constants.blackColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHorizontalBookList(Size size) {
    return SizedBox(
      height: size.height * .3,
      child: ListView.builder(
        itemCount: _bookList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: DetailPage(
                    storyId: _bookList[index].storyId,
                  ),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: Container(
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 20,
                    child: _buildFavoriteButton(index),
                  ),
                  Positioned(
                    left: 50,
                    right: 50,
                    top: 50,
                    bottom: 50,
                    child: Image.asset(_bookList[index].imageURL),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 20,
                    child: _buildBookInfo(index),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 20,
                    child: _buildPartIndicator(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFavoriteButton(int index) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            bool isFavorated = toggleIsFavorated(_bookList[index].isFavorated);
            _bookList[index].isFavorated = isFavorated;
          });
        },
        icon: Icon(
          _bookList[index].isFavorated
              ? Icons.favorite
              : Icons.favorite_border,
          color: Constants.primaryColor,
        ),
        iconSize: 30,
      ),
    );
  }

  Widget _buildBookInfo(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _bookList[index].category,
          style: const TextStyle(
            color: Color.fromARGB(179, 177, 72, 51),
            fontSize: 14,
          ),
        ),
        Text(
          _bookList[index].storyName,
          style: const TextStyle(
            color: Color.fromARGB(255, 234, 112, 46),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPartIndicator(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 99, 110, 185),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Tập ${_bookList[index].part}',
        style: TextStyle(
          color: Constants.primaryColor,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildVerticalBookList(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: size.height * .5,
      child: ListView.builder(
        itemCount: _bookList.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: DetailPage(
                    storyId: _bookList[index].storyId,
                  ),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(137, 187, 181, 181),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 80.0,
              padding: const EdgeInsets.only(left: 10, top: 10),
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.8),
                          shape: BoxShape.rectangle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            _bookList[index].imageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_bookList[index].category),
                            Text(
                              _bookList[index].storyName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Constants.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Tập ${_bookList[index].part}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Widget _buildHorizontalBookListWeakMonthYear(Size size) {
    return SizedBox(
      height: size.height * 0.4,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: _bookList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: DetailPage(
                    storyId: _bookList[index].storyId,
                  ),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10, left: 10),
              padding: EdgeInsets.all(5),
              width: size.width * 0.4, // Điều chỉnh chiều rộng của container
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Center(
                        child: Image.asset(
                          _bookList[index].imageURL,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _bookList[index].category,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            _bookList[index].storyName,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Tập ${_bookList[index].part}',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
