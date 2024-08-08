class Profile {
  bool? success;
  Data? data;
  Error? error;

  Profile({this.success, this.data, this.error});

  Profile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  ProfileDetail? detail;

  Data({this.detail});

  Data.fromJson(Map<String, dynamic> json) {
    detail =
    json['detail'] != null ? new ProfileDetail.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    return data;
  }
}

class ProfileDetail {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
 String? lastLogin;
  String? dateJoined;
  String? dateOfBirth;
  String? gender;
  bool? emailVerified;
  String? profileImage;
  String? totalInvestments;

  ProfileDetail(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.lastLogin,
        this.dateJoined,
        this.dateOfBirth,
        this.gender,
        this.emailVerified,
        this.profileImage,
        this.totalInvestments});

  ProfileDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    lastLogin = json['last_login'];
    dateJoined = json['date_joined'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    emailVerified = json['email_verified'];
    profileImage = json['profile_image'];
    totalInvestments = json['total_investments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['last_login'] = this.lastLogin;
    data['date_joined'] = this.dateJoined;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['email_verified'] = this.emailVerified;
    data['profile_image'] = this.profileImage;
    data['total_investments'] = this.totalInvestments;
    return data;
  }
}

class Error {
  String? message;

  Error({this.message});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
