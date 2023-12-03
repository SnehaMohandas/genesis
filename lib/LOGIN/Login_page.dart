import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genesis/CommonWidget/Colors/Color.dart';
import 'package:genesis/LOGIN/sing_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Active Shceme/active _shceme.dart';
import '../HomeScreen/Homepage.dart';
import '../Network/BaseUrl.dart';
import 'Forgot Password.dart';

var jsonResponse;
int? user_id;
String? jsontoken;
String? name;
String? referralCode;

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<WelcomeScreen> {
  final _formKey = GlobalKey<FormState>();
  // TabController? _tabController;

  String email = '';
  String password = '';
  bool isLoading = false;
  bool isChecked = false;
  bool _obscureText = true;

  // @override
  // void initState() {
  //   //_tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController!.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     color: Colors.amber,
      //     image: DecorationImage(
      //         image: AssetImage("assets/images/login2.png"),
      //         fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SafeArea(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/images/login2.png"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color.fromARGB(101, 77, 76, 76),
                      Color.fromARGB(50, 31, 30, 30)
                    ])),
                  ),
                  Container(
                    height: constraints.maxHeight,
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Form(
                            key: _formKey,
                            child: DefaultTabController(
                              length: 2,
                              child: Container(
                                child: Column(
                                  children: [
                                    // SizedBox(
                                    //     height: 200,
                                    //     child:
                                    //         Image.asset("assets/images/login.png")),
                                    Stack(
                                      children: [
                                        Container(
                                          //color: Colors.amber,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.23,
                                          width: double.infinity,

                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Go ahead and set up ",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                Text(
                                                  "your account ",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03,
                                                ),
                                                Text(
                                                  "Login and enjoy the best managing experience",
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   height: 30,
                                                // )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(40),
                                                topRight: Radius.circular(40))),
                                        //  color: Colors.amber,
                                        padding: EdgeInsets.all(0.0),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(14.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        85, 190, 195, 231),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                width: double.infinity,
                                                child: TabBar(
                                                    indicator: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          20.0,
                                                        ),
                                                        color: Color
                                                            .fromARGB(108, 130,
                                                                147, 189)),
                                                    labelColor: Colors.black,
                                                    unselectedLabelColor: Colors
                                                        .black,
                                                    // backgroundColor: Colors.black,
                                                    // unselectedBackgroundColor:
                                                    //     Colors.white,
                                                    // unselectedLabelStyle: TextStyle(
                                                    //     color: Colors.grey[700]),
                                                    labelStyle: TextStyle(
                                                        fontFamily:
                                                            "Playfair Display",
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    tabs: [
                                                      Tab(
                                                        //   height: 30,

                                                        text: "Login",
                                                      ),
                                                      Tab(
                                                        text: "Register",
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: TabBarView(children: [
                                                  Column(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.02,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(14.0),
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .email_outlined,
                                                                        color: Colors
                                                                            .black26,
                                                                      ),
                                                                      hintText:
                                                                          "Enter your Email/ your Mobile Number",
                                                                      hintStyle: TextStyle(
                                                                          color: Colors
                                                                              .black45,
                                                                          fontSize:
                                                                              14),
                                                                      border: OutlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.black45),
                                                                          borderRadius: BorderRadius.circular(
                                                                            20,
                                                                          ))),
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        null ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return 'Please enter your email';
                                                                }
                                                                return null;
                                                              },
                                                              onSaved: (value) {
                                                                email = value!;
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(14.0),
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .lock_outline_rounded,
                                                                        color: Colors
                                                                            .black26,
                                                                      ),
                                                                      suffixIcon:
                                                                          IconButton(
                                                                        icon: Icon(
                                                                            _obscureText
                                                                                ? Icons.visibility
                                                                                : Icons.visibility_off,
                                                                            color: Colors.black45),
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            _obscureText =
                                                                                !_obscureText;
                                                                          });
                                                                        },
                                                                      ),
                                                                      hintText:
                                                                          "Enter password",
                                                                      hintStyle: TextStyle(
                                                                          color: Colors
                                                                              .black45,
                                                                          fontSize:
                                                                              14),
                                                                      border: OutlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.black45),
                                                                          borderRadius: BorderRadius.circular(
                                                                            20,
                                                                          ))),
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        null ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return 'Please enter your password';
                                                                }
                                                                return null;
                                                              },
                                                              onSaved: (value) {
                                                                password =
                                                                    value!;
                                                              },
                                                            ),
                                                          ),

                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ForgortPassword()),
                                                              );
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right: 14,
                                                                      top: 10,
                                                                      bottom:
                                                                          8),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  const Text(
                                                                    "Forgot Password ? ",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          //),
                                                          //],
                                                          // ),
                                                          // ),
                                                          SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(14.0),
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.052,
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              child:
                                                                  ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary:
                                                                      Appcolors
                                                                          .app,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  SharedPreferences
                                                                      prefs =
                                                                      await SharedPreferences
                                                                          .getInstance();
                                                                  prefs.setString(
                                                                      "token",
                                                                      'token');
                                                                  if (_formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    _formKey
                                                                        .currentState!
                                                                        .save();
                                                                    setState(
                                                                        () {
                                                                      isLoading =
                                                                          true;
                                                                    });

                                                                    var response = await http.post(
                                                                        Uri.parse(
                                                                            '${base}auth/login'),
                                                                        body: {
                                                                          'email':
                                                                              email,
                                                                          'password':
                                                                              password
                                                                        });
                                                                    setState(
                                                                        () {
                                                                      isLoading =
                                                                          false;
                                                                    });

                                                                    if (response
                                                                            .statusCode ==
                                                                        200) {
                                                                      var data =
                                                                          json.decode(
                                                                              response.body);
                                                                      SharedPreferences
                                                                          sharedPreferences =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      sharedPreferences.setBool(
                                                                          "isLoggedIn",
                                                                          true);

                                                                      var jsonResponse = json.decode(response
                                                                          .body
                                                                          .toString());
                                                                      if (jsonResponse[
                                                                          'status']) {
                                                                        // Login successful
                                                                        user_id =
                                                                            jsonResponse["user"]["id"];
                                                                        sharedPreferences.setInt(
                                                                            "id",
                                                                            user_id!);
                                                                        String
                                                                            name =
                                                                            jsonResponse["user"]["name"];
                                                                        String
                                                                            referralCode =
                                                                            jsonResponse["user"]["referal_code"] ??
                                                                                "";
                                                                        sharedPreferences.setString(
                                                                            "name",
                                                                            name);
                                                                        sharedPreferences.setString(
                                                                            "referal_code",
                                                                            referralCode);
                                                                        print(
                                                                            "Referral Code: $referralCode"); // Print the referral code

                                                                        Navigator
                                                                            .pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                HomePage(code: referralCode, name: name),
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        // Login unsuccessful, show error message
                                                                        showDialog(
                                                                          context:
                                                                              context,
                                                                          builder: (context) =>
                                                                              AlertDialog(
                                                                            title:
                                                                                Text('Registration Processing'),
                                                                            content:
                                                                                const Text("Your account will be verified within 48 hours "),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(context),
                                                                                child: Text('OK'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else {
                                                                      // Handle non-200 status code, e.g., server error
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        const SnackBar(
                                                                            content:
                                                                                Text('Failed to login.Invalid email or password.')),
                                                                      );
                                                                    }

                                                                    print(
                                                                        "Response Body: ${response.body}");
                                                                  }
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Login',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.01,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          _openCall();
                                                        },
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                          width: 180,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black45,
                                                                  width: 1)),
                                                          child: Center(
                                                              child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .call_outlined,
                                                                color: Colors
                                                                    .black45,
                                                              ),
                                                              Text(
                                                                "Customer Service",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ],
                                                          )),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Expanded(
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.01,
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/login_bottom.png"),
                                                                  fit: BoxFit
                                                                      .fitWidth)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  CreateScreen()
                                                ]),
                                              ),
                                            )

                                            //===================================================
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
    //==========================================================================
    //  );
  }

  void _openCall() async {
    var phoneNumber = '916282080465';

    var callUrl = 'tel:$phoneNumber';
    try {
      await launch(callUrl);
    } catch (e) {
      throw 'Could not launch $callUrl';
    }
  }
}
