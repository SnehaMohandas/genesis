import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genesis/CommonWidget/Colors/Color.dart';

import '../Active Shceme/activescheme_details.dart';
import '../HomeScreen/Homepage.dart';
import '../Moduels/Bloc/ActiveScheme_Bloc.dart';
import '../Moduels/Bloc/PaymentHistory_Bloc.dart';
import '../Moduels/Model/Active scheme.dart';
import '../Moduels/Model/PaymentHistoryList.dart';
import '../Network/Respones.dart';
import 'PaymentHistoryDetails.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<PaymentHistoryScreen> createState() => _ActiveSchemeState();
}

class _ActiveSchemeState extends State<PaymentHistoryScreen> {
  // Sample list of items
  PaymentHistoryList? doc;
  late PaymentHistoryListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = PaymentHistoryListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //assets/images/payment-detail-bg.jpeg
      decoration: BoxDecoration(
          //color: Colors.white10.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/payment-detail-bg.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Payment Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<Response<PaymentHistoryList>>(
          stream: _bloc.paymenthistoryListDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("13berin==${doc?.payments}");
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green[400],
                    ),
                  );
                case Status.SUCCESS:
                  doc = snapshot.data!.data;
                  if (doc?.payments?.isEmpty ?? true) {
                    return EmptyPaymentStateImage(); // Show the empty state widget
                  }
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(27),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.white10.withOpacity(0.1),

                                    // border: Border.all(color: Colors.grey, width: 0.3),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Scheme",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                          Text("Amount",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.white))
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.74,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: List.generate(
                                              doc?.payments?.length ?? 0,
                                              (index) => GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PaymentHistoryDetails(
                                                        id: doc!
                                                            .payments![index]
                                                            .id!
                                                            .toString(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.11,
                                                    decoration: BoxDecoration(
                                                        //color: Colors.amber,
                                                        // border: Border(
                                                        //     bottom: BorderSide(
                                                        //         color: Colors.grey,
                                                        //         width: 1))
                                                        border: Border.all(
                                                            color:
                                                                Color.fromARGB(
                                                                    166,
                                                                    158,
                                                                    158,
                                                                    158)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child:
                                                        SingleChildScrollView(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            // Padding(
                                                            //   padding: const EdgeInsets.only(left: 5),
                                                            //   child: Text(
                                                            //     "${index + 1}",
                                                            //     style: TextStyle(
                                                            //       fontFamily: "Poppins",
                                                            //       fontWeight: FontWeight.bold,
                                                            //     ),
                                                            //   ),
                                                            // ),
                                                            //========================
                                                            Center(
                                                              child: SizedBox(
                                                                height: 20,
                                                                child: Image.asset(
                                                                    "assets/images/diamondblue.png"),
                                                              ),
                                                            ),
                                                            //===================
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.03,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            10),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      doc?.payments?[index]
                                                                              .name ??
                                                                          "",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    SizedBox(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.01,
                                                                    ),
                                                                    Text(
                                                                      "Start Date: ${doc?.payments?[index].startDate}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    SizedBox(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.01,
                                                                    ),
                                                                    Text(
                                                                      "Maturity Period: ${doc?.payments?[index].endDate}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    SizedBox(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.01,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                    height: 15,
                                                                    child: Image.asset(
                                                                        "assets/images/icons8-rupee-24.png",
                                                                        scale:
                                                                            1.0,
                                                                        color: Colors
                                                                            .white)),
                                                                Text(
                                                                  doc?.payments?[index]
                                                                          .amount ??
                                                                      "",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                            IconButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            PaymentHistoryDetails(
                                                                      id: doc!
                                                                          .payments![
                                                                              index]
                                                                          .id!
                                                                          .toString(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color:
                                                                    Colors.grey,
                                                                size: 18,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ],
                      ),
                    ),
                  );

                case Status.ERROR:
                  return Center(
                    child: Container(
                      child: Text(
                        "Network Error",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
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
      ),
    );
  }
}

class EmptyPaymentStateImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Replace with your image asset path
          Text(
            'No payment data available',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // I've taken approximate height of curved part of view
    // Change it if you have exact spec for it
    final roundingHeight = size.height * 2 / 5;

    // this is top part of path, rectangle without any rounding
    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    // this is rectangle that will be used to draw arc
    // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
    // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    // so as I wrote before: arc is drawn from center of roundingRectangle
    // 2nd and 3rd arguments are angles from center to arc start and end points
    // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
    // basically that means that clipping will be redrawn on any changes
    return true;
  }
}
