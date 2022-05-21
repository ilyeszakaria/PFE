import 'dart:convert';
import 'prefs.dart';
import 'package:http/http.dart' as http;

class Client {
  Client(this.baseUrl);

  final String baseUrl;

  Future<dynamic> get(String endpoint) async {
    var token = await getToken();
    Map<String, String> headers = token != null ? {'Authorization': token} : {};
    var res = await http.get(Uri.parse('$baseUrl$endpoint'), headers: headers);
    if (res.statusCode == 200) {
      var decodedRes = utf8.decode(res.bodyBytes);
      return jsonDecode(decodedRes);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post(String endpoint, {body}) async {
    var token = await getToken();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = token;
    }
    var res = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      body: jsonEncode(body),
      headers: headers,
    );
    var decodedRes = utf8.decode(res.bodyBytes);
    return jsonDecode(decodedRes);
  }
}

var client = Client('https://1a92-105-107-4-71.ngrok.io');
