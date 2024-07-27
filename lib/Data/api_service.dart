import 'dart:convert';
import 'package:comic_reader/models/comics.dart';
import 'package:comic_reader/models/genres.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseUrl = 'http://10.0.2.2:3000';

  Future<List<Comic>> fetchComics() async {
    final response = await http.get(Uri.parse('$baseUrl/comics'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Comic.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comics');
    }
  }

  Future<List<Genre>> fetchGenres() async {
    final response = await http.get(Uri.parse('$baseUrl/genres'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Genre.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load genres');
    }
  }

  Future<List<Comic>> fetchComicsByGenre(String genreName) async {
    final response = await http.get(Uri.parse('$baseUrl/genres/$genreName'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Comic.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comics by genre');
    }
  }

  Future<List<Comic>> fetchComicsByTitle(String title) async {
    final response = await http.get(Uri.parse('$baseUrl/comics'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      List<Comic> allComics =
          responseData.map((json) => Comic.fromJson(json)).toList();
      List<Comic> filteredComics = allComics
          .where((comic) =>
              comic.title?.toLowerCase().contains(title.toLowerCase()) ?? false)
          .toList();

      return filteredComics;
    } else {
      throw Exception('Failed to fetch comics');
    }
  }
}
