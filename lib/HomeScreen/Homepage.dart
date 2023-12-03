import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:genesis/About/about_us.dart';
import 'package:genesis/Referral%20Status/referral_status.dart';
import 'package:genesis/catalog/catalog_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../About/aboutscrren.dart';
import '../Active Shceme/active _shceme.dart';
import '../CustomerSupport/support.dart';
import '../LOGIN/Login_page.dart';
import '../Moduels/Bloc/Profile_Bloc.dart';
import '../Moduels/Model/ProfileList.dart';
import '../Network/Respones.dart';
import '../Payment History/paymeny_history.dart';
import '../Refer A Friend/refer_New.dart';
import '../Rferral Earning/referral earnings.dart';
import '../Scheme/scheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.name, required this.code})
      : super(key: key);
  final String name;
  final String code;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProfileList? doc;
  late ProfileListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProfileListBloc();
  }

  final List images = [
    "assets/images/banner1.png",
    "assets/images/banner2.jpeg",
    "assets/images/banner3.jpeg",
    "assets/images/banner4.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    print("12345==${widget.code}");
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //         Icons.menu_rounded,
      //         color: Colors.black,
      //         size: 25,
      //       )),
      // ),
      body: StreamBuilder<Response<ProfileList>>(
        stream: _bloc.profileListDataStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("13berin==${doc?.referralCode}");
            switch (snapshot.data!.status) {
              case Status.LOADING:
                return Center();
              case Status.SUCCESS:
                doc = snapshot.data!.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PopupMenuButton<String>(
                    //   icon: Icon(Icons.menu_outlined),
                    //   onSelected: (value) {
                    //   },
                    //   itemBuilder: (BuildContext context) {
                    //     return <PopupMenuEntry<String>>[
                    //       PopupMenuItem<String>(
                    //         value: 'option1',
                    //         child: Row(
                    //           children: [
                    //             Icon(
                    //               Icons.logout_outlined,
                    //               size: 14,
                    //             ),
                    //             Text(
                    //               "Logout",
                    //               style: TextStyle(
                    //                   fontSize: 14, fontFamily: "Poppins"),
                    //             ),
                    //           ],
                    //         ),
                    //         onTap: () {
                    //           logout(context);
                    //         },
                    //       ),
                    //       PopupMenuItem<String>(
                    //         value: 'option2',
                    //         child: Row(
                    //           children: [
                    //             Icon(
                    //               Icons.delete_outline_outlined,
                    //               size: 14,
                    //             ),
                    //             Text(
                    //               'Delete Account',
                    //               style: TextStyle(
                    //                   fontSize: 14, fontFamily: "Poppins"),
                    //             ),
                    //           ],
                    //         ),
                    //         onTap: () {
                    //           _dialogBuilder(context);
                    //         },
                    //       ),
                    //     ];
                    //   },
                    // ),
                    Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                              aspectRatio: 18 / 5,
                              viewportFraction: 1.0,
                              height: MediaQuery.of(context).size.height * 0.32,
                              autoPlay: true),
                          items: images.map((e) {
                            return Builder(builder: (BuildContext context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.32,
                                width: double.infinity,
                                // color: Colors.amber,
                                // child: Center(
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //         image: DecorationImage(
                                //             image: AssetImage(
                                //                 "assets/images/home1.png"),
                                //             fit: BoxFit.cover),
                                //         // color: Colors.red,
                                //         borderRadius:
                                //             BorderRadius.circular(50)),
                                //     height: MediaQuery.of(context).size.height *
                                //         0.24,
                                //   ),
                                // ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(e.toString()),
                                        fit: BoxFit.cover)),
                                //child: Image.asset(e.toString())
                              );
                            });
                          }).toList(),
                          // child: Container(
                          //   height: MediaQuery.of(context).size.height * 0.32,
                          //   color: Colors.amber,
                          //   // child: Center(
                          //   //   child: Container(
                          //   //     decoration: BoxDecoration(
                          //   //         image: DecorationImage(
                          //   //             image: AssetImage(
                          //   //                 "assets/images/home1.png"),
                          //   //             fit: BoxFit.cover),
                          //   //         // color: Colors.red,
                          //   //         borderRadius:
                          //   //             BorderRadius.circular(50)),
                          //   //     height: MediaQuery.of(context).size.height *
                          //   //         0.24,
                          //   //   ),
                          //   // ),
                          // ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //   height: MediaQuery.of(context).size.height *
                              //       0.12,
                              //   width: MediaQuery.of(context).size.width *
                              //       0.23,
                              //   decoration: BoxDecoration(
                              //       shape: BoxShape.circle,
                              //       color: Colors.white),
                              //   child: Center(
                              //     child: Container(
                              //       height:
                              //           MediaQuery.of(context).size.height *
                              //               0.13,
                              //       width:
                              //           MediaQuery.of(context).size.width *
                              //               0.20,
                              //       decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           color: Colors.grey),
                              //       child: Icon(
                              //         Icons.person,
                              //         size: 70,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Container(
                              //   height: MediaQuery.of(context).size.height *
                              //       0.10,
                              //   width:
                              //       MediaQuery.of(context).size.width * 0.6,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(70),
                              //     color: Color.fromARGB(87, 173, 171, 171),
                              //   ),
                              //   child: Column(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     children: [
                              //       Text(
                              //         doc?.userName ?? "",
                              //         style: TextStyle(
                              //             fontSize: 17.04,
                              //             fontWeight: FontWeight.w600,
                              //             color: Colors.white,
                              //             fontFamily: "Poppins"),
                              //       ),
                              //       Text(
                              //         "User ID: ${doc?.registerid}",
                              //         style: TextStyle(
                              //             color: Colors.white,
                              //             fontSize: 12,
                              //             fontWeight: FontWeight.w300,
                              //             fontFamily: "Poppins"),
                              //       ),
                              //       //                                     SizedBox(height: 3,),
                              //       Text(
                              //         "Invite code : ${doc?.referralCode}",
                              //         style: TextStyle(
                              //             fontSize: 11,
                              //             color: Colors.white,
                              //             fontWeight: FontWeight.w300,
                              //             fontFamily: "Poppins"),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: MediaQuery.of(context).size.height *
                              //       0.01,
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 1, top: 20, right: 16),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showAlert(context, doc);
                                        },
                                        icon: Icon(
                                          Icons.menu_outlined,
                                          color: Colors.white,
                                          size: 35,
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                    ),
                                    Text(
                                      "GENESIS DIAMOND",
                                      style: TextStyle(
                                          // fontFamily: "Playfair Display",
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.16),
                              GestureDetector(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(43),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 5.0, sigmaY: 5.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.13,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(43),
                                        color: Colors.black45.withOpacity(0.2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReferralEraningsScreen()),
                                                );
                                              },
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      doc?.sum ?? "",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 26,
                                                          color: Colors.white),
                                                    ),
                                                    Text("Invite Earnings",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(
                                              color: Colors.white60,
                                              thickness: 1,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ActiveScheme()),
                                                );
                                              },
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      doc?.schemeCount ?? "",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 26,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "Active Shemes",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 20, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Schemes(
                                              id: '',
                                            )),
                                  );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    // border: Border.all(
                                    //   color:
                                    //       Color.fromARGB(50, 31, 30, 30),
                                    //   width: 1,
                                    // )
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[500]!,
                                          blurRadius: 8,
                                          //  spreadRadius: 1,
                                          //spreadRadius: 0.5,
                                          offset: Offset(0, 4)),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4, -4),
                                          blurRadius: 15,
                                          spreadRadius: 1)
                                    ],
                                    // border: Border.all(
                                    //     color: Colors.grey, width: 0.3),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      child: Image.asset(
                                          "assets/images/Scheme.png"),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "Explore Scheme",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    //   fontFamily: "Playfair Display",
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PaymentHistoryScreen(
                                              id: '',
                                            )),
                                  );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    // border: Border.all(
                                    //   color:
                                    //       Color.fromARGB(50, 31, 30, 30),
                                    //   width: 1,
                                    // )
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[500]!,
                                          blurRadius: 8,
                                          //  spreadRadius: 1,
                                          //spreadRadius: 0.5,
                                          offset: Offset(0, 4)),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4, -4),
                                          blurRadius: 15,
                                          spreadRadius: 1)
                                    ],
                                    // border: Border.all(
                                    //     color: Colors.grey, width: 0.3),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      child: Image.asset(
                                          "assets/images/History.png"),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "Payment History",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    // fontFamily: "Poppins",
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ContactPickerPage()),
                                  );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    // border: Border.all(
                                    //   color:
                                    //       Color.fromARGB(50, 31, 30, 30),
                                    //   width: 1,
                                    // )
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[500]!,
                                          blurRadius: 8,
                                          //  spreadRadius: 1,
                                          //spreadRadius: 0.5,
                                          offset: Offset(0, 4)),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4, -4),
                                          blurRadius: 15,
                                          spreadRadius: 1)
                                    ],
                                    // border: Border.all(
                                    //     color: Colors.grey, width: 0.3),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      child: Image.asset(
                                          "assets/images/Invitation(1).png"),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "Invite a Friend",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CustomerSupport()),
                                  );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    // border: Border.all(
                                    //   color:
                                    //       Color.fromARGB(50, 31, 30, 30),
                                    //   width: 1,
                                    // )
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[500]!,
                                          blurRadius: 8,
                                          //  spreadRadius: 1,
                                          //spreadRadius: 0.5,
                                          offset: Offset(0, 4)),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4, -4),
                                          blurRadius: 15,
                                          spreadRadius: 1)
                                    ],
                                    // border: Border.all(
                                    //     color: Colors.grey, width: 0.3),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      child: Image.asset(
                                          "assets/images/Customer care.png"),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "Customer Support",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ReferralStatusScreen()),
                                  );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    // border: Border.all(
                                    //   color:
                                    //       Color.fromARGB(50, 31, 30, 30),
                                    //   width: 1,
                                    // )
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[500]!,
                                          blurRadius: 8,
                                          //  spreadRadius: 1,
                                          //spreadRadius: 0.5,
                                          offset: Offset(0, 4)),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4, -4),
                                          blurRadius: 15,
                                          spreadRadius: 1)
                                    ],
                                    // border: Border.all(
                                    //     color: Colors.grey, width: 0.3),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      child:
                                          Image.asset("assets/images/Card.png"),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "Invited Status",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutUs()),
                                  );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    // border: Border.all(
                                    //   color:
                                    //       Color.fromARGB(50, 31, 30, 30),
                                    //   width: 1,
                                    // )
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[500]!,
                                          blurRadius: 8,
                                          //  spreadRadius: 1,
                                          //spreadRadius: 0.5,
                                          offset: Offset(0, 4)),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4, -4),
                                          blurRadius: 15,
                                          spreadRadius: 1)
                                    ],
                                    // border: Border.all(
                                    //     color: Colors.grey, width: 0.3),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      child: Image.asset(
                                          "assets/images/High five.png"),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "About Us",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 19),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return CatalogScreen();
                                    }));
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.11,
                                    width: MediaQuery.of(context).size.width *
                                        0.23,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      // border: Border.all(
                                      //   color:
                                      //       Color.fromARGB(50, 31, 30, 30),
                                      //   width: 1,
                                      // )
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[500]!,
                                            blurRadius: 8,
                                            //  spreadRadius: 1,
                                            //spreadRadius: 0.5,
                                            offset: Offset(0, 4)),
                                        BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(-4, -4),
                                            blurRadius: 15,
                                            spreadRadius: 1)
                                      ],
                                      // border: Border.all(
                                      //     color: Colors.grey, width: 0.3),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        child: Image.asset(
                                            "assets/images/Pantone.png"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  "Catalog",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    // Spacer(),

                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Copyrights ",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Icon(
                            Icons.copyright_outlined,
                            color: Colors.black54,
                            size: 14,
                          ),
                          Text(" Genesis Jewelcraft",
                              style: TextStyle(color: Colors.black54))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    )
                  ],
                );

              case Status.ERROR:
                return Center(
                  child: Container(
                    child: Text(
                      "Network Error",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // decoration: const BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage("assets/images/error.png"),
                    //       fit: BoxFit.fill,
                    //     )),
                  ),
                );
              case Status.COMPLETED:
                break;
            }
          }
          return Container(
            color: Colors.black45,
          );
        },
      ),
      //=======================================================
    );
  }
}

showAlert(BuildContext context, doc) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Color.fromARGB(242, 43, 42, 42),
        content: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.6,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.16,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      color: Color.fromARGB(87, 173, 171, 171),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          doc?.userName ?? "",
                          style: TextStyle(
                            fontSize: 17.04,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "User ID: ${doc?.registerid}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        //                                     SizedBox(height: 3,),
                        Text(
                          "Invite code : ${doc?.referralCode}",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchFacebookURL();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.16,
                          child: Image.asset("assets/images/Social(1)-02.png"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchTwitterURL();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.16,
                          child: Image.asset("assets/images/Social(1)-01.png"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchInstaURL();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.16,
                          child: Image.asset("assets/images/Social(1)-03.png"),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      logout(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(27),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white10.withOpacity(0.3)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  GestureDetector(
                    onTap: () {
                      _dialogBuilder(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          // margin: EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white10.withOpacity(0.3)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                "Delete Account",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(27),
                  //   child: BackdropFilter(
                  //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  //     child: Container(
                  //       height: 100,
                  //       decoration: BoxDecoration(
                  //           color: Colors.white.withOpacity(0.2),
                  //           borderRadius: BorderRadius.circular(20)),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

_launchFacebookURL() async {
  const facebookURL =
      'https://www.facebook.com/GenesisJewelCraft'; // Replace with your Facebook page URL
  if (await launchUrlString(facebookURL)) {
    await launch(
      facebookURL,
    );
  } else {
    throw 'Could not launch $facebookURL';
  }
}

_launchInstaURL() async {
  const instaURL =
      'https://www.instagram.com/genesisdiamonds_by_deepaktoms/?igshid=MzRlODBiNWFlZA%3D%3D'; // Replace with your Facebook page URL
  if (await launchUrlString(instaURL)) {
    await launch(
      instaURL,
    );
  } else {
    throw 'Could not launch $instaURL';
  }
}

_launchTwitterURL() async {
  const twitterURL =
      'https://twitter.com/i/flow/login?redirect_after_login=%2FGenesis_Crafts'; // Replace with your Facebook page URL
  if (await launchUrlString(twitterURL)) {
    await launch(
      twitterURL,
    );
  } else {
    throw 'Could not launch $twitterURL';
  }
}

Future<void> logout(BuildContext context) async {
  // Clear user data from shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();

  // Navigate to the login page
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => WelcomeScreen(
              id: '',
            )),
  );
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          // Disable the back button press
          return Future.value(false);
        },
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.black87, width: 5)),
          title: const Text(
            "Delete Your Account",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Are you sure you want to proceed!\n'
            'Your request will be  processed within\n'
            '5-7 days form the time of submitting\n'
            'the request.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            Center(
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text(
                      'Proceed',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () async {
                      logout(context);
                    }),
              ),
            ),
          ],
        ),
      );
    },
  );
}
//https://www.facebook.com/GenesisJewelCraft
//https://www.instagram.com/genesisdiamonds_by_deepaktoms/?igshid=MzRlODBiNWFlZA%3D%3D
//https://twitter.com/i/flow/login?redirect_after_login=%2FGenesis_Crafts