import 'dart:convert';
import 'package:http/http.dart' as http;


const String BASE_URL = 'https://task.itprojects.web.id';

class ApiService {

  static Future<Map<String, dynamic>> login(String nim) async {
    final url = Uri.parse('$BASE_URL/api/auth/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'username': nim, 'password': nim}),
    );
    return jsonDecode(response.body);
  }


  static Future<Map<String, dynamic>> getProducts(String token) async {
    final url = Uri.parse('$BASE_URL/api/products');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    return jsonDecode(response.body);
  }


  static Future<Map<String, dynamic>> addProduct(
    String token,
    String name,
    int price,
    String description,
  ) async {
    final url = Uri.parse('$BASE_URL/api/products');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'price': price,
        'description': description,
      }),
    );
    return jsonDecode(response.body);
  }


  static Future<Map<String, dynamic>> submitTugas(
    String token,
    String name,
    int price,
    String description,
    String githubUrl,
  ) async {
    final url = Uri.parse('$BASE_URL/api/products/submit');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'price': price,
        'description': description,
        'github_url': githubUrl,
      }),
    );
    return jsonDecode(response.body);
  }
}
