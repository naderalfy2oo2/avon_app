import 'package:dio/dio.dart';

class DioHelper {
  static const baseURL = "https://cosmatics.growfet.com/";
  static String? token;

  static Future<CustomResponse> postData({
    String path = "",
    Map<String, dynamic>? data,
  }) async {
    return await SendData(path: path, data: data);
  }

  static Future<CustomResponse> putData({
    String path = "",
    Map<String, dynamic>? data,
  }) async {
    return await SendData(path: path, data: data);
  }

  static Future<CustomResponse> deleteData({required String path}) async {
    try {
      final resp = await Dio(
        BaseOptions(
          baseUrl: baseURL,
          headers: {
            "accept": "application/json",
            "contact_type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      ).delete(path);

      return CustomResponse(isSucess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponse(
        isSucess: false,
        msg: (ex.response?.data is Map)
            ? ex.response?.data["message"]
            : ex.response?.data?.toString() ?? "Error",
      );
    }
  }

  static Future<CustomResponse> getData(String s, {String path = ""}) async {
    try {
      final resp = await Dio(
        BaseOptions(
          baseUrl: baseURL,
          headers: {
            "accept": "application/json",
            "contact_type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      ).get(path);

      print(resp.data);

      return CustomResponse(isSucess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponse(
        isSucess: false,
        // msg: ex.response?.data?["message"] ?? "Error",
      );
    }
  }

  static Future<CustomResponse> SendData({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final resp = await Dio(
        BaseOptions(
          baseUrl: baseURL,
          headers: {
            "accept": "application/json",
            "contact_type": "application/json",

            "Authorization": "Bearer $token",
          },
        ),
      ).post(path, data: data, queryParameters: query);

      print(resp.data);

      return CustomResponse(isSucess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponse(
        isSucess: false,

        // msg: ex.response?.data?["message"] ?? "Error",
        msg: (ex.response?.data is Map)
            ? ex.response?.data["message"]
            : ex.response?.data?.toString() ?? "Error",
      );
    }
  }
}

class CustomResponse {
  final bool isSucess;
  final String? msg;
  final dynamic data;

  CustomResponse({required this.isSucess, this.msg, this.data});
}
