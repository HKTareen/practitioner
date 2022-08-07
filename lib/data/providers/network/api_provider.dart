import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../app/config/global_var.dart';
import 'api_endpoint.dart';


class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = Dio(BaseOptions(receiveDataWhenStatusError: true,
      connectTimeout: 60*1000, // 60 seconds
      receiveTimeout: 60*1000));

  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  Future baseGetAPI(url, auth, context,
      {successMsg, loading, bool direct = false}) async {
    try {
      Response response;
      if (auth == null || auth == true) {
        print(APIEndpoint.baseUrl + url);
        response = await _client.get(APIEndpoint.baseUrl + url,
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}"
            }));
      } else {
        print(APIEndpoint.baseUrl + url);
        response = await _client.get(APIEndpoint.baseUrl + url,
            options: Options(
                headers: <String, String>{'Content-Type': 'application/json'}));
      }
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      return e.response?.data;
    }
  }

  Future basePostAPI(url, body, auth, context,
      {successMsg, loading, bool direct = false}) async {
    try {
      Response response;
      if (auth == null || auth == true) {
        print(APIEndpoint.baseUrl + url);
        print(jsonEncode(body));
        response = await _client.post(APIEndpoint.baseUrl + url,
            data: body,
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}"
            }));
      } else {
        print(APIEndpoint.baseUrl + url);
        print(jsonEncode(body));
        response = await _client.post(APIEndpoint.baseUrl + url,
            data: body,
            options: Options(
                headers: <String, String>{'Content-Type': 'application/json'}));
      }
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      print(e.response?.data);
      return e.response?.data;
    }
  }

  Future baseMultiPartAPI(url, body, auth, context, dynamic file,
      {successMsg, loading, bool direct = false}) async {
    try {
      FormData? formData;
      _client.options.headers.addAll({"authorization": "Bearer ${Globals.authToken}"});
      Response response;
      formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
        )
      });
      response = await _client.post(
        APIEndpoint.baseUrl + url,
        data: formData,
      );

      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      print(e.response?.data);
      return e.response?.data;
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    print("exxception");
    switch (response.statusCode) {
      case 200:
        print("200");
        // print(response.data);
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        print("default");
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
