class ForgotPassword {
  String? message;
  String? token;
  String? error;

  ForgotPassword({this.message, this.token, this.error});

  ForgotPassword.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token:'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token:'] = this.token;
    data['error'] = this.error;
    return data;
  }
}