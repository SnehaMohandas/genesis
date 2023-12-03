import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../HomeScreen/Homepage.dart';
import '../LOGIN/Login_page.dart';
import '../Network/BaseUrl.dart';
import '../main.dart';

class Confrim extends StatefulWidget {
  const Confrim(
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
  _ConfrimState createState() => _ConfrimState();
}

class _ConfrimState extends State<Confrim> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 22222),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => HomePage(name: '', code: ''),
      )),
    );
  }

  final String _text = 'Hello, World!'; // Text to be downloaded

  Future<void> _downloadText() async {
    try {
      final directory = await getExternalStorageDirectory();
      if (directory != null) {
        final file = File('${directory.path}/downloaded_text.txt');
        await file.writeAsString(_text);
        print('Text downloaded successfully');
      } else {
        print('Unable to get storage directory');
      }
    } catch (e) {
      print('Error downloading text: $e');
    }
  }

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
        MaterialPageRoute(builder: (context) => HomePage(name: "", code: "")),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 350,
            //   width: 350,
            //   child: Image.asset(
            //     "assets/images/QR-Code.jpg",
            //   ),
            // ),
            //==============================
            SizedBox(height: 20),
            Text(
              "Copy QR Code",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirm Payment'),
                          content: Container(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Please make payment with'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('UPI ID: boism-9745000613@boi'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Call at: 916282388714'),
                              ],
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _makePayment(); // Close the dialog
                                    copyToClipboard(context);
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Set the border radius here
                                      side: BorderSide(
                                          color: Colors.blue,
                                          width: 2), // Set the border side here
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
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Set the border radius here
                                      side: BorderSide(
                                          color: Colors.red,
                                          width: 2), // Set the border side here
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
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage("assets/images/bar.jpg"),
                      //   fit: BoxFit.fill,
                      // ),
                      //====================
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Pay",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.copy_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FisrtConfrim extends StatefulWidget {
  const FisrtConfrim(
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
  _FisrtConfrimState createState() => _FisrtConfrimState();
}

class _FisrtConfrimState extends State<FisrtConfrim> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 22222),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => HomePage(name: '', code: ''),
      )),
    );
  }

  void _makePaymentFisrt() async {
    // Make the API call
    final response = await http.post(
      Uri.parse('${base}scheme-select/${user_id ?? globalUserId}'),
      // Add any necessary headers or data
      body: {
        'amount': widget.amount,
        'scheme': widget.id,
        // Add any other required payment parameters
      },
    );

    // Handle the API response
    if (response.statusCode == 200) {
      // Payment successful
      print("123==${response.body}");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(name: "", code: "")),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 350,
            //   width: 350,
            //   child: Image.asset(
            //     "assets/images/QR-Code.jpg",
            //   ),
            // ),
            //==============================
            SizedBox(height: 20),
            Text(
              "Copy QR Code",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                            height: 150,
                            child: AlertDialog(
                              title: Text(
                                'Confirm Subscription',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: Container(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Please  subscription payment'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('UPI ID: boism-9745000613@boi'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Call at: 916282388714'),
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
                                        _makePaymentFisrt(); // Close the dialog
                                        copyToClipboard(context);
                                      },
                                      child: Text(
                                        'Confirm',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8.0), // Set the border radius here
                                          side: BorderSide(
                                              color: Colors.blue,
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
                                        style: TextStyle(color: Colors.red),
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
                            ));
                      },
                    );
                    copyToClipboard(context);
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage("assets/images/bar.jpg"),
                      //   fit: BoxFit.fill,
                      // ),
                      //=======================
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Pay",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.copy_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
