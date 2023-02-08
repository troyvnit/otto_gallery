import 'dart:convert';

import 'package:otto_gallery/models/photo_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<PhotoModel>> getPhotos(int page, int limit) async {
    final response = await http.get(Uri.https(
        'picsum.photos', '/v2/list', {'page': '$page', 'limit': '$limit'}));
    if (response.statusCode < 400) {
      final responseBodyAsMap = jsonDecode(response.body);
      final photoMaps = responseBodyAsMap as List;
      return photoMaps
          .map((photoMap) => PhotoModel.fromJson(photoMap))
          .toList();
    }

    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }
}
