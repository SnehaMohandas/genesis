import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Network/BaseUrl.dart';
import 'Login_page.dart';
import 'OtpScreen.dart';

class ForgortPassword extends StatefulWidget {
  const ForgortPassword({Key? key}) : super(key: key);

  @override
  State<ForgortPassword> createState() => _ForgortPasswordState();
}

class _ForgortPasswordState extends State<ForgortPassword> {
  String email = '';
  bool isLoading = false;
  Future<void> resetPassword() async {
    String url = '${base}auth/password-reset';

    // Create the request body
    Map<String, String> body = {
      'email': email,
    };

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
          print('OTP Sent to Email: $email');

          // Show a SnackBar message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('OTP Sent to Email: $email')),
          );

          // Navigate to the OTP screen and pass the email
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OtpScreen(email: email)),
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
          SnackBar(content: Text('Password reset request failed')),
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
              image: AssetImage("assets/images/forgot-pswrd-page.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
              child: Column(children: [
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
                      Icons.arrow_circle_left_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: 200,
              child: Image.asset(
                  "assets/images/e6a575738250dfbc0d68b38d3f137aaf.gif"),
            ),
            SizedBox(
              height: 90,
            ),
            Text(
              "Forgot Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "its okay ! Reset your password",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Text(
                    "E-Mail",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              width: 300,
              height: 45,
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
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
                    email = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                resetPassword();
              },
              child: Stack(children: [
                Container(
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
                          color: Colors.white),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            // Customize the CircularProgressIndicator as needed
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                        )
                      : Container(),
                ),
                //

                //         )
              ]),
            )
          ])));
    }));
  }
}
