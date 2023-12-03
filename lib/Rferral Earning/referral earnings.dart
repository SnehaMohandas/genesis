import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CommonWidget/Colors/Color.dart';
import '../HomeScreen/Homepage.dart';
import '../Moduels/Bloc/Referralearning_Bloc.dart';
import '../Moduels/Model/ReferralEraningList.dart';
import '../Network/Respones.dart';

class ReferralEraningsScreen extends StatefulWidget {
  const ReferralEraningsScreen({Key? key}) : super(key: key);

  @override
  State<ReferralEraningsScreen> createState() => _ReferralStatusScreenState();
}

class _ReferralStatusScreenState extends State<ReferralEraningsScreen> {
  ReferralEarningList? count;
  late ReferralEarningListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ReferralEarningListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //assets/images/referalearnings_bg.png
      decoration: BoxDecoration(
          //color: Colors.white10.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/referalearnings_bg.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "Invite Earnings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
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
                Icons.arrow_circle_left_outlined,
                color: Colors.white,
              ),
            ),
          ),
          body: StreamBuilder<Response<ReferralEarningList>>(
            stream: _bloc.referralListDataStream,
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
                    count = snapshot.data!.data;
                    if (count?.data?.isEmpty ?? true) {
                      return EmptyPaymentStateImage(); // Show the empty state widget
                    }
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(27),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                decoration: BoxDecoration(
                                    color: Colors.white10.withOpacity(0.2),

                                    // border: Border.all(color: Colors.grey, width: 0.3),
                                    borderRadius: BorderRadius.circular(20)),

                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          // SizedBox(
                                          //   width:
                                          //       MediaQuery.of(context).size.width *
                                          //           0.05,
                                          // ),
                                          Text(
                                            "User Id  ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            "Earnings",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          physics:
                                              AlwaysScrollableScrollPhysics(),
                                          itemCount: count?.data?.length,
                                          itemBuilder: (context, index) {
                                            final payment = count?.data?[index];
                                            final isFirstCard = index ==
                                                0; // Check if it's the first card
                                            final paymentIndex = index +
                                                1; // Add 1 to the index to display the payment number
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, right: 0, top: 5),
                                              child: Container(
                                                height: 50,
                                                child: Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 20,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 0,
                                                                  right: 0),
                                                          child: Text(
                                                            "${payment?.name ?? ""}  ${payment?.registerid}",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 55),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  height: 15,
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/icons8-rupee-24.png",
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  payment?.referalAmount ??
                                                                      "",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white),
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
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //),
                              ),
                            ),
                          ),
                        )
                      ],
                    );

                  case Status.ERROR:
                    return const Text(
                      "Network Issue",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    );
                  case Status.COMPLETED:
                    break;
                }
              }
              return Container(
                color: Colors.white,
              );
            },
          )),
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
            'No Referral Earnings available',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
