class SuccessError {
   bool? success;
   Data? data;
   ApiError? error;

  SuccessError({this.success, this.data, this.error});

  factory SuccessError.fromJson(Map<String, dynamic> json) {
    return SuccessError(
      success: json['success'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      error: json['error'] != null ? ApiError.fromJson(json['error']) : null,
    );
  }
}

class Data {
  final dynamic detail;

  Data({this.detail});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      detail: json['detail'],
    );
  }
}

class ApiError {
  final ErrorMessage? message;

  ApiError({this.message});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      message: json['message'] != null ? ErrorMessage.fromJson(json['message']) : null,
    );
  }
}

class ErrorMessage {
  final dynamic detail;

  ErrorMessage({this.detail});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
      detail: json['detail'] is Map<String, dynamic>
          ? Detail.fromJson(json['detail'])
          : json['detail'],
    );
  }
}

class Detail {
  final List<String>? email;

  Detail({this.email});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      email: json['email'] != null ? List<String>.from(json['email']) : null,
    );
  }
}
