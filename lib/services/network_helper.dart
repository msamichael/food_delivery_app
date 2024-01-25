import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkHelper {
  final String baseUrl;

  NetworkHelper(this.baseUrl);

  Future getData({required String endpoint, required int index, required String value}) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
  if (response.statusCode == 200){
    return jsonDecode(response.body)['data'][index][value];
  }else{
    throw Exception('Failed to load data');
  }  
  }

  Future postData({required String endpoint, required  Map<String, dynamic> body}) async{
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(body),
    );

    if (response.statusCode == 201){
      return jsonDecode(response.body);
    }else{
      throw Exception('Failed to create data');
    }
  }
}