import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genesis/Network/BaseUrl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../CommonWidget/Colors/Color.dart';
import '../HomeScreen/Homepage.dart';
import '../LOGIN/Login_page.dart';
import '../Moduels/Bloc/ReferralCode_Bolc.dart';
import '../Moduels/Model/ReferralCode.dart';
import '../Network/Respones.dart';
import '../main.dart';

class ContactPickerPage extends StatefulWidget {
  @override
  _ContactPickerPageState createState() => _ContactPickerPageState();
}

class _ContactPickerPageState extends State<ContactPickerPage> {
  Contact? _selectedContact;

  // final String refrralcode= doc?.referralCode ??"";
//  String _androidAppLink =
//     "https://play.google.com/store/apps/details?id=com.genesis_jewelcraft";
//  String _iosAppLink =
//     "https://apps.apple.com/us/app/genesis-jewelcraft/id6451096043";

  void _shareTextAndLinks() {
    final String refrralcode = doc?.referralCode ?? "";
    String _androidAppLink =
        "https://play.google.com/store/apps/details?id=com.genesis_jewelcraft";
    String _iosAppLink =
        "https://apps.apple.com/us/app/genesis-jewelcraft/id6451096043";

    String message =
        "Invite code: $refrralcode\nAndroid App Link: $_androidAppLink\niOS App Link: $_iosAppLink";

    Share.share(
      message,
      subject: 'Genesis Jewelcraft ', // Optional subject for email apps
    );
  }

  void _makePayment(String name, String mobile) async {
    // Make the API call
    final response = await http.post(
      Uri.parse('http://${baseUrl}referral/store/${user_id ?? globalUserId}'),
      // Add any necessary headers or data
      body: {
        'name': name,
        'mobile': mobile,
        'email': "",
        // Add any other required payment parameters
      },
    );

    // Handle the API response
    if (response.statusCode == 200) {
      // Payment successful
      print("API Response: ${response.body}");
    } else {
      // Payment failed
      print('API call failed with status code: ${response.statusCode}');
    }
  }

  Future<void> _pickContact() async {
    setState(() {
      _isLoadingContacts = true; // Show progress indicator
    });

    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      if (contacts.isNotEmpty) {
        List<Contact> filteredContacts =
            List.from(contacts); // Create a copy of the contacts list
        Contact? selectedContact = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContactListPage(contacts: filteredContacts),
          ),
        );

        // Iterable<Contact> contacts = await ContactsService.getContacts();
        // if (contacts.isNotEmpty) {
        //   List<Contact> filteredContacts = List.from(contacts);
        // Create a copy of the contacts list
        // Contact? selectedContact = await
        //    showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return StatefulBuilder(
        //       builder: (context, setState) {
        //         return AlertDialog(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(20.0),
        //           ),
        //           title: Text('Select Contact'),
        //           content: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               TextField(
        //                 onChanged: (value) {
        //                   setState(() {
        //                     // Filter the contacts list based on the search text
        //                     filteredContacts = contacts.where((contact) =>
        //                         contact.displayName
        //                             !.toLowerCase()
        //                             .contains(value.toLowerCase())).toList();
        //                   });
        //                 },
        //                 decoration: InputDecoration(
        //                   labelText: 'Search',
        //                   prefixIcon: Icon(Icons.search),
        //                 ),
        //               ),
        //               Expanded(
        //                 child: ListView.builder(
        //                   itemCount: filteredContacts.length,
        //                   itemBuilder: (context, index) {
        //                     Contact contact = filteredContacts[index];
        //                     return SimpleDialogOption(
        //                       onPressed: () {
        //                         Navigator.pop(context, contact);
        //                       },
        //                       child: ListTile(
        //                         leading: CircleAvatar(
        //                           backgroundImage: contact.avatar != null
        //                               ? MemoryImage(contact.avatar!)
        //                               : null,
        //                           child: contact.avatar == null
        //                               ? Icon(Icons.person)
        //                               : null,
        //                         )
        //                         title: Text(contact.displayName ?? ""),
        //                         subtitle: Text(
        //                           contact.phones!.isNotEmpty
        //                               ? contact.phones!.first.value ?? "No phone number"
        //                               : "No phone number",
        //                         ),
        //                       ),
        //                     );
        //                   },
        //                 ),
        //               ),
        //             ],
        //           ),
        //         );
        //       },
        //     );
        //   },
        // );

        if (selectedContact != null) {
          setState(() {
            _selectedContact = selectedContact;
          });
          _openWhatsApp();
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('No contacts found'),
              content: Text('There are no contacts available on your device.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Permission denied'),
            content: Text('You have denied contact access permission.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _openWhatsApp() async {
    if (_selectedContact != null && _selectedContact!.phones!.isNotEmpty) {
      String phoneNumber = _selectedContact!.phones!.first.value!;
      String message = doc?.referralCode ?? "";
      // Ensure the phone number is in international format (e.g., with a '+').
      if (!phoneNumber.startsWith('+91')) {
        phoneNumber = '+91${phoneNumber.replaceAll(RegExp(r'\D'), '')}';
      }
      String androidAppLink =
          "https://play.google.com/store/apps/details?id=com.genesis_jewelcraft";
      String iosAppLink =
          "https://apps.apple.com/us/app/genesis-jewelcraft/id6451096043"; // Replace with the actual iOS app link

      // Encode the message in the URL
      String encodedMessage = Uri.encodeComponent(message);
      String encodedReferralCode =
          Uri.encodeComponent("Use my InviteeCode: $encodedMessage");
      String encodedAndroidAppLink =
          Uri.encodeComponent("Download Android App: $androidAppLink");
      String encodedIosAppLink =
          Uri.encodeComponent("Download iOS App: $iosAppLink");
      final url =
          'https://wa.me/$phoneNumber?text=$encodedReferralCode%0A$encodedAndroidAppLink%0A$encodedIosAppLink';

      if (await canLaunch(url)) {
        // Make the API call before opening WhatsApp
        if (_selectedContact!.displayName != null &&
            _selectedContact!.phones!.isNotEmpty) {
          String name = _selectedContact!.displayName!;
          String mobile = _selectedContact!.phones!.first.value!;
          _makePayment(name, mobile);
        }

        await launch(url);

        // Clear the selected contact after opening WhatsApp.
        setState(() {
          _selectedContact = null;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    name: "",
                    code: '',
                  )),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Could not open WhatsApp.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: doc?.referralCode ?? ''));

    final snackBar = SnackBar(content: Text('Text copied to clipboard'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _refreshData() {
    setState(() {
      _selectedContact = null;
    });
  }

  ReferralCode? doc;
  late ReferralCodeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ReferralCodeBloc();
  }

  bool _isLoadingContacts = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      //assets/images/invite-eran-bg.png
      decoration: BoxDecoration(
          //color: Colors.white10.withOpacity(0.15),
          image: DecorationImage(
              image: AssetImage("assets/images/invite-eran-bg.png"),
              fit: BoxFit.cover)),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Invite And Earn",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
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
              color: Colors.black,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _refreshData();
          },
          child: StreamBuilder<Response<ReferralCode>>(
            stream: _bloc.referralcodeDataStream,
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
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 22, bottom: 16),
                      child: Center(
                        child: Column(children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(27),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  decoration: BoxDecoration(
                                      color: Colors.white10.withOpacity(0.1),

                                      // border: Border.all(color: Colors.grey, width: 0.3),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    Text(
                                      "Unlock exclusive rewards and",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "bonuses by inviting your",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "friends",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.17,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.17,
                                      child: SvgPicture.asset(
                                          "assets/images/invitebox.svg"),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    DottedBorder(
                                      color: Appcolors.app,
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(30),
                                      dashPattern: [10, 7],
                                      strokeWidth: 1.5,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.09,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            // BoxShadow(
                                            //     color: Colors.black26,
                                            //     offset: Offset(0, 4),
                                            //     blurRadius: 5.0)
                                          ],
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            stops: [0.0, 1.0],
                                            colors: [
                                              Color.fromARGB(255, 92, 91, 95),
                                              Color.fromARGB(
                                                  255, 170, 169, 172),
                                            ],
                                          ),
                                          // border: DottedBorder(child: child),
                                          // color: Colors.deepPurple.shade300,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Your invite code is",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      doc?.referralCode ?? "",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                VerticalDivider(
                                                  width: 1.5,
                                                  color: Colors.white,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Copy",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Code",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    Text(
                                      "Share your Invitee code via",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // _isLoadingContacts
                                        //     ? null
                                        //     : _pickContact();
                                        _shareTextAndLinks();
                                      },
                                      child:
                                          // _isLoadingContacts
                                          //     ? Center(
                                          //         child:
                                          //             CircularProgressIndicator()) // Show progress indicator
                                          //     :
                                          Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Appcolors.app),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Invite",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          ),
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
      ),
    );
  }
}

class ContactListPage extends StatefulWidget {
  final List<Contact> contacts;

  ContactListPage({required this.contacts});

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<Contact> filteredContacts = [];

  @override
  void initState() {
    filteredContacts = widget.contacts;
    super.initState();
  }

  void _filterContacts(String query) {
    setState(() {
      filteredContacts = widget.contacts
          .where((contact) =>
              contact.displayName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.app,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  name: '',
                  code: '',
                ),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text('Select Contact'),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0.0),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged:
                  _filterContacts, // Call _filterContacts when the user types in the search field
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                Contact contact = filteredContacts[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/images/Google_Contacts_icon.svg.png"),
                      // contact.avatar != null
                      //     ? MemoryImage(contact.avatar!)
                      //     : null,
                      // child: contact.avatar == null ? Icon(Icons.person) : null,
                    ),
                    title: Text(contact.displayName ?? ""),
                    subtitle: Text(
                      contact.phones!.isNotEmpty
                          ? contact.phones!.first.value ?? "No phone number"
                          : "No phone number",
                    ),
                    onTap: () {
                      Navigator.pop(context, contact);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
