import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genesis/CommonWidget/Colors/Color.dart';

import '../HomeScreen/Homepage.dart';
import '../Moduels/Bloc/ActiveScheme_Bloc.dart';
import '../Moduels/Model/Active scheme.dart';
import '../Network/Respones.dart';
import 'activescheme_details.dart';

class ActiveScheme extends StatefulWidget {
  const ActiveScheme({Key? key}) : super(key: key);

  @override
  State<ActiveScheme> createState() => _ActiveSchemeState();
}

class _ActiveSchemeState extends State<ActiveScheme> {
  // Sample list of items

  ActiveSchemeList? doc;
  late ActiveSchemeListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ActiveSchemeListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //color: Colors.white10.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/active-scheme-bg.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePage(
                          code: '',
                          name: '',
                        )),
              );
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            " Active Scheme ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<Response<ActiveSchemeList>>(
          stream: _bloc.activeschemeListDataStream,
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
                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(27),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.white10.withOpacity(0.15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        // Visibility(
                                        //   visible: false,
                                        //   child: Text(
                                        //     "Sl no",
                                        //     style: TextStyle(
                                        //         fontWeight: FontWeight.bold,
                                        //         color: Colors.white),
                                        //   ),
                                        // ),
                                        Text(
                                          "Scheme",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Amount",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 0),
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.74,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: ListView.builder(
                                                  itemCount: doc?.data?.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ActiveSchemeDetails(
                                                                    id: doc!
                                                                        .data![
                                                                            index]
                                                                        .id!
                                                                        .toString(),
                                                                  )),
                                                        );
                                                      },
                                                      child: Container(
                                                        // shape: Border(bottom: BorderSide(width: 1,color: Colors.grey)),
                                                        // elevation: 0,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.11,
                                                        margin: EdgeInsets.only(
                                                            bottom: 5,
                                                            right: 10),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Color
                                                                    .fromARGB(
                                                                        166,
                                                                        158,
                                                                        158,
                                                                        158)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 0),
                                                              child: Center(
                                                                child: SizedBox(
                                                                  height: 20,
                                                                  child: Image
                                                                      .asset(
                                                                          "assets/images/diamondblue.png"),
                                                                ),
                                                              ),
                                                              // child: Text(
                                                              //   doc?.data?[index]
                                                              //           .slNo ??
                                                              //       "",
                                                              //   style: TextStyle(
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .bold,
                                                              //       fontFamily:
                                                              //           "Poppins",
                                                              //       color: Colors
                                                              //           .white),
                                                              // ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15,
                                                                      left: 0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    doc?.data?[index]
                                                                            .name ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    "Start Date: ${doc?.data?[index].startDate}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    "Maturity Period: ${doc?.data?[index].endDate}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 15),
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                      height:
                                                                          15,
                                                                      child: Image.asset(
                                                                          "assets/images/icons8-rupee-24.png",
                                                                          color:
                                                                              Colors.white)),
                                                                  Text(doc?.data?[index].amount ?? "",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.white)),
                                                                ],
                                                              ),
                                                            ),
                                                            IconButton(
                                                                onPressed: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ActiveSchemeDetails(
                                                                              id: doc!.data![index].id!.toString(),
                                                                            )),
                                                                  );
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  size: 18,
                                                                  color: Colors
                                                                      .grey,
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
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
      ),
    );
  }
}
