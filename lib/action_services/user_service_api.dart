import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

Future<dynamic> registerStudent(Map<String, dynamic> formData) async {
  const apiUrl =
      'https://us-central1-ashesi-network.cloudfunctions.net/social_network/register';
  final url = Uri.parse(apiUrl);
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final body = jsonEncode(formData);
  final response = await http.post(url, headers: headers, body: body);
  print(response);
  if (response.statusCode != 500 || response.statusCode != 409) {
    print('registration succes');
    return json.decode(response.body)['user_id'];
  } else {
    throw Exception('Failed to submit form data');
  }
}

Future<Map> getStudent(String userId) async {
  final apiUrl =
      'https://us-central1-ashesi-network.cloudfunctions.net/social_network/users/$userId';
  final url = Uri.parse(apiUrl);
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  final response = await http.get(url, headers: headers);
  print(response);
  if (response.statusCode != 500 || response.statusCode != 404) {
    print(json.decode(response.body)['user']);
    return json.decode(response.body)['user'];
  } else {
    throw Exception('Failed to submit form data');
  }
}
