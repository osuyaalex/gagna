class Register {
  bool? success;
  Data? data;
  Error? error;

  Register({this.success, this.data, this.error});

  Register.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  Detail? detail;

  Data({this.detail});

  Data.fromJson(Map<String, dynamic> json) {
    detail = json['detail'] != null ? Detail.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    return data;
  }
}

class Detail {
  String? email;
  String? lastName;
  String? firstName;
  String? gender;
  String? phoneNumber;

  Detail({this.email, this.lastName, this.firstName, this.gender, this.phoneNumber});

  Detail.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = this.email;
    data['last_name'] = this.lastName;
    data['first_name'] = this.firstName;
    data['gender'] = this.gender;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

class Error {
  ErrorMessage? message;

  Error({this.message});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null ? ErrorMessage.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class ErrorMessage {
  ErrorDetail? detail;

  ErrorMessage({this.detail});

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    detail = json['detail'] != null ? ErrorDetail.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    return data;
  }
}

class ErrorDetail {
  List<String>? email;
  List<String>? phoneNumber;
  List<String>? lastName;
  List<String>? firstName;
  List<String>? gender;

  ErrorDetail({this.email, this.phoneNumber, this.lastName, this.firstName, this.gender});

  ErrorDetail.fromJson(Map<String, dynamic> json) {
    email = json['email']?.cast<String>();
    phoneNumber = json['phone_number']?.cast<String>();
    lastName = json['last_name']?.cast<String>();
    firstName = json['first_name']?.cast<String>();
    gender = json['gender']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['last_name'] = this.lastName;
    data['first_name'] = this.firstName;
    data['gender'] = this.gender;
    return data;
  }
}
