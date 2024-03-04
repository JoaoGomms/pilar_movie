import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../services/constants.dart';

class HttpClient {
  final baseUrl = 'api.themoviedb.org';

  final http.Client client;
  Map<String, dynamic> baseQueryParameters = {'api_key': Constants.apiKey};
  HttpClient(this.client);

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      if (queryParameters != null) baseQueryParameters.addAll(queryParameters);
      final uri = Uri.https(baseUrl, '/3$endpoint', baseQueryParameters);
      Response response = await client.get(uri);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
