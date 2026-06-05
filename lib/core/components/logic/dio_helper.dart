import 'package:dio/dio.dart';

class DioHelper {
  static const baseURL = "https://cosmatics.growfet.com/";

  static Future<CustomResponse> getData({String path = ""}) async {
    try {
      final resp = await Dio(
        BaseOptions(
          baseUrl: baseURL,
          headers: {
            "accept": "application/json",
            "Contact_type": "application/json",
          },
        ),
      ).get(path);
      print(resp.data);

      return CustomResponse(isSucess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponse(isSucess: false, msg: ex.response?.data["message"]);
    }
  }

  static Future<CustomResponse> SendData({
    String path = "",
    Map<String, dynamic>? data,
  }) async {
    try {
      final resp = await Dio(
        BaseOptions(
          baseUrl: baseURL,
          headers: {
            "accept": "application/json",
            "contact_type": "application/json",
          },
        ),
      ).post(path, data: data);
      print(resp.data);
      print(resp.data.toString());

      return CustomResponse(isSucess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponse(isSucess: false, msg: ex.response?.data["message"]);
    }
  }
}

class CustomResponse {
  final bool isSucess;
  final String? msg;
  final Map<String, dynamic>? data;

  CustomResponse({required this.isSucess, this.msg, this.data});
}
