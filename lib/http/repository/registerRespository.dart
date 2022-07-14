import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterRespository {
  static Future<dynamic> Register(
    String username,
    phone,
    email,
    add,
    gender,
    bdgp,
    altphn,
    dob,
    qualify,
    pass,
    cnpass,
    
  ) async {
    try {
      var dio = Dio();
      var response =
          await dio.post('http://43.204.221.33:8080/crud/createUser', data: {
        "username": username,
        "phonenumber": phone,
        "email": email,
        "address": add,
        "gender": gender,
        "bloodgroup": bdgp,
        "alternative_phone_no": altphn,
        "dob": dob,
        "qualification": qualify,
        "password": pass,
        "confirm_password": cnpass
      });
      // print(response);
      print(username);
      print(phone);
      print(email);
      print(add);
      print(gender);
      print(bdgp);
      print(altphn);
      print(qualify);
      print(pass);
      print(cnpass);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
