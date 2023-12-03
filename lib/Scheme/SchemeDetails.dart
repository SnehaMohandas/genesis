import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:genesis/CommonWidget/Colors/Color.dart';
import 'package:genesis/Scheme/scheme.dart';

import '../HomeScreen/Homepage.dart';
import '../Moduels/Bloc/Payment_Bloc.dart';
import '../Moduels/Bloc/SchemeDetails_Bloc.dart';
import '../Moduels/Model/ActiveSchemeDetailsList.dart';
import '../Moduels/Model/PaymentList.dart';
import '../Moduels/Model/SchemeDetailsList.dart';
import '../Network/Respones.dart';
import '../PaymentScreen/Subcribe _Payment.dart';

class SchemeDetailsPage extends StatefulWidget {
  const SchemeDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<SchemeDetailsPage> createState() => _SchemeDetailsState();
}

class _SchemeDetailsState extends State<SchemeDetailsPage> {
  SchemeDetailsList? doc;
  late SchemeDetailsListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SchemeDetailsListBloc(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/scheme_d-bg.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Schemes(
                          id: widget.id,
                        )),
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
            "Scheme Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<Response<SchemeDetailsList>>(
          stream: _bloc.schemedetailsListDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("13berin==${doc?.data?.name}");
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green[400],
                    ),
                  );
                case Status.SUCCESS:
                  doc = snapshot.data!.data;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15, bottom: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white12.withOpacity(0.2),

                                  borderRadius: BorderRadius.circular(35),

                                  // image: DecorationImage(
                                  //     image: AssetImage(
                                  //         "assets/images/schemedetails1.png"),
                                  //     fit: BoxFit.fill)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        doc?.data?.name ?? "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: MediaQuery.of(context)
                                      //           .size
                                      //           .height *
                                      //       0.02,
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 5.0, sigmaY: 5.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.105,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.24,
                                                decoration: BoxDecoration(
                                                    color: Colors.white10
                                                        .withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Starts",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "On",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      Text(
                                                        doc?.data?.startingOn ??
                                                            "",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 5.0, sigmaY: 5.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.105,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.24,
                                                decoration: BoxDecoration(
                                                    color: Colors.white10
                                                        .withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Pending",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Periods",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      Text(
                                                        doc?.data?.duration ??
                                                            "",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 5.0, sigmaY: 5.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.105,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.24,
                                                decoration: BoxDecoration(
                                                    color: Colors.white10
                                                        .withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Maturity",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "On",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        doc?.data?.endingOn ??
                                                            "",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 8),
                          child: Row(
                            children: [
                              Text(
                                "Payment Details",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.047,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Appcolors.app,
                                ),
                                child: Center(
                                  child: Text(
                                    doc?.data?.total ?? "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.62,
                            child: PaymentDetails(
                              id: widget.id,
                              date: '',
                              amount: '',
                            ))
                      ],
                    ),
                  );

                case Status.ERROR:
                  return Center(
                    child: Container(
                      child: Text(
                        "Network Error",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({
    Key? key,
    required this.id,
    required this.date,
    required this.amount,
  }) : super(key: key);
  final String id;
  final String date;
  final String amount;
  @override
  State<PaymentDetails> createState() => _QuestionCountState();
}

class _QuestionCountState extends State<PaymentDetails> {
  PaymentList? count;
  late PaymentListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = PaymentListBloc(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Response<PaymentList>>(
      stream: _bloc.paymentListDataStream,
      builder: (context, snapshot) {
        print("123==${widget.amount}");
        if (snapshot.hasData) {
          switch (snapshot.data!.status) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green[400],
                ),
              );
            case Status.SUCCESS:
              count = snapshot.data!.data;

              if (count?.data?.payment?.isEmpty ?? true) {
                return EmptyPaymentStateImage(); // Show the empty state widget
              }
              return Container(
                child: Stack(
                  children: [
                    // Positioned(top: 280,left: 90,
                    //     child:),
                    Container(
                        //color: Colors.red,
                        height: MediaQuery.of(context).size.height,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: count?.data?.payment?.length,
                                  itemBuilder: (context, index) {
                                    final paymentIndex = index + 1;
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(18),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 5.0, sigmaY: 5.0),
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                                color: Colors.white12
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Text(
                                                      paymentIndex.toString(),
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 80),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                        child: Image.asset(
                                                          "assets/images/icons8-rupee-24.png",
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                          count
                                                                  ?.data
                                                                  ?.payment?[
                                                                      index]
                                                                  .amount ??
                                                              "",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, left: 72),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          count
                                                                  ?.data
                                                                  ?.payment?[
                                                                      index]
                                                                  .date ??
                                                              "",
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SchemePaymentScreen(
                                                  date: count?.data?.payment?[0]
                                                          .date ??
                                                      "",
                                                  id: count?.data?.schemeId ??
                                                      "",
                                                  amount: count
                                                          ?.data
                                                          ?.payment?[0]
                                                          .amount ??
                                                      "",
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: Appcolors.app,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              child: Center(
                                                  child: Text(
                                                "Subscribe",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ))),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              );
            case Status.ERROR:
              return const Text("Network Issue");
            case Status.COMPLETED:
              break;
          }
        }
        return Container(
          color: Colors.white,
        );
      },
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
    final roundingHeight = size.height * 3 / 5;

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
