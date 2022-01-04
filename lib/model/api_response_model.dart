class ApiResponseModel {
  bool status;
  String error;
  Object? data;

  ApiResponseModel({
    required this.status,
    required this.error,
    required this.data,
  });

  static ApiResponseModel init() => ApiResponseModel(
        status: false,
        error: "",
        data: null,
      );
}
