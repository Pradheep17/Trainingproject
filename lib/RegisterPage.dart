// import 'dart:ffi';
// import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/http/repository/loginRepository.dart';
import 'package:flutter_application_1/http/repository/registerRespository.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import 'package:intl/intl.dart';
import 'package:flutter_application_1/splashScreen.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController username1Controller = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phonenumController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController altphnController = new TextEditingController();
  TextEditingController bloodController = new TextEditingController();
  TextEditingController confirmpassController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController qualifyController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();

  String? gender,
      phone,
      address,
      email,
      DOB,
      password,
      confirmpass,
      user,
      altphone,
      quality;
  // String? phone;
  // String? address;
  // String? email;
  // String? DOB;
  // String? password;
  // String? confirmpass;
  // String? user;
  // String? altphone;
  // String? qualify;
  final format = DateFormat('yyyy-MM-dd');
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  int radioValue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 510,
          width: 300,
          color: Color.fromARGB(255, 235, 231, 231),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'images/img8.jpeg',
                    ),
                  ),
                  Text(
                    'User Details',
                    style: TextStyle(fontSize: 25, color: Color(0xFF0F0E0E)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Form(
                      key: _formkey,
                      child: Column(children: [
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: username1Controller,
                            validator: ((user) {
                              if (user!.isEmpty) {
                                return 'enter the user';
                              }
                            }),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'username',
                                labelStyle: TextStyle(color: Color(0xFF0C0C0C)),
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                suffixIcon: Icon(
                                  Icons.people,
                                  color: Color(0xFF161515),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            
                            controller: phonenumController,
                            validator: ((phone) {
                              if (phone!.isEmpty) {
                                return 'enter phone num';
                              } else if (phone.length < 10
                                  // !RegExp('("(0|91)?[7-9][0-9]{9}")')
                                  //   .hasMatch(phone)
                                  ) {
                                return 'invalid phone num';
                              } else if (phone.length > 10) {
                                return 'enter valid number';
                              }
                            }),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'phonenumber',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.settings_phone_outlined,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: emailController,
                            validator: ((email) {
                              if (email!.isEmpty) {
                                return 'enter email';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email)) {
                                return 'invalid email';
                              }
                            }),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'Email Id',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: addressController,
                            validator: ((address) {
                              if (address!.isEmpty) {
                                return 'enter the address';
                              }
                            }),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'address',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.location_on,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),

                        //   FormBuilderRadio(
                        // decoration:
                        //     InputDecoration(labelText: 'My chosen language'),
                        // attribute: "best_language",
                        // leadingInput: true,
                        // onChanged: _onChanged,
                        // validators: [FormBuilderValidators.required()],
                        // options:
                        //     ["Dart", "Kotlin", "Java", "Swift", "Objective-C"]
                        //         .map((lang) => FormBuilderFieldOption(
                        //               value: lang,
                        //               child: Text('$lang'),
                        //             ))
                        //         .toList(growable: false),
                        // ),

                        // RadioListTile<int>(
                        //     title: new Text('Male'),
                        //     value: 0,
                        //     groupValue: radioValue,
                        //     onChanged: handleRadioValueChange()),
                        // new RadioListTile<int>(
                        //     title: new Text('Female'),
                        //     value: 1,
                        //     groupValue: radioValue,
                        //     onChanged: handleRadioValueChange),
                        // new RadioListTile<int>(
                        //     title: new Text('Transgender'),
                        //     value: 2,
                        //     groupValue: radioValue,
                        //     onChanged: handleRadioValueChange),

                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: altphnController,
                            validator: (altphone) {
                              if (altphone!.isEmpty) {
                                return 'enter phone num';
                              } else if (altphone.length < 10
                                  // !RegExp('("(0|91)?[7-9][0-9]{9}")')
                                  //   .hasMatch(altphone)
                                  ) {
                                return 'invalid phone num';
                              } else if (altphone.length > 10) {
                                return 'enter valid number';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'altenative_phone',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.phone,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            inputFormatters: [
                              MaskedInputFormatter(
                                '0000-00-00',
                              )
                              // anyCharMatcher: RegExp(
                              //     r'^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\\d\\d$'))
                            ],

                            controller: dobController,
                            validator: (DOB) {
                              if (DOB!.isEmpty) {
                                return 'enter DOB';
                              } else if (DOB.length != 10) {
                                return 'enter valid date';
                              } else if (!RegExp(
                                      '((?:19|20)\\d\\d)-(0?[1-9]|1[012])-([12][0-9]|3[01]|0?[1-9])')
                                  .hasMatch(DOB)) {
                                return 'enter valid dates';
                              }
                            },

                            // onShowPicker: (context, currentValue) async {
                            //   final date = showDatePicker(
                            //     context: context,
                            //     initialDate: currentValue ?? DateTime.now(),
                            //     firstDate: DateTime(1980),
                            //     lastDate: DateTime(2050),
                            //   );
                            //   return date;
                            // },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'DOB',
                                fillColor: Color(0xFFE3DDDD),
                                hintText: 'YYYY-MM-DD',
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: qualifyController,
                            validator: (qualify) {
                              if (qualify!.isEmpty) {
                                return 'enter your qualification';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'qualification',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.cast_for_education_outlined,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: bloodController,
                            validator: (blood) {
                              if (blood!.isEmpty) {
                                return 'please enter your blood group';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'Blood group',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.bloodtype_rounded,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: passwordController,
                            onChanged: (value) => password = value,
                            validator: (password) {
                              if (password!.isEmpty) {
                                return 'enter password';
                              } else if (password.length < 8) {
                                return 'Atleast have 8 character';
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'password',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.password_outlined,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: confirmpassController,
                            onChanged: (value) {
                              confirmpass = value;
                            },
                            validator: (confirmpass) {
                              if (confirmpass!.isEmpty) {
                                return 'RE-enter password';
                              } else if (confirmpass != password) {
                                return 'password does not match';
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'Confirm password',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.key_off_outlined,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Gender:",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: genderController,
                            validator: (gender) {
                              if (gender!.isEmpty) {
                                return 'please enter your gender';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                labelText: 'M/F',
                                fillColor: Color(0xFFE3DDDD),
                                filled: true,
                                labelStyle: TextStyle(color: Color(0xFF0E0E0E)),
                                suffixIcon: Icon(
                                  Icons.bloodtype_rounded,
                                  color: Color(0xFF0B0A0A),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // RadioListTile<int>(
                        //     title: Text("Male"),
                        //     value: 0,
                        //     groupValue: radioValue,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         gender = value.toString();
                        //       });
                        //     }),

                        // RadioListTile<int>(
                        //   title: Text("Female"),
                        //   value: 1,
                        //   groupValue: radioValue,
                        //   onChanged: (radioValue) {
                        //     radioValue;
                        //   },
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 400,
                          child: RaisedButton(
                            onPressed: () {
                              // print("1:${emailController.text}");
                              // print("1:${username1Controller.text}");
                              // print("1:${phonenumController.text}");
                              // print("1:${genderController.text}");
                              // print("1:${addressController.text}");
                              // print("1:${bloodController.text}");
                              // print("1:${altphnController.text}");
                              // print("1:${qualifyController.text}");
                              // print("1:${dobController.text}");
                              // print("1:${passwordController.text}");
                              // print("1:${confirmpassController.text}");
                              if (_formkey.currentState!.validate()) {
                                var response = RegisterRespository.Register(
                                  username1Controller.text,
                                  phonenumController.text,
                                  emailController.text,
                                  addressController.text,
                                  bloodController.text,
                                  genderController.text,
                                  altphnController.text,
                                  dobController.text,
                                  qualifyController.text,
                                  passwordController.text,
                                  confirmpassController.text,
                                );
                              }
                            },
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                            color: Color.fromARGB(255, 87, 13, 136),
                          ),
                        ),
                        Divider(height: 50),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 55),
                          child: FlatButton(
                            splashColor: null,
                            onPressed: () {
                              Navigator.of(context).pop(MaterialPageRoute(
                                  builder: (context) => SplshScreen()));
                            },
                            child: RichText(
                                text: TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text: 'lOGIN',
                                      style: TextStyle(color: Colors.red))
                                ])),
                          ),
                        )),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
