import 'package:flutter/material.dart';
import 'package:genesis/HomeScreen/Homepage.dart';
import 'package:genesis/Scheme/SchemeDetails.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsandCondition extends StatefulWidget {
  const TermsandCondition({super.key, required this.id});
  final String id;
  @override
  State<TermsandCondition> createState() => _TermsandConditionState();
}

class _TermsandConditionState extends State<TermsandCondition> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(Uri.parse("https://globosoft.co.uk/Genesis/t&c"))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Terms and Conditions",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
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
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: WebViewWidget(controller: controller)),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SchemeDetailsPage(id: widget.id),
                          ),
                        );
                      },
                      child: Text(
                        "Accept",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//https://globosoft.co.uk/Genesis/t&c
