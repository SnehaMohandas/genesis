import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genesis/Payment%20History/paymeny_history.dart';
import '../CommonWidget/Colors/Color.dart';
import '../HomeScreen/Homepage.dart';
import '../Moduels/Bloc/PaymentHistoryDetails_Bloc.dart';
import '../Moduels/Model/PaymentHistorydetailsList.dart';
import '../Network/Respones.dart';

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

class PaymentHistoryDetails extends StatefulWidget {
  const PaymentHistoryDetails({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<PaymentHistoryDetails> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentHistoryDetails> {
  PaymentHistoryDetailsList? doc;
  late PaymentHistoryDetailsListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = PaymentHistoryDetailsListBloc(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.white10.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/payment_h_bg.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Payment History",
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
                MaterialPageRoute(
                    builder: (context) => PaymentHistoryScreen(
                          id: widget.id,
                        )),
              );
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.white,
            ),
          ),
        ),
        body: StreamBuilder<Response<PaymentHistoryDetailsList>>(
          stream: _bloc.paymenthistorydetailsListDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(27),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.white10.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 1, right: 1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Center(
                                              child: Text(
                                            "Month",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                          Center(
                                              child: Text(
                                            "Amount",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                          Center(
                                              child: Text(
                                            "Status",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                        ],
                                      ),
                                    ),
                                    // ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),

                                        shrinkWrap: true,
                                        padding: EdgeInsets
                                            .zero, // Add this line to remove padding
                                        itemCount: doc?.payments?.length,
                                        itemBuilder: (context, index) {
                                          final payment = doc?.payments?[index];
                                          final isPaid = payment?.status == "1";
                                          final isPaymentDue = payment
                                                  ?.status ==
                                              "4"; // Check if payment is due
                                          final statusText = isPaid
                                              ? "Paid"
                                              : (isPaymentDue
                                                  ? "Payment "
                                                  : "Pending");
                                          final isCurrentMonth =
                                              payment?.isCurrentMonth ?? true;
                                          Color paymentDateColor =
                                              isCurrentMonth
                                                  ? Colors.blue
                                                  : Colors.black;
                                          Color statusTextColor = isPaid
                                              ? Colors.green
                                              : (isPaymentDue
                                                  ? Colors.red
                                                  : Color.fromARGB(
                                                      255, 240, 225, 88));

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 1, right: 1, bottom: 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Color.fromARGB(
                                                              146,
                                                              158,
                                                              158,
                                                              158),
                                                          width: 1))),
                                              height: 50,
                                              child: Container(
                                                // shape: RoundedRectangleBorder(
                                                //   borderRadius: BorderRadius.circular(10.0),
                                                //
                                                // ),
                                                // elevation: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: isCurrentMonth
                                                          ? Color.fromARGB(
                                                              69, 0, 0, 0)
                                                          : Colors.transparent,
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        payment?.paymentDate ??
                                                            "",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 14,
                                                            child: Image.asset(
                                                                "assets/images/icons8-rupee-24.png",
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Text(
                                                            payment?.paymentAmount ??
                                                                "",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        statusText,
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              statusTextColor,
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
                                    // SizedBox(
                                    //   height:
                                    //       MediaQuery.of(context).size.height * 0.02,
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.38,
                                color: Colors.amber,
                              ),
                              SvgPicture.asset(
                                "assets/images/scheme.svg",
                                // semanticsLabel: "My SVG Image",
                                // height: 30,
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.38,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );

                case Status.ERROR:
                  return const Text("NetWork Issue");
                case Status.COMPLETED:
                  break;
              }
            }
            return Container(
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
