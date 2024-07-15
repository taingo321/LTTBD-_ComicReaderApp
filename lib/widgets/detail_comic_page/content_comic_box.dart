import 'package:flutter/material.dart';
import 'package:comic_reader/models/comics.dart';


class ContentComicBox extends StatelessWidget {
  final List<Comic>? comic;

  ContentComicBox({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Story Box',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContentBox(),
    );
  }
}

class ContentBox extends StatelessWidget {
  const ContentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4,
      child: SizedBox(
        width: 800,
        height: 200,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Em sẽ giữ chìa, còn anh sẽ giữ ổ khóa. Sau này nếu mình được gặp lại nhau thì đây sẽ là thứ chúng ta dùng để nhận ra nhau, và khi đó, chúng ta sẽ cưới nhau.\n\n'
                  'Tuổi thơ con người thật hồn nhiên và trong sáng, nhìn cảnh hai đứa trẻ mới tí tuổi đầu đã nói mấy lời đỡ không nổi như thế thật đáng yêu biết bao\n\n'
                  'Con người là thế, ai cũng mong rằng mọi thứ sẽ có được một kết quả như những câu chuyện cổ tích...\n\n'
                  'Rồi cái ngày định mệnh, ngày hai đứa gặp lại,\n',
                  style: TextStyle(
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
