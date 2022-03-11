

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'api_exception.dart';


class ApiController {
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'content-type': 'application/json; charset=utf-8',
    'lang':'en'
  };
  static void addAuthHeaders(String? token) {
    headers = {
      'Accept': 'application/json',
      'content-type': 'application/json; charset=utf-8',
    'lang':'en',
    'Authorization': 'Bearer $token'
    };
  }

  static Future<dynamic> get(url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(url,headers: headers);
      responseJson = _returnResponse(response);
    }
    on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  static Future<dynamic> post(url,body) async {
    print('Api Post, url $url');

    var responseJson;
    try {
      final response = await http.post( url,
          body: body,headers:headers );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  static Future<dynamic> put( url, dynamic body) async {
    print('Api Put, url $url');
    http.Response responseJson;
    try {
      final response = await http.put(url, body: body,headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    print(responseJson.toString());
    return responseJson;
  }

  static Future<dynamic> delete( url) async {
    print('Api delete, url $url');
    http.Response apiResponse;
    try {
      final response = await http.delete( url,headers: headers);
      apiResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return apiResponse;
  }

  static Future<dynamic> postWithFile(url,body,String? filePath,String? fileField) async {

    var responseJson;
    try {
      var request = http.MultipartRequest('POST', url);
      request.fields.addAll(body);
      if(filePath!=null) {
        request.files.add(await http.MultipartFile.fromPath(fileField!, filePath));
      }
      request.headers.addAll(headers);

      http.StreamedResponse responseStreamed = await request.send();
      responseJson = _returnResponse(await http.Response.fromStream(responseStreamed));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(json.decode(response.body.toString())['message'].toString());
      case 401:  throw UnauthorisedException(json.decode(response.body.toString())['message'].toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw InvalidInputException(json.decode(response.body.toString())['message'].toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }







}


class ENDPOINTS {
  static const String baseURL = "https://jsonplaceholder.typicode.com";

  static Uri buildUri(String segments) {
    return Uri.parse("$baseURL/$segments");
  }

  static get posts => buildUri("posts");

}




