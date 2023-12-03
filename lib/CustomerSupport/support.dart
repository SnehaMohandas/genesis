import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genesis/CommonWidget/Colors/Color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../HomeScreen/Homepage.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({Key? key}) : super(key: key);

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
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

void _openEmail() async {
  var email = 'info@genesisjewelcraft.com';
  var subject = 'Hello';
  var body = 'This is the body of the email';

  var emailUrl =
      'mailto:$email?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';
  try {
    await launch(emailUrl);
  } catch (e) {
    throw 'Could not launch $emailUrl';
  }
}

class _CustomerSupportState extends State<CustomerSupport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.white10.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/payment_h_bg.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              code: '',
                              name: '',
                            )),
                  );
                },
                child: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: Colors.white,
                )),
            title: Text(
              'Customer support',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                          color: Colors.white10.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(27)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                              child: Text(
                            'How can we help you ?',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.36,
                            width: double.infinity,
                            child: SvgPicture.asset(
                                "assets/images/cus_support.svg"),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "Our dedicated team is here to support you every step of the way. Whether you have questions about our jewelry schemes, need assistance with your account, or want to explore our stunning collections, we're just a message away. Don't hesitate to reach out, and let us make your jewelry dreams come true.",
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.052,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _openEmail();
                      },
                      child: Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Appcolors.app,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.052,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _openCall();
                      },
                      child: Text(
                        "Call us",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Appcolors.app,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )),
              ],
            ),
          ))),
    );
  }
}
