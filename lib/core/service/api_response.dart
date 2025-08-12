import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'api.dart';

class ApiResponse<T> {
  bool success;
  String msg;
  dynamic data;
  dynamic response;
  String statusCode;

  ApiResponse({
    required this.success,
    required this.msg,
    required this.data,
    required this.response,
    required this.statusCode,
  });

  factory ApiResponse.fromJson(
    String url,
    Method method,
    Object? body,
    dynamic responseData, // <-- changed to dynamic to allow List or Map
    Response apiResponse, {
    String? fetchKeyName,
  }) {
    debugPrint("$url ($method)");

    if (body != null) log(jsonEncode(body));

    String message = "";
    String code = "";
    dynamic data;

    try {
      if (responseData is Map<String, dynamic>) {
        // When API returns JSON object
        message = responseData["msg"] ?? responseData["message"] ?? "";
        code = (responseData["status"] ?? responseData["status code"] ?? apiResponse.statusCode).toString();

        if (fetchKeyName != null) {
          data = responseData[fetchKeyName];
        } else {
          data = responseData["data"] ?? responseData;
        }
      } else if (responseData is List) {
        // When API returns JSON array (like fakestoreapi.com)
        code = apiResponse.statusCode.toString();
        message = "Success";
        data = responseData;
      }

      bool isSuccess = code == "200" || code == "201";

      return ApiResponse(
        data: data,
        statusCode: code,
        success: isSuccess,
        msg: message,
        response: responseData,
      );
    } catch (e, stack) {
      log("ApiResponse parsing error: $e");
      log(stack.toString());
      throw e;
    }
  }
}
