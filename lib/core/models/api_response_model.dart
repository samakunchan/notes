
class ApiResponseModel {
  List datas;
  bool error;
  String message;

   ApiResponseModel({
    required this.datas,
    this.error = false,
    required this.message
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      datas: json['datas'],
      error: json['error'],
      message: json['message'],
    );
  }
}
