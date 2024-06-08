import 'package:flutter/material.dart';
import 'package:textfield_shadow/textfield_shadow.dart';
import 'widgets/detail comic page/category_comic_box.dart';
import 'widgets/detail comic page/content_comic_box.dart';
import 'widgets/detail comic page/list_chapter_comic.dart';

void main() {
  runApp(const MaterialApp(
    home: DetailComicPage(),
  ));
}
class DetailComicPage extends StatefulWidget {
  const DetailComicPage({super.key});

  @override
  State<DetailComicPage> createState() => _DetailComicPageState();
}

class _DetailComicPageState extends State<DetailComicPage> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Center(
                child:  Text("DOCTRUYENHANH",
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
                          colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.4), BlendMode.srcATop), 
                          child: Image.asset('anh_mau_1.png',
                          fit: BoxFit.cover,              
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
                              height: 170,
                              width: 120,
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
                                  child: Image.asset(
                                    'anh_mau_2.png',
                                    fit: BoxFit.cover,
                                  ),                               
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Nisekoi",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Komi Naoshi",
                              style: TextStyle(
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
                        Color.fromRGBO(39, 106, 212, 1), // Màu đỏ
                        Color.fromRGBO(81, 15, 131, 76), // Màu vàng
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
                      const Padding(
                        padding: EdgeInsets.only(left: 16, right: 16), // Thêm padding bên trái                       
                        child: ButtonGroup(),                        
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
                      const Padding(
                        padding: EdgeInsets.only(left: 16,right: 16), // Thêm padding bên trái                       
                        child: ContentBox(),                        
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(209,213,219,1),
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20), 
                              textStyle: const TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                              ),
                              ),
                              child: const Text('Đọc từ đầu',
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
                        padding: const EdgeInsets.only(left: 16,right: 16),
                        child: ListChapterComic(),
                      ),
                    ],
                  ),
                  
                ),
              ],            
            ),
          ),
        ),
      );  
  }
}