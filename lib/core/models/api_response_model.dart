class ApiResponseModel<T> {
  List<T>? data;
  bool error;
  String? errorMessage;

  ApiResponseModel({
    this.data,
    this.error = false,
    this.errorMessage
  });
}
