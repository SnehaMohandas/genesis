import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../HomeScreen/Homepage.dart';
import '../Network/BaseUrl.dart';
import 'Forgot Password.dart';
import 'Login_page.dart';
import 'Reset Password.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String Otp = '';
  Future<void> SentOtp() async {
    String url = '${base}auth/password-check';

    // Create the request body
    Map<String, String> body = {'code': Otp, "email": widget.email};

    // Send the POST request
    try {
      http.Response response = await http.post(Uri.parse(url), body: body);

      // Handle the response
      if (response.statusCode == 200) {
        // Success
        print('Password reset request sent');
        print('Response: ${response.body}');

        // Parse the response
        Map<String, dynamic> data = json.decode(response.body);
        bool status = data['status'];
        String message = data['message'];

        if (status) {
          // OTP Sent successfully
          print('Success: ${widget.email}');

          // Show a SnackBar message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(' Success')),
          );

          // Navigate to the OTP screen and pass the email
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResetPassword(
                      email: widget.email,
                    )),
          );
        } else {
          // Invalid email
          print('Error: $message');

          // Show a SnackBar message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $message')),
          );
        }
      } else {
        // Error
        print('Password reset request failed');

        // Show a SnackBar message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('invalid otp request failed')),
        );
      }
    } catch (e) {
      // Error
      print('Error sending password reset request: $e');

      // Show a SnackBar message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sending password reset request')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Container(
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/forgot-pswrd-page-2.jpg"),
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
                SizedBox(
                  height: 300,
                ),
                Center(
                  child: Text(
                    "Enter OTP Sent to E-Mail",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "we have sent a digitl code on your e-mail",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  width: double.infinity,
                  height: 65,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              Otp = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    SentOtp();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/bar.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: 300,
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
          )
          // Stack(
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
          //                 MaterialPageRoute(builder: (context) =>ForgortPassword()),
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
          //
          //     Positioned(top: 400,left: 80,
          //         child: Text("Enter OTP Sent to E-Mail",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
          //         )),
          //     Positioned(top: 440,left: 90,
          //         child: Text("we have sent a digitl code on your e-mail",style: TextStyle(fontSize:12,color: Colors.grey),
          //         )),
          //
          //     Positioned( top: 560,left:50,
          //         child: Container(
          //           margin: EdgeInsets.only(left: 20, right: 20),
          //           width: 260,
          //           height: 75,
          //           child: Row(
          //             children: <Widget>[
          //               Expanded(
          //                 child: TextFormField(
          //                   decoration: InputDecoration(
          //                     filled: true,
          //                     fillColor: Colors.white,
          //                     border: OutlineInputBorder(
          //                       borderSide: const BorderSide(color: Colors.black),
          //                       borderRadius: BorderRadius.circular(10),
          //                     ),
          //                   ),
          //                   onChanged: (value) {
          //                     setState(() {
          //                       Otp = value;
          //                     });
          //                   },
          //                 ),
          //               ),
          //             ],
          //           ),
          //         )
          //     ),
          //     Positioned( top: 690,left:40,
          //         child:  GestureDetector(
          //             onTap: (){
          //               SentOtp();
          //             },
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
    }));
  }
}
