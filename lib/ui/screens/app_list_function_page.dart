import 'package:flutter/material.dart';
import 'package:comic_reader/ui/screens/list_item_button_setting.dart';
void main() {
  runApp(const MaterialApp(
    home: AppListFunctionPage(),
    )
  );
}
class AppListFunctionPage extends StatefulWidget {
  const AppListFunctionPage({super.key});

  @override
  State<AppListFunctionPage> createState() => AppListFunctionPageState();
}

class AppListFunctionPageState extends State<AppListFunctionPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(        
          height: MediaQuery.of(context).size.height, 
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 2, 84, 218),
                  Color.fromRGBO(30, 230, 234, 1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
            ),
          ),
          child:  Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  const SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/anh_mau_1.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                  'Phan Đình Đức',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ButtonList(),
                ],
              ),
          ),
        ),
      ),
    );
  }
}