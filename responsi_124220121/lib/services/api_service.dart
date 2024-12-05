import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/amiibo_model.dart';

class ApiService {
  static const String baseUrl = "https://www.amiiboapi.com/api/amiibo";

  static Future<List<Amiibo>> fetchAmiibos() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['amiibo'];
      return data.map<Amiibo>((json) => Amiibo.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load amiibo data");
    }
  }
}
