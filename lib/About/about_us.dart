import 'package:flutter/material.dart';
import 'package:genesis/HomeScreen/Homepage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(Uri.parse("https://globosoft.co.uk/Genesis/privacy"))
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
          "About us",
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
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
//https://globosoft.co.uk/Genesis/t&c