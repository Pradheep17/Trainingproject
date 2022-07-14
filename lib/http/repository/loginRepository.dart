// import 'dart:convert';
// import 'dart:js';
// import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/welcome.dart';

import '../response/login_response.dart';

// Login()....https://paytm.justlogix.com/skein-membership-api/user/login'
class LoginRepository {
  static Future<dynamic> Login(
    // String username,email,phone,add,bdgp,altphn,dob,qualify,pass,cnpass,

    String name,
    String pass,
  ) async {
    try {
      var dio = Dio();

      // Response

      var response = await dio.post('http://43.204.221.33:8080/crud/loginUser',
          data: {"email": name, "password": pass});
      print(response);
      var message = response.data['token'];
      print("message--> $message");

      if (message != null) {
        print('user valid');
        return response;
        // Navigator.of(this.context).push(MaterialPageRoute(builder: (context)=>Welcome()));
      } else {
        print('null value');
      }

      // print("dssds" + response.toString());

      // LoginResponse loginResponse =
      //     LoginResponse.fromJson(response as Map<String, dynamic>);

      // return loginResponse;

      // if (response.statusCode==200) {
      //   print('successfully log in');
      // } else {
      //   print('login failed');
      // }
    } catch (e) {
      print(e);
    }
  }
}
