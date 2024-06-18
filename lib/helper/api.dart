// import 'dart:convert';

// import 'package:http/http.dart' as http;

// Future<dynamic> fetchData() async {
//   final uri = Uri.parse(
//       'https://thingspeak.com/channels/2540812/feed/last.json?&offset=0&location=true&results=60');
//   final response = await http.get(uri);
//   if (response.statusCode == 200) {
//     // Parse the JSON data directly
//     return json.decode(response.body);
//   } else {
//     throw Exception('Failed to load data');
//   }
// }
//tesssssssst