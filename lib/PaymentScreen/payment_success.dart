import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:genesis/CommonWidget/Colors/Color.dart';

import '../HomeScreen/Homepage.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess(
      {super.key,
      required this.amount,
      required this.UPI_id,
      required this.date});
  final amount;
  final date;
  final UPI_id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.white10.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/activescheme-d-bg.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            code: '',
                            name: '',
                          )),
                );
              },
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                color: Colors.white,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    // margin: EdgeInsets.only(left: 10, right: 10),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: Colors.white10.withOpacity(0.15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Payment Processing",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Appcolors.app),
                          child: Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Image.asset(
                                "assets/images/payment-process.png",
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15,
                                  child: Image.asset(
                                      "assets/images/icons8-rupee-24.png",
                                      color: Colors.white),
                                ),
                                Text(
                                  amount,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              UPI_id,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Poppins"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              date,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Poppins"),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              "UPI Transaction ID: 34567893087",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Poppins"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.23,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Appcolors.app,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    code: '',
                                    name: '',
                                  )),
                        );
                      },
                      child: Text("Done")))
            ],
          ),
        ),
      ),
    );
  }
}
