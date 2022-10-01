import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_with_getx/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
    };
  }
  Future<dynamic> getTask(String uri) async {
    try {
      http.Response response = await http.get(Uri.parse(AppConstants.baseUrl + uri));
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<dynamic> addTask (String uri, dynamic body) async {
    try {
      http.Response response = await http.post(
        Uri.parse(AppConstants.baseUrl + uri),
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
      Get.snackbar(
        backgroundColor: Colors.green[200],
        'successful',
        'add task successfully',
      );
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<dynamic> editTask (String uri, int id, bool done) async {
    try {
      http.Response response = await http.put(
          Uri.parse("${AppConstants.baseUrl}$uri?id=$id&done=$done"),
          headers: { "Content-Type" : "application/json"});
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<dynamic> deleteTask (String uri, int id) async {
    try {
      http.Response response = await http.delete(
          Uri.parse("${AppConstants.baseUrl}$uri?id=$id"),
          headers: { "Content-Type" : "application/json"});
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}