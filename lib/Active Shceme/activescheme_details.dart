import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CommonWidget/Colors/Color.dart';
import '../Moduels/Bloc/ActiveSchemeDetails_Bloc.dart';

import '../Moduels/Model/ActiveSchemeDetailsList.dart';
import '../Network/Respones.dart';
import '../PaymentScreen/payment_sreen.dart';
import 'active _shceme.dart';

class ActiveSchemeDetails extends StatefulWidget {
  const ActiveSchemeDetails({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ActiveSchemeDetails> createState() => _ActiveSchemeDetailsState();
}

class _ActiveSchemeDetailsState extends State<ActiveSchemeDetails> {
  ActiveSchemeDetailsList? doc;
  late ActiveSchemeDetailsListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ActiveSchemeDetailsListBloc(widget.id.toString());
  }

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
          title: Text(
            "Active Scheme Details",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActiveScheme()),
              );
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.white,
            ),
          ),
        ),
        body: StreamBuilder<Response<ActiveSchemeDetailsList>>(
          stream: _bloc.activeschemedetailsListDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("13berin==${doc?.schemeDetails}");
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(22),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white12.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(22),
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
                                                  BorderRadius.circular(22)),
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Started On",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  doc?.schemeDetails
                                                          ?.startDate ??
                                                      "",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(22),
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
                                                  BorderRadius.circular(22)),
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Pending Periods",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  doc?.schemeDetails?.pending ??
                                                      "",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(22),
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
                                                  BorderRadius.circular(22)),
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Matruity on",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  doc?.schemeDetails?.endDate ??
                                                      "",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
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
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, top: 15, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment Details",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                child: Center(
                                    child: Text(
                                  "${doc?.remaining ?? ""}/${doc?.total ?? ""}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      color: Colors.white),
                                )),
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xFF1C1C97)),
                              )
                            ],
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            height: 380,
                            child: Align(
                                alignment: Alignment.center,
                                child: Column(children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: doc?.payments?.length,
                                      itemBuilder: (context, index) {
                                        final payment = doc?.payments?[index];
                                        final isFirstCard = index == 0;
                                        final paymentIndex = index + 1;

                                        final paymentAmount =
                                            payment?.paymentAmount ?? "";
                                        final paymentDates =
                                            payment?.paymentDate ?? "";
                                        final paymentStatus =
                                            payment?.status ?? "";
                                        final isPaid = paymentStatus == "1";
                                        final textColor = isPaid
                                            ? Colors.green
                                            : Colors.black;

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 5.0, sigmaY: 5.0),
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 8),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                    color: Colors.white12
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        paymentIndex.toString(),
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                              height: 15,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/icons8-rupee-24.png",
                                                                color: Colors
                                                                    .white,
                                                              )),
                                                          Text(
                                                            paymentAmount,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        paymentDates,
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
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
                                ]))),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            final payment = doc?.payments?.firstWhere(
                                (payment) => payment.status == "3");
                            if (payment != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                    date: payment.paymentDate.toString(),
                                    amount: payment.paymentAmount.toString(),
                                    id: payment.schemeId.toString(),
                                    sub: payment.subscriptionId.toString(),
                                    Id: widget.id,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Pay",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Appcolors.app,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                //   LayoutBuilder(builder: (context, constraints) {
                //   return Container(
                //     height: constraints.maxHeight,
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: AssetImage("assets/images/Active-scheme-1.jpg"),
                //         fit: BoxFit.fill,
                //       ),
                //     ),
                //     child: SingleChildScrollView(
                //       child: Column(
                //         children: [
                //           SizedBox(height: 20,),
                //         Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Row(
                //                   children: [
                //                     IconButton(
                //                       onPressed: () {
                //                         Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                               builder: (context) => ActiveScheme()),
                //                         );
                //                       },
                //                       icon: Icon(
                //                         Icons.arrow_back_ios,
                //                         color: Colors.white,
                //                       ),
                //                     ),
                //
                //                     // IconButton(
                //                     //   onPressed: () {},
                //                     //   icon: Icon(
                //                     //     Icons.notifications,
                //                     //     color: Colors.white,
                //                     //   ),
                //                     // ),
                //                   ],
                //                 ),
                //         ),
                //           Padding(
                //             padding: const EdgeInsets.only(bottom: 30),
                //             child: SizedBox(
                //               child: Text(
                //                 "Active Scheme",
                //                 style: TextStyle(
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 18),
                //               ),
                //             ),
                //           ),SizedBox(height: 130,),
                //           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: [
                //               Card(
                //                         elevation: 10,
                //                         shape: RoundedRectangleBorder(
                //                           borderRadius: BorderRadius.circular(10.0),
                //                         ),
                //                         child: Container(
                //                           width: 100,
                //                           height: 80,
                //                           child: Padding(
                //                             padding: EdgeInsets.only(top: 20),
                //                             child: Column(
                //                               children: [
                //                                 Text(
                //                                   "Started On",
                //                                   style: TextStyle(
                //                                       color: Color(0xFF1C1C97),
                //                                       fontWeight: FontWeight.bold,
                //                                       fontSize: 9),
                //                                 ),
                //                                 SizedBox(
                //                                   height: 5,
                //                                 ),
                //                                 Text(
                //                                   doc?.schemeDetails?.startDate ?? "",
                //                                   style: TextStyle(
                //                                       color: Color(0xFF1C1C97),
                //                                       fontSize: 14,
                //                                       fontWeight: FontWeight.bold),
                //                                 )
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //               Card(
                //                         elevation: 10,
                //                         shape: RoundedRectangleBorder(
                //                           borderRadius: BorderRadius.circular(10.0),
                //                         ),
                //                         child: Container(
                //                           width: 100,
                //                           height: 80,
                //                           child: Padding(
                //                             padding: EdgeInsets.only(top: 20),
                //                             child: Column(
                //                               children: [
                //                                 Text(
                //                                   "Pending Periods",
                //                                   style: TextStyle(
                //                                       color: Color(0xFF1C1C97),
                //                                       fontWeight: FontWeight.bold,
                //                                       fontSize: 9),
                //                                 ),
                //                                 SizedBox(
                //                                   height: 5,
                //                                 ),
                //                                 Text(
                //                                   doc?.schemeDetails?.month ?? "",
                //                                   style: TextStyle(
                //                                       color: Color(0xFF1C1C97),
                //                                       fontSize: 14,
                //                                       fontWeight: FontWeight.bold),
                //                                 )
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //               Card(
                //                         elevation: 10,
                //                         shape: RoundedRectangleBorder(
                //                           borderRadius: BorderRadius.circular(10.0),
                //                         ),
                //                         child: Container(
                //                           width: 100,
                //                           height: 80,
                //                           child: Padding(
                //                             padding: EdgeInsets.only(top: 20),
                //                             child: Column(
                //                               children: [
                //                                 Text(
                //                                   "Matruity on",
                //                                   style: TextStyle(
                //                                       color: Color(0xFF1C1C97),
                //                                       fontWeight: FontWeight.bold,
                //                                       fontSize: 9),
                //                                 ),
                //                                 SizedBox(height: 5),
                //                                 Text(
                //                                   doc?.schemeDetails?.endDate ?? "",
                //                                   style: TextStyle(
                //                                       color: Color(0xFF1C1C97),
                //                                       fontSize: 14,
                //                                       fontWeight: FontWeight.bold),
                //                                 )
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //             ],
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                     Text(
                //                           "Payment Details",
                //                           style: TextStyle(
                //                               fontSize: 13,
                //                               color: Colors.black,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                   Container(
                //                           child: Center(
                //                               child: Text(
                //                             "${doc?.remaining??""}/${doc?.total??""}",
                //                             style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: 10,
                //                                 color: Colors.white),
                //                           )),
                //                           height: 20,
                //                           width: 90,
                //                           decoration: BoxDecoration(
                //                               borderRadius: BorderRadius.circular(5),
                //                               color: Color(0xFF1C1C97)),
                //                         )
                //               ],
                //             ),
                //           ),
                //       Container(
                //                 width: constraints.maxWidth,
                //                 height: 310,
                //                 child: Align(
                //                   alignment: Alignment.center,
                //                   child: Column(
                //                     children: [
                //                       Expanded(
                //                         child: ListView.builder(
                //                           itemCount: doc?.payments?.length,
                //                           itemBuilder: (context, index) {
                //                             final payment = doc?.payments?[index];
                //                             final isFirstCard = index == 0;
                //                             final paymentIndex = index + 1;
                //
                //                             final paymentAmount = payment?.paymentAmount ?? "";
                //                             final paymentDates = payment?.paymentDate ?? "";
                //                             final paymentStatus = payment?.status ?? "";
                //                             final isPaid = paymentStatus == "1";
                //                             final textColor = isPaid ? Colors.green : Colors.black;
                //
                //                             return Padding(
                //                               padding: const EdgeInsets.only(left: 15, right: 15),
                //                               child: Container(
                //                                 height: 50,
                //                                 child: Card(
                //                                   elevation: 5,
                //                                   child: Row(
                //                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //                                     children: [
                //                                       Center(
                //                                         child: Text(
                //                                           paymentIndex.toString(),
                //                                           style: TextStyle(
                //                                             fontSize: 15,
                //                                             fontWeight: FontWeight.bold,
                //                                             color: Color(0xFF151517),
                //                                           ),
                //                                         ),
                //                                       ),
                //                                       Center(
                //                                         child: Text(
                //                                           paymentAmount,
                //                                           style: TextStyle(
                //                                             fontSize: 15,
                //                                             fontWeight: FontWeight.bold,
                //                                             color: textColor,
                //                                           ),
                //                                         ),
                //                                       ),
                //                                       Center(
                //                                         child: Text(
                //                                           paymentDates,
                //                                           style: TextStyle(
                //                                             fontSize: 13,
                //                                             fontWeight: FontWeight.bold,
                //                                             color: textColor,
                //                                           ),
                //                                         ),
                //                                       ),
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                             );
                //                           },
                //                         ),
                //                       ),
                //                       SizedBox(height: 10),
                //                       GestureDetector(
                //                         onTap: () {
                //                           final payment = doc?.payments?.firstWhere((payment) => payment.status == "3");
                //                           if (payment != null) {
                //                             Navigator.push(
                //                               context,
                //                               MaterialPageRoute(
                //                                 builder: (context) => PaymentScreen(
                //                                   date: payment.paymentDate.toString(),
                //                                   amount: payment.paymentAmount.toString(),
                //                                   id: payment.schemeId.toString(),
                //                                   sub: payment.subscriptionId.toString(),
                //                                   Id: widget.id,
                //                                 ),
                //                               ),
                //                             );
                //                           }
                //                         },
                //                         child: Container(
                //                           child: Center(
                //                             child: Text(
                //                               "Pay",
                //                               style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: 18,
                //                                 color: Colors.white,
                //                               ),
                //                             ),
                //                           ),
                //                           height: 45,
                //                           width: 250,
                //                           decoration: BoxDecoration(
                //                             borderRadius: BorderRadius.circular(10),
                //                             color: Color(0xFF1C1C97),
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //         SizedBox(height: 20,)
                //         //
                //         ],
                //       ),
                //     ),
                //
                //   );
                // });

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

// Widget to display the empty state with an image
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
