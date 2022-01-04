import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/api_response_model.dart';
import '../model/photo_model.dart';
import '../model/post_model.dart';

class ApiController {
  static Future<ApiResponseModel> login(String email, String password) async {
    final url = Uri.parse("https://reqres.in/api/login");
    final response = await http.post(
      url,
      body: {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result["token"] != null) {
        return ApiResponseModel(
          status: true,
          error: "",
          data: result["token"],
        );
      }
      return ApiResponseModel(
        status: false,
        error: result["error"],
        data: null,
      );
    }
    return ApiResponseModel(
      status: false,
      error: "Somthing went wrong",
      data: null,
    );
  }

  static Future<ApiResponseModel> getPhotoList() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ApiResponseModel(
        status: true,
        error: "",
        data: PhotoModel.getPhotoList(
          json.decode(response.body),
        ),
      );
    }
    return ApiResponseModel(
      status: false,
      error: "Somthing went wrong",
      data: null,
    );
  }

  static Future<ApiResponseModel> getPostList() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ApiResponseModel(
        status: true,
        error: "",
        data: PostModel.getPostList(json.decode(response.body)),
      );
    }
    return ApiResponseModel(
      status: false,
      error: "Somthing went wrong",
      data: null,
    );
  }

  static Future<ApiResponseModel> getPostDetail(int id) async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ApiResponseModel(
        status: true,
        error: "",
        data: PostModel.fromJson((json.decode(response.body))),
      );
    }
    return ApiResponseModel(
      status: false,
      error: "Somthing went wrong",
      data: null,
    );
  }
}
