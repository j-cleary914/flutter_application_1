import 'package:http/http.dart' as http;
import 'dart:convert';

//TODO work out how to share token across entire app and use as default in here

Future basicFetch({
  required String url,
  required String method,
  Map<String, String>? headers,
  dynamic body,
}) async {
  var uri = Uri.parse(url);
  http.Response response;

  print(url);
  print(method);
  print(headers);

  if (method == 'GET') {
    response = await http.get(uri, headers: headers);
  } else if (method == 'POST') {
    response = await http.post(uri, headers: headers, body: jsonEncode(body));
  } else {
    throw Exception('method not supported.... yet');
  }

  print(response);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('error');
  }
}
