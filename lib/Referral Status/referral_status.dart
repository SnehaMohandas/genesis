import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../CommonWidget/Colors/Color.dart';
import '../HomeScreen/Homepage.dart';

import '../Moduels/Bloc/ReferralStatusCompleted.dart';
import '../Moduels/Bloc/ReferralStatus_Bolc.dart';

import '../Moduels/Model/ReferralStatusCompleted.dart';
import '../Moduels/Model/ReferralStatusList.dart';
import '../Network/Respones.dart';
import '../Refer A Friend/refer.dart';
import '../Refer A Friend/refer_New.dart';

class ReferralStatusScreen extends StatefulWidget {
  const ReferralStatusScreen({Key? key}) : super(key: key);

  @override
  State<ReferralStatusScreen> createState() => _ReferralStatusScreenState();
}

class _ReferralStatusScreenState extends State<ReferralStatusScreen>
    with SingleTickerProviderStateMixin {
  // Add SingleTickerProviderStateMixin

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //assets/images/invited-status-bg.png
      decoration: BoxDecoration(
          //color: Colors.white10.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/invited-status-bg.png"),
              fit: BoxFit.cover)),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Invited Status',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white10.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: double.infinity,
                      child: TabBar(
                        padding: EdgeInsets.only(top: 6, bottom: 6),
                        controller: _tabController,
                        // indicatorSize: TabBarIndicatorSize.label,
                        // give the indicator a decoration (color and border radius)
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                          border: Border.all(
                              color: Color.fromARGB(166, 158, 158, 158)),
                          color: Colors.white,
                        ),
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Playfair Display"),
                        unselectedLabelColor: Colors.white,
                        tabs: const [
                          // first tab [you can add an icon using the icon property]
                          Tab(
                            text: 'Active',
                          ),
                          // second tab [you can add an icon using the icon property]
                          Tab(
                            text: 'Invited',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  ReferralActiveList(),

                  // second tab bar view widget
                  ReferralCompletedList()
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.052,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Appcolors.app,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactPickerPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Invite A Friend",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class ReferralActiveList extends StatefulWidget {
  const ReferralActiveList({Key? key}) : super(key: key);

  @override
  State<ReferralActiveList> createState() => _ReferralActiveListState();
}

class _ReferralActiveListState extends State<ReferralActiveList> {
  ReferralStatusList? com;
  late ReferralStatusListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ReferralStatusListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Response<ReferralStatusList>>(
      stream: _bloc.referralstatusListDataStream,
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
              com = snapshot.data!.data;
              if (com?.referralStatus?.isEmpty ?? true) {
                return ReferralActive(); // Show the empty state widget
              }
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.white10.withOpacity(0.2),

                          // border: Border.all(color: Colors.grey, width: 0.3),
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        itemCount: com?.referralStatus?.length,
                        itemBuilder: (context, index) {
                          final paymentIndex = index + 1;
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 8, bottom: 15, top: 5),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: com?.referralStatus?[index]
                                              .paymentStatus ==
                                          1
                                      ? SvgPicture.asset(
                                          'assets/images/invitestatus_tick.svg', // Replace with the path to your check icon image
                                          width: 20,
                                          height: 20,
                                        )
                                      : Image.asset(
                                          'assets/images/checked-1-2iD.png', // Replace with the path to your close icon image
                                          width: 20,
                                          height: 20,
                                        ),
                                ),
                                Expanded(
                                  // Wrap the potentially overflowing text with an Expanded widget
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      " ${com?.referralStatus?[index].userName ?? ""}: ${com?.referralStatus?[index].amount ?? ""}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 5),
                                  child: Text(
                                    "(${com?.referralStatus?[index].paymentStatusName ?? ""} ${com?.referralStatus?[index].paymentDate ?? ""})",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );

            case Status.ERROR:
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  "Network Error",
                  style: TextStyle(color: Colors.white),
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
    );
  }
}

class ReferralActive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
          ),
          // Replace with your image asset path
          Text(
            'No Active Invited available',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ReferralCompletedList extends StatefulWidget {
  const ReferralCompletedList({
    Key? key,
  }) : super(key: key);

  @override
  State<ReferralCompletedList> createState() => _QuestionCountState();
}

class _QuestionCountState extends State<ReferralCompletedList> {
  ReferralStatusCompleted_List? com;
  late ReferralStatusCompletedListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ReferralStatusCompletedListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Response<ReferralStatusCompleted_List>>(
      stream: _bloc.referralstatuscompletedListDataStream,
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
              com = snapshot.data!.data;
              if (com?.referral?.isEmpty ?? true) {
                return ReferralReferred(); // Show the empty state widget
              }
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.white10.withOpacity(0.2),

                          // border: Border.all(color: Colors.grey, width: 0.3),
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      child: ListView.builder(
                        itemCount: com?.referral?.length,
                        itemBuilder: (context, index) {
                          final paymentIndex = index + 1;
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 15),
                            child: Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: SvgPicture.asset(
                                      'assets/images/invitestatus_tick.svg', // Replace with the path to your check icon image
                                      width: 20,
                                      height: 20,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    " ${com?.referral?[index].name ?? ""}:",
                                    maxLines: 1,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 0,
                                      left: 5,
                                    ),
                                    child: com?.referral?[index].email != null
                                        ? Text(
                                            com?.referral?[index].email ?? "",
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 14,
                                                color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : Text(
                                            com?.referral?[index].mobile ?? "",
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 14,
                                                color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );

            case Status.ERROR:
              return const Text(
                "Network Error",
                style: TextStyle(color: Colors.white),
              );
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

class ReferralReferred extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Replace with your image asset path
          SizedBox(
            height: 100,
          ),
          Text(
            'No Invited data available',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
