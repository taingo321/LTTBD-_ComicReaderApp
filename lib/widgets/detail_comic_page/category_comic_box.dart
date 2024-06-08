import 'package:flutter/material.dart';

void main() {
  runApp(const CategoryComicBox());
}

class CategoryComicBox extends StatelessWidget {
  const CategoryComicBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Button Group Example'),
        ),
        body: const Center(
          child: ButtonGroup(),
        ),
      ),
    );
  }
}

class ButtonGroup extends StatelessWidget {
  const ButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 10,
      children: <Widget>[
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              backgroundColor: const Color.fromRGBO(255, 186, 106, 1),
            ),
            child: const Text('Action',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(8),
              backgroundColor: const Color.fromRGBO(255, 186, 106, 1),
            ),
            child: const Text('Comedy',
            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(8),
              backgroundColor: const Color.fromRGBO(255, 186, 106, 1),
            ),
            child: const Text('Harem',
            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              backgroundColor: const Color.fromRGBO(255, 186, 106, 1),
            ),
            child: const Text('Romance',
            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(8),
              backgroundColor: const Color.fromRGBO(255, 186, 106, 1),
            ),
            child: const Text('Shounen',
            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),       
      ],
    );
  }
}
