import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/program.dart';
import '../models/track.dart';

class ApiService {
  static const String baseUrl = "http://192.168.x.x:5000/api";

  Future<List<Program>> fetchPrograms() async {
    final response = await http.get(Uri.parse('$baseUrl/programs'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Program.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch programs');
    }
  }

  Future<List<Track>> fetchProgramDetails(String programId) async {
    final response = await http.get(Uri.parse('$baseUrl/programs/$programId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Track.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch program details');
    }
  }
}
