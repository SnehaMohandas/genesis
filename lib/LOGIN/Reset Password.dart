import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Network/BaseUrl.dart';
import 'Login_page.dart';
import 'OtpScreen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String password = '';
  Future<void> resetPassword() async {
    const url = '${base}auth/password-change';

    final response = await http.post(Uri.parse(url), body: {
      'password': password,
      'email': widget.email,
    });

    if (response.statusCode == 200) {
      // Password reset successful, show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset successful')),
      );

      // Navigate to home page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen(id: '')),
      );
    } else {
      // Password reset failed, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/forgot-pswrd-page-3.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen(
                                      id: '',
                                    )),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 260,
                  width: 350,
                  child: Image.asset("assets/images/SID_FB_001.gif"),
                ),
                Text(
                  "Reset Your Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  width: double.infinity,
                  height: 45,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: " New password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    resetPassword();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/bar.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      margin: EdgeInsets.only(left: 40, right: 40),
                      width: double.infinity,
                      height: 45,
                      child: Center(
                          child: Text(
                        "Continue",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ))),
                )
              ],
            ),
          ),
          // child: Stack(
          //   children: [
          //     Positioned(
          //       top: 45,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           IconButton(
          //             onPressed: () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(builder: (context) => OtpScreen(email: '',)),
          //               );
          //             },
          //             icon: Icon(
          //               Icons.arrow_back_ios,
          //               color: Colors.black,
          //             ),
          //           ),
          //
          //
          //         ],
          //       ),
          //     ),
          //     Positioned(top: 80,left: 10,
          //         child: Container(
          //           height:260,width:350,
          //           child: Image.asset("assets/images/SID_FB_001.gif"),
          //         )),
          //     Positioned(top: 410,left: 80,
          //         child: Text("Reset Your Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),
          //         )),
          //     Positioned( top: 480,left:40,
          //         child:  Container(
          //           margin: EdgeInsets.only(left: 20,right: 20),
          //           width: 300,
          //           height: 45,
          //           child: TextFormField(
          //
          //             decoration: InputDecoration(
          //               hintText: " New password",
          //               filled: true,
          //               fillColor: Colors.white,
          //               border: OutlineInputBorder(
          //
          //                 borderSide: const BorderSide(color: Colors.black),
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //             ),
          //             onChanged: (value) {
          //               setState(() {
          //                 password = value;
          //               });
          //             },
          //           ),
          //         )),
          //
          //
          //     Positioned( top: 690,left:40,
          //         child:  GestureDetector(
          //           onTap: (){
          //             resetPassword();
          //           },
          //           child: Container(
          //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(
          //                 image: AssetImage("assets/images/bar.jpg"),
          //                 fit: BoxFit.fill,
          //               ), ),
          //               margin: EdgeInsets.only(left: 20,right: 20),
          //               width: 300,
          //               height: 45,
          //               child: Center(child: Text("Continue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),))
          //           ),
          //         ))
          //   ],
          // ),
        );
      }),
    );
  }
}
