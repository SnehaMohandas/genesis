import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Active Shceme/activescheme_details.dart';
import '../CommonWidget/Colors/Color.dart';
import '../HomeScreen/Homepage.dart';
import '../LOGIN/Login_page.dart';
import '../Network/BaseUrl.dart';
import '../SplashScrren/splash.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

import 'payment_success.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {Key? key,
      required this.id,
      required this.date,
      required this.amount,
      required this.sub,
      required this.Id})
      : super(key: key);
  final String id;
  final String date;
  final String amount;
  final String sub;
  final String Id;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  void _makePayment() async {
    // Make the API call
    final response = await http.post(
      Uri.parse('${base}make-payment/${user_id ?? globalUserId}'),
      // Add any necessary headers or data
      body: {
        'amount': widget.amount,
        'scheme_id': widget.Id,
        "subscription_id": widget.sub
        // Add any other required payment parameters
      },
    );

    // Handle the API response
    if (response.statusCode == 200) {
      // Navigate to the next page after a delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PaymentSuccess(
                amount: widget.amount,
                UPI_id: "boism-9745000613@boi",
                date: widget.date)),
      );
    } else {
      // Payment failed
      print('Payment failed with status code: ${response.statusCode}');
    }
  }

  void copyToClipboard(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: "boism-9745000613@boi"));

    final snackBar = SnackBar(content: Text('Text copied to clipboard'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.white10.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/payment-bg.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Payment",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(name: "", code: "")),
                );
              },
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.48,
                        width: double.infinity,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(27),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                // height: MediaQuery.of(context).size.height * 0.3,
                                // width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.height * 0.4,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white10.withOpacity(0.15),
                                ),
                                // color: Colors.amber,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Text(
                                      "SCAN HERE TO PAY",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text(
                                      "WITH ANY BHIM UPI APP",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        decoration: BoxDecoration(
                                            color: Colors.white60,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/payment-QR.png"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    Text("GENESIS JEWELCRAFTS",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13))
                                    //assets/images/payment-logo2.png
                                    ,
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/payment-logo2.png"),
                                                fit: BoxFit.fitWidth)),
                                      ),
                                    ),
                                    Text(
                                        "Payment through any UPI APP Accepted Here",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                              // height: MediaQuery.of(context).size.height * 0.3,
                              // width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.height * 0.2,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.white10.withOpacity(0.2),
                              ),
                              // color: Colors.amber,
                              child: Image.asset(
                                "assets/images/payment-logo1.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        child: Text(
                          "Scan the QR or Pay using the UPI Id given. After completing the payment, click the Pay button and then Confirm. Our backend team will verify the payment, and it will reflect in your app in 48 hrs.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                            color: Colors.white10.withOpacity(0.2),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "          Date        :    ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    widget.date,
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),

                              // SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Amount      :    ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    widget.amount,
                                    //  textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color.fromARGB(242, 43, 42, 42),
                            title: Text(
                              'Confirm Payment',
                              style: TextStyle(color: Colors.white),
                            ),
                            content: Container(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Please make payment with',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'UPI ID: boism-9745000613@boi',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Call at: 916282388714',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _makePayment(); // Close the dialog
                                      copyToClipboard(context);
                                    },
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 79, 190, 85),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Set the border radius here
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 79, 190, 85),
                                            width:
                                                2), // Set the border side here
                                      ),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Set the border radius here
                                        side: BorderSide(
                                            color: Colors.red,
                                            width:
                                                2), // Set the border side here
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                      copyToClipboard(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 15, left: 16, right: 16, bottom: 12),
                      height: MediaQuery.of(context).size.height * 0.052,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Appcolors.app,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pay",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 10,
                    ),
                    height: MediaQuery.of(context).size.height * 0.052,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Appcolors.app,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                        child: Text(
                      " Pay With Shop",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
