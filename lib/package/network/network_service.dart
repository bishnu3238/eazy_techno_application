import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'network_failure.dart';

class NetworkService {
  // get put post delete
  // Take a URL string as parameter
  // and return Map<String, dynamic> as json
  // And do exception handling

  Future<Either<NetworkFailure, T>> get<T>(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      log(response.body);
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  Future<Either<NetworkFailure, T>> put<T>(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.put(uri); // TODO: add other parameter later;
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  Future<Either<NetworkFailure, T>> post<T>(
    String url,
    Map<String, String> body,
  ) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.post(uri, body: body);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }


      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  Future<Either<NetworkFailure, T>> delete<T>(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.delete(uri);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }





  NetworkFailure? _handleStatusCode(int code) {
    switch (code) {
      case 400:
        return NetworkFailure(error: 'Bad Request');
      case 401:
        return NetworkFailure(error: 'Unauthorized');
      case 403:
        return NetworkFailure(error: 'Forbidden');
      case 404:
        return NetworkFailure(error: 'Not Found');
      case 500:
        return NetworkFailure(error: 'Internal Server Error');
      // Add more cases as needed
      default:
        return null;
    }
  }
}
