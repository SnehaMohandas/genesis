import 'package:flutter/material.dart';

import '../HomeScreen/Homepage.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/notification-page.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  name: '',
                                  code: '',
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
            Positioned(
                top: 120,
                left: 40,
                child: Text(
                  "Notification",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.blue[900]),
                )),
            Positioned(
                top: 150,
                left: 45,
                child: Text(
                  "June 2023",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
            Positioned(
                top: 270,
                child: Container(
                  height: 500,
                  width: 370,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                  ),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 5,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("Network Issue"
                                            // doc?.data?[index].total!??"",
                                            // style: TextStyle(
                                            //   fontSize: 12,
                                            //   fontWeight: FontWeight.bold,
                                            // ),
                                            ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
          ],
        ),
      );
    }));
  }
}
