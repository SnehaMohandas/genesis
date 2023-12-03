import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genesis/Terms_and_Condition/terms_and_condition.dart';

import '../CommonWidget/Colors/Color.dart';
import '../HomeScreen/Homepage.dart';
import '../Moduels/Bloc/Scheme_Bloc.dart';
import '../Moduels/Model/SchemeList.dart';
import '../Network/Respones.dart';
import 'SchemeDetails.dart';

class Schemes extends StatefulWidget {
  const Schemes({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<Schemes> createState() => _ActiveSchemeState();
}

class _ActiveSchemeState extends State<Schemes> {
  // Sample list of items

  SchemeList? doc;
  late SchemeListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SchemeListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.white10.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/scheme_bg.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Schemes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
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
              color: Colors.white,
            ),
          ),
        ),
        body: StreamBuilder<Response<SchemeList>>(
          stream: _bloc.schemeListDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("13berin==${doc?.data}");
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green[400],
                    ),
                  );
                case Status.SUCCESS:
                  doc = snapshot.data!.data;
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        //  SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(27),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.8,
                              decoration: BoxDecoration(
                                  color: Colors.white10.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(27)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 1, right: 1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Visibility(
                                          visible: false,
                                          child: Text(
                                            "Sl.no",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                        ),
                                        Column(
                                          children: [
                                            Text("Monthly",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            Text("Amount",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 0, left: 6),
                                          child: Column(
                                            children: [
                                              Text("Periods",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Column(
                                            children: [
                                              Text("Maturity",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 89,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      physics: AlwaysScrollableScrollPhysics(),
                                      itemCount: doc?.data?.length,
                                      itemBuilder: (context, index) {
                                        final paymentIndex = index + 1;
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color: Colors
                                                                .black54))),
                                                // elevation: 1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      paymentIndex.toString(),
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
                                                          height: 15,
                                                          child: Image.asset(
                                                              "assets/images/icons8-rupee-24.png",
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          doc?.data?[index]
                                                                  .amount ??
                                                              "",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            doc?.data?[index]
                                                                    .duration ??
                                                                "",
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
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 15,
                                                            child: Image.asset(
                                                                "assets/images/icons8-rupee-24.png",
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Text(
                                                            doc?.data?[index]
                                                                    .total ??
                                                                "",
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
                                                    GestureDetector(
                                                      //=================
                                                      onTap: () {
                                                        //============

                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return TermsandCondition(
                                                            id: doc!
                                                                .data![index].id
                                                                .toString(),
                                                          );
                                                        }));
                                                        //=========================
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 67,
                                                        margin: EdgeInsets.only(
                                                            top: 10,
                                                            left: 15,
                                                            right: 7,
                                                            bottom: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(40),
                                                          color: Appcolors.app,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "Subscribe",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
