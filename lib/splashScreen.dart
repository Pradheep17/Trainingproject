import 'dart:convert';
import 'dart:js';
import 'dart:math';

import 'package:flutter_application_1/RegisterPage.dart';
import 'package:flutter_application_1/http/repository/loginRepository.dart';
import 'package:flutter_application_1/http/response/login_response.dart';
import 'package:flutter_application_1/welcome.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SplshScreen extends StatefulWidget {
  SplshScreen({Key? key}) : super(key: key);

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  // LoginResponse? response;
  // Future getuserdata() async {
  //   var response =
  //       await http.get(Uri.https('jsonplaceholder-typicode.com', 'users'));
  //   var jsonData = jsonDecode(response.body);
  //   List<User> users = [];
  //   for (var u in jsonData) {
  //     User user = User(u['name'],u['email'], u['username']);
  //     users.add(user);
  //   }
  //   print(users.length);
  //   return users;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/img9.jpeg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                'images/img8.jpeg',
                              ),
                            ),
                            Text(
                              'Play Group',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: usernameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter the email id';
                            }
                            // else if (!RegExp(
                            //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            //     .hasMatch(value)) {
                            //   return 'Invalid email';
                            // }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0)),
                              labelText: 'Email Id',
                              labelStyle: TextStyle(color: Colors.white),
                              suffixIcon: Icon(
                                Icons.mail_outline,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Divider(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter the password';
                            }
                            //else if (usernameController.length < 6) {
                            //   return 'atleast 6 character';
                            // }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white),
                              suffixIcon: Icon(
                                Icons.key_sharp,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Divider(height: 10),
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                            height: 30,
                            child: FlatButton(
                                onPressed: () {},
                                child: Text('  forgot password?'))),
                      ),
                      Divider(
                        height: 10,
                      ),
                      SizedBox(
                        width: 400,
                        child: RaisedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              // getuserdat/a();
                              // var response = await LoginRepository.Login(
                              //   usernameController.text,
                              //   passwordController.text,
                              // );
                              login();

                              // if (response!.token != null) {
                              //   return print('unsucess');
                              // }
                              // else {

                              // }
                            }
                            //                        if (message == true) {
                            //    Navigator.of(context).push(MaterialPageRoute(
                            //                           builder: (context) => Welcome()));
                            // }
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                          color: Color.fromARGB(255, 87, 13, 136),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text('or login using'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 110,
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.facebook_outlined,
                                    color: Colors.white,
                                  ),
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 110,
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.g_mobiledata_rounded,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  color: Colors.transparent,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                            child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Register()));
                          },
                          child: RichText(
                              text: TextSpan(
                                  text: 'do not have an account?',
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                TextSpan(
                                    text: 'Register',
                                    style: TextStyle(color: Colors.red))
                              ])),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    var logres = await LoginRepository.Login(
      usernameController.text,
      passwordController.text,
    );
    print("token --> ${logres.data['message']}");
    if (logres.data['token'].toString().isNotEmpty) {
      print("splash$logres");
      Navigator.of(this.context).push(MaterialPageRoute(
        builder: (context) => Welcome(),
      ));
    } else {
      print("check-->  ${logres.data['message']}");
      // ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
      //   content: Text("username/password icorrect"),
      // ));
    }
  }
}




//     body: Center(
    //   child: FlatButton(
    //     color: Colors.blue,
    //     child: Text('clickme'),
    //     onPressed: () {
    //       LoginRepository();
    //     },
    //   ),
    // )
// class User {
//   late String email, username,name;
//   User(this.name,this.email, this.username);
// }
