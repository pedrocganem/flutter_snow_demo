import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/adapters/remote_client_error.dart';
import 'package:flutter_demo/core/generics/resource.dart';

abstract class RemoteClient {
  Future<Resource<Map<String, dynamic>, RemoteClientError>> get(String url);
  Future<Resource<Map<String, dynamic>, RemoteClientError>> post(String url,
      {Map<String, dynamic> body});
}

class RemoteClientImpl implements RemoteClient {
  final _dio = Dio();

  @override
  Future<Resource<Map<String, dynamic>, RemoteClientError>> get(
      String url) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(url);
      return Resource.success(data: response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
      return Resource.failed(error: RemoteClientError.unknown);
    }
  }

  @override
  Future<Resource<Map<String, dynamic>, RemoteClientError>> post(String url,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(url, data: body);
      return Resource.success(data: response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
      return Resource.failed(error: RemoteClientError.unknown);
    }
  }
}
