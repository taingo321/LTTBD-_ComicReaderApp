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
    final categories = ['Action', 'Comedy', 'Harem', 'Romance', 'Shounen'];
    return Column(
      children: [
        Wrap(
          spacing: 10, 
          runSpacing: 10, 
          children: categories.map((category) {
            return SizedBox(
              width: 100, 
              height: 40, 
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8), // Điều chỉnh padding
                  backgroundColor: const Color.fromRGBO(255, 186, 106, 1),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 15, // Điều chỉnh kích thước chữ
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
