import 'dart:convert';

import 'package:http/http.dart' as http;

class Client {
  Client(this.baseUrl);

  final String baseUrl;

  Future<dynamic> get(String endpoint) async {
    var res = await http.get(Uri.parse('$baseUrl$endpoint'));
    return json.decode(res.body);
  }

  Future<dynamic> post(String endpoint, {body}) async {
    var res = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
    return json.decode(res.body);
  }
}

void main() async {
  var c = Client('http://ec2-13-38-118-129.eu-west-3.compute.amazonaws.com');
  // var c = Client('http://localhost:8000');

  var res = await c.post('/users/', body: {
    "firstName": "Ilyes1",
    "lastName": "Zakaria",
    "email": "usdfer1234@example.com",
    "isStudent": true,
    "isTeacher": true,
    "riwayaId": 1,
    "password": "1234"
  });
  print(res);
}

var client=Client('http://ec2-13-38-118-129.eu-west-3.compute.amazonaws.com');