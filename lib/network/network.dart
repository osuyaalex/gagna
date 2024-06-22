import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gagna/network/forgot_password.dart';
import 'package:gagna/network/login_json.dart';
import 'package:gagna/network/register_json.dart';
import 'package:gagna/network/url.dart';
import 'package:gagna/network/success_error.dart';
import 'package:http/http.dart' as http;

import '../utilities/snackbar.dart';


class Network{
  Future<SuccessError> emailOtp( String email, BuildContext context) async {
    var jsonResponse;
    try {
      String url = "$apiUrl/check-email/";
      final response = await http.post(Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'X-CSRFTOKEN': xcsrfToken,
        },
        body: jsonEncode({
          "email": email
        }),
      );

      print('hhhhhhhhhhhh');
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        jsonResponse = jsonDecode(response.body);
      }else if (response.statusCode == 400) {
        jsonResponse = jsonDecode(response.body);
      } else if (response.statusCode == 201) {
        jsonResponse = jsonDecode(response.body);
      }else {
        throw Exception('Failed to load actions');
      }
    } catch (error) {
      String errorMessage = error.toString();
      print('the error isissssssisisisis ${errorMessage}');
      if (errorMessage.contains('Failed host lookup')) {
        EasyLoading.dismiss();
        snack(context, "Connection is down currently");
      } else if (errorMessage.contains('DOCTYPE HTML')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else if (errorMessage.contains('roken')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else if (errorMessage.contains('Connection reset by peer')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else {
        snack(context, errorMessage);
      }
    }

    return SuccessError.fromJson(jsonResponse);
  }

  Future<SuccessError> verification_otp( String email, String otp, BuildContext context) async {
    var jsonResponse;
    try {
      String url = "$apiUrl/verify-otp/";
      final response = await http.post(Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'X-CSRFTOKEN': 'Tlrd2o4WkOXxa0wmfO5tZS6aVtVSAjS1lt7g9X437Dhdl8X8Me27pQYEgWEudYGz',
        },
        body: jsonEncode({
          "email": email,
          "otp": otp
        }),
      );

      print('hhhhhhhhhhhh');
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        jsonResponse = jsonDecode(response.body);
      }else if (response.statusCode == 400) {
        jsonResponse = jsonDecode(response.body);
      } else if (response.statusCode == 201) {
        jsonResponse = jsonDecode(response.body);
      }else {
        throw Exception('Failed to load actions');
      }
    } catch (error) {
      String errorMessage = error.toString();
      print('the error isissssssisisisis ${errorMessage}');
      if (errorMessage.contains('Failed host lookup')) {
        EasyLoading.dismiss();
        snack(context, "Connection is down currently");
      } else if (errorMessage.contains('DOCTYPE HTML')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else if (errorMessage.contains('roken')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else if (errorMessage.contains('Connection reset by peer')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else {
        snack(context, errorMessage);
      }
    }

    return SuccessError.fromJson(jsonResponse);
  }

  Future<Register> registration( String email, String password,
      String otp, String lastName, String firstName, String gender,
      String phoneNo,BuildContext context) async {
    var jsonResponse;
    try {
      String url = "$apiUrl/register/";
      final response = await http.post(Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'X-CSRFTOKEN': "U5ylPRZKz8ueEf4DGBspPYMn8LIlnQoFmdeoWqZRmXOUPnvpd1p3fWERterX0vcd",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
          "otp": otp,
          "last_name": lastName,
          "first_name": firstName,
          "gender": gender,
          "phone_number": phoneNo
        }),
      );

      print('hhhhhhhhhhhh');
      print(jsonDecode(response.body));
      print(jsonDecode(response.statusCode.toString()));
      if (response.statusCode == 200) {
        jsonResponse = jsonDecode(response.body);
      }else if (response.statusCode == 400) {
        jsonResponse = jsonDecode(response.body);
      } else if (response.statusCode == 201) {
        jsonResponse = jsonDecode(response.body);
      }else {
        throw Exception('Failed to load actions');
      }
    } catch (error) {
      String errorMessage = error.toString();
      print('the error isissssssisisisis ${errorMessage}');
      if (errorMessage.contains('Failed host lookup')) {
        EasyLoading.dismiss();
        snack(context, "Connection is down currently");
      } else if (errorMessage.contains('DOCTYPE HTML')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else if (errorMessage.contains('roken')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else if (errorMessage.contains('Connection reset by peer')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else {
        snack(context, errorMessage);
      }
    }

    return Register.fromJson(jsonResponse);
  }

  Future<LoginJson> login( String email, String password,
     BuildContext context) async {
    var jsonResponse;
    try {
      String url = "$apiUrl/login/";
      final response = await http.post(Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'X-CSRFTOKEN': "Tlrd2o4WkOXxa0wmfO5tZS6aVtVSAjS1lt7g9X437Dhdl8X8Me27pQYEgWEudYGz",
        },
        body: jsonEncode({
          "email": email,
          "password": password
        }),
      );

      print('hhhhhhhhhhhh');
      print(jsonDecode(response.body));
      print(jsonDecode(response.statusCode.toString()));
      if (response.statusCode == 200) {
        jsonResponse = jsonDecode(response.body);
      }else if (response.statusCode == 400) {
        jsonResponse = jsonDecode(response.body);
      } else if (response.statusCode == 201) {
        jsonResponse = jsonDecode(response.body);
      }else {
        throw Exception('Failed to load actions');
      }
    } catch (error) {
      String errorMessage = error.toString();
      print('the error isissssssisisisis ${errorMessage}');
      if (errorMessage.contains('Failed host lookup')) {
        EasyLoading.dismiss();
        snack(context, "Connection is down currently");
      } else if (errorMessage.contains('DOCTYPE HTML')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else if (errorMessage.contains('roken')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else if (errorMessage.contains('Connection reset by peer')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else {
        snack(context, errorMessage);
      }
    }

    return LoginJson.fromJson(jsonResponse);
  }

  Future<ForgotPassword> forgotPassword( String email, BuildContext context) async {
    var jsonResponse;
    try {
      String url = "$apiUrl/forgot-password/";
      final response = await http.post(Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'X-CSRFTOKEN': '3OXJj3GwQIp64OGKcUXmsgf4VpNzf3DjvWDMqCGDDxJMfW7wJkU0Se7ygSwbSIrR',
        },
        body: jsonEncode({
          "email": email
        }),
      );

      print('hhhhhhhhhhhh');
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        jsonResponse = jsonDecode(response.body);
      }else if (response.statusCode == 400) {
        jsonResponse = jsonDecode(response.body);
      } else if (response.statusCode == 201) {
        jsonResponse = jsonDecode(response.body);
      }else {
        throw Exception('Failed to load actions');
      }
    } catch (error) {
      String errorMessage = error.toString();
      print('the error isissssssisisisis ${errorMessage}');
      if (errorMessage.contains('Failed host lookup')) {
        EasyLoading.dismiss();
        snack(context, "Connection is down currently");
      } else if (errorMessage.contains('DOCTYPE HTML')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else if (errorMessage.contains('roken')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else if (errorMessage.contains('Connection reset by peer')) {
        EasyLoading.dismiss();
        snack(context, "something went wrong");
      } else {
        snack(context, errorMessage);
      }
    }

    return ForgotPassword.fromJson(jsonResponse);
  }
}