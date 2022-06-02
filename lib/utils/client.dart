import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'prefs.dart';
import 'package:http/http.dart' as http;

class Client {
  Client(this.baseUrl);

  final String baseUrl;

  Future<dynamic> get(String endpoint, {Map? queryParams}) async {
    var token = Globals.token;
    Map<String, String> headers = token != null ? {'Authorization': token} : {};
    var res = await http.get(
      Uri.parse(
        '$baseUrl$endpoint',
      ),
      headers: headers,
    );
    if (res.statusCode == 200) {
      var decodedRes = utf8.decode(res.bodyBytes);
      return jsonDecode(decodedRes);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    var token = Globals.token;
    Map<String, String> headers = Map();
    headers['Content-Type'] = 'application/json';

    if (token != null) {
      headers['Authorization'] = token;
    }
    var _body = jsonEncode(body);

    var res = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      body: _body,
      headers: headers,
    );
    var decodedRes = utf8.decode(res.bodyBytes);
    return jsonDecode(decodedRes);
  }

  Future audioPost(String endpoint, {file, Map<String, dynamic>? data}) async {
    var uri = Uri.parse('$baseUrl$endpoint');
    var request = http.MultipartRequest('POST', uri);
    request.files.add(
      http.MultipartFile.fromBytes(
        'audio',
        file,
        filename: 'audio.aac',
      ),
    );
    data!.forEach((key, value) {
      request.fields[key] = value.toString();
    });
    var res = await request.send();
    if (res.statusCode == 200) print('Uploaded!');
  }
}

var client = Client('http://192.168.1.108:8000');
