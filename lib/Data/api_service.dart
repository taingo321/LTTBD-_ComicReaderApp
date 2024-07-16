import 'dart:convert';
import 'package:comic_reader/models/comics.dart';
import 'package:http/http.dart' as http;
class APIService {
  Future<List<Comic>> fetchComics() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/comics'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Comic.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comics');
    }
  }
}