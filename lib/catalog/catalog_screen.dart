import 'package:flutter/material.dart';
import 'package:genesis/HomeScreen/Homepage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});
  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(Uri.parse("https://genesisbydeepaktoms.com/catalog"))
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
          "Catalog",
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
      body: WebViewWidget(controller: controller),
    );
  }
}
