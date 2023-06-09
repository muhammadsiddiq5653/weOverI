import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'export.dart';

class NetworkHelperImpl extends NetworkHelper {
  final SharedPreferences storage;

  NetworkHelperImpl(this.storage);

  @override
  Future<http.Response> get(String url, {Map? headers}) async {
    print('----GET REQUEST----\nURL --> $url');
    final header = await appendHeader(headers: headers);
    print('Header --> $header');
    return http.get(Uri.parse(url), headers: header).then((
      http.Response response,
    ) async {
      print(
          '----GET RESPONSE----\nURL --> $url\nStatus Code = ${response.statusCode}\nbody = ${response.body.toString()}');

      return handleResponse(response);
    }).catchError((error) {
      throw (error);
    });
  }

  @override
  Future<http.Response> post(String url, {Map? headers, body, encoding}) async {
    print('----POST REQUEST----\nURL --> $url\nBody --> $body');
    final header = await appendHeader(headers: headers);
    print('Header --> $header');
    return http
        .post(Uri.parse(url),
            body: json.encode(body), headers: header, encoding: encoding)
        .then((http.Response response) {
      print(
          '----POST RESPONSE----\nURL --> $url\nStatus Code = ${response.statusCode}\nbody = ${response.body.toString()}');
      return handleResponse(response);
    }).catchError((error) {
      throw (error);
    });
  }

  @override
  Future<http.Response> delete(String url, {Map? headers}) async {
    final header = await appendHeader(headers: headers);
    print('Header --> $header');
    return http
        .delete(Uri.parse(url), headers: header)
        .then((http.Response response) {
      print(
          '----DELETE RESPONSE----\nURL --> $url\nStatus Code = ${response.statusCode}\nbody = ${response.body.toString()}');
      return handleResponse(response);
    }).catchError((error) {
      throw (error);
    });
  }

  @override
  Future<http.Response> put(String url, {Map? headers, body, encoding}) async {
    final header = await appendHeader(headers: headers);
    print('Header --> $header');

    return http
        .put(Uri.parse(url),
            body: json.encode(body), headers: header, encoding: encoding)
        .then(
      (http.Response response) {
        print(
            '----PUT RESPONSE----\nURL --> $url\nStatus Code = ${response.statusCode}\nbody = ${response.body.toString()}');

        return handleResponse(response);
      },
    ).catchError((error) {
      throw (error);
    });
  }

  @override
  http.Response handleResponse(http.Response response) {
    final int statusCode = response.statusCode;
    switch (statusCode) {
      case 401:
        {
          throw Exception("Unauthorized");
        }
      case 500:
        {
          throw Exception("Internal server error");
        }
      default:
        return response;
    }
  }

  @override
  Future<Map<String, String>> appendHeader(
      {Map? headers, bool refresh = false}) async {
    try {
      headers ??= <String, String>{};
      headers["Accept"] = "application/json";
      headers["Content-Type"] = "application/json";
      if (storage.getBool('isLogedIn') ?? false) {
        headers["Authorization"] = 'Bearer ${storage.get('token')}';
      }
    } catch (e) {
      print(e.toString());
    }

    return headers as Map<String, String>;
  }
}
