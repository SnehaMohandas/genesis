import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genesis/CommonWidget/Colors/Color.dart';
import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

import '../Network/BaseUrl.dart';
import 'Login_page.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String password = '';
  String name = '';
  String phone = '';
  String nominee = '';
  String referralcode = '';
  String email = '';
  String aadhaar = '';
  String nominee_relation = '';
  bool _isChecked = false;
  File? _file;

  Future<void> signUp() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid form, do not proceed
      return;
    }

    // Save the form values
    _formKey.currentState!.save();

    String url = '${base}auth/register';

    // Create the multipart request
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add form fields to the request
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['phone'] = phone;
    request.fields['nominee_name'] = nominee;
    request.fields['referral'] = referralcode;
    request.fields['password'] = password;
    request.fields['aadhar_no'] = aadhaar;
    request.fields['nominee_relation'] = nominee_relation;

    // Send the request and handle the response
    if (_file != null) {
      request.files
          .add(await http.MultipartFile.fromPath('user_img', _file!.path));
    }
    try {
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        // Registration success

        var responseBody = await response.stream.bytesToString();
        print('Response: $responseBody');

        // Parse the response
        Map<String, dynamic> data = json.decode(responseBody);
        bool status = data['status'];
        String message = data['message'];

        if (status) {
          // Registration success
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Registration Success'),
                content: Text('Registration was successful!'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen(id: "")),
                      );
                    },
                  ),
                ],
              );
            },
          );
        } else {
          print('Error: $message');

          // Show a Dialog box with error messages
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Registration Failed'),
                content: Text(message),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } else if (response.statusCode == 401) {
        // Unauthorized

        var responseBody = await response.stream.bytesToString();
        print('Response: $responseBody');

        // Parse the response
        Map<String, dynamic> data = json.decode(responseBody);

        // Check if validation errors exist
        if (data.containsKey('errors')) {
          Map<String, dynamic> errors = data['errors'];

          String emailError = '';
          String phoneError = '';

          // Extract email and phone errors if available
          if (errors.containsKey('email')) {
            emailError = errors['email'][0];
          }

          if (errors.containsKey('phone')) {
            phoneError = errors['phone'][0];
          }

          // Show a Dialog box with error messages
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(
                    child: Text('Registration Failed',
                        style: TextStyle(color: Colors.red))),
                content: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (emailError.isNotEmpty)
                        Text(' $emailError',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      SizedBox(height: 10),
                      if (phoneError.isNotEmpty)
                        Text(' $phoneError',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {
          String message = data['message'];

          // Show a Dialog box with the general error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Registration Failed'),
                content: Text(message),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Other errors
        print('Sign up request failed');

        // Show a SnackBar message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration request failed')),
        );
      }
    } catch (e) {
      // Error
      print('Error Registration request: $e');

      // Show a SnackBar message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error  Registration request')),
      );
    }
  }

  // Future<void> pickImageFromGallery() async {
  //   final imagePicker = ImagePicker();
  //   try {
  //     final image = await imagePicker.getImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       setState(() {
  //         _image = File(image.path);
  //       });
  //     }
  //   } on PlatformException catch (e) {
  //     if (e.code == "photo_access_denied") {
  //       print("The user did not allow photo access.");
  //     } else {
  //       print("Error: ${e.message}");
  //     }
  //   }
  // }
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 40,
                              // ),

                              // Row(
                              //   children: [
                              //     Spacer(),
                              //     Text(
                              //       'Sign Up',
                              //       style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 18,
                              //         color: Colors.black,
                              //       ),
                              //     ),
                              //     Spacer(),
                              //   ],
                              // ),
                              SizedBox(
                                height: 15,
                              ),
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: _file != null
                                        ? FileImage(_file!)
                                        : null,
                                    child: _file == null
                                        ? GestureDetector(
                                            onTap: () async {
                                              _pickFile();
                                            },
                                            child: Icon(
                                              Icons.add_a_photo,
                                              size: 50,
                                              color: Colors.white60,
                                            ),
                                          )
                                        : null,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 90),
                                    child: GestureDetector(
                                      onTap: () async {
                                        _pickFile();
                                      },
                                      child: Icon(Icons.camera_alt,
                                          size: 30, color: Colors.black26),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(height: 35),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: Row(
                                  children: [
                                    Text(
                                      '* ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                      // //filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'Name',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    name = value!;
                                  },
                                ),
                              ),
                              SizedBox(height: 14),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: Row(
                                  children: [
                                    Text(
                                      '* ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      'Mobile Number',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      //filled: true,
                                      //fillColor: Colors.white,
                                      labelText: 'Number',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    phone = value!;
                                  },
                                ),
                              ),
                              SizedBox(height: 14),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: Row(
                                  children: [
                                    Text(
                                      '* ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                      // filled: true,
                                      // fillColor: Colors.white,
                                      labelText: 'Email',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    email = value!;
                                  },
                                ),
                              ),
                              SizedBox(height: 14),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: Row(
                                  children: [
                                    Text(
                                      '* ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      'Nominee Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                      //  filled: true,
                                      //  fillColor: Colors.white,
                                      labelText: 'Nominee Name',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your nominee';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    nominee = value!;
                                  },
                                ),
                              ),
                              SizedBox(height: 14),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: Row(
                                  children: [
                                    Text(
                                      '* ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      'Relationship of Nominee',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                      //  filled: true,
                                      //   fillColor: Colors.white,
                                      labelText: 'Relationship of Nominee',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter yourr elationship of nominee';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    nominee_relation = value!;
                                  },
                                ),
                              ),
                              SizedBox(height: 14),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: Row(
                                  children: [
                                    Text(
                                      '* ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      'Permanent Address',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: TextFormField(
                                  maxLines: 4,
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                      hintText: "Permanent Address",
                                      // filled: true,
                                      //  fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your nominee';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    aadhaar = value!;
                                  },
                                ),
                              ),
                              SizedBox(height: 14),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: Row(
                                  children: const [
                                    Text(
                                      '* ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      'Invitee Code',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      //  filled: true,
                                      //   fillColor: Colors.white,
                                      labelText: 'Invitee code',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ))),
                                  onSaved: (value) {
                                    referralcode = value!;
                                  },
                                ),
                              ),
                              SizedBox(height: 14),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: Row(
                                  children: [
                                    Text(
                                      '* ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      //   filled: true,
                                      //   fillColor: Colors.white,
                                      labelText: 'Password',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ))),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    } else if (value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    password = value!;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 14, right: 14, top: 2),
                                child: Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          'The password should be at least 6 characters long.',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(height: 14),

                              SizedBox(height: 14),

                              // Row(
                              //   children: [
                              //     Checkbox(
                              //       value: _isChecked,
                              //       onChanged: (value) {
                              //         setState(() {
                              //           _isChecked = value ?? false;
                              //         });
                              //       },
                              //         activeColor: Colors.black, // Set the checkbox color when checked
                              //         checkColor: Colors.white
                              //     ),
                              //     Text('I agree to the terms and'),
                              //     TextButton(onPressed: (){}, child: const Text("conditions"))
                              //   ],
                              // ),
                              SizedBox(height: 25),
                              isLoading
                                  ? CircularProgressIndicator()
                                  : GestureDetector(
                                      onTap: () {
                                        signUp();
                                      },
                                      // _isChecked ?  signUp() : null;
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: Appcolors.app
                                              // image: DecorationImage(
                                              //   image: AssetImage("assets/images/bar.jpg"),
                                              //   fit: BoxFit.fill,
                                              // ),

                                              ),
                                          margin: EdgeInsets.only(
                                              left: 14, right: 14),
                                          width: 300,
                                          height: 50,
                                          child: Center(
                                              child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.white),
                                          ))),
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 22, top: 40),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.pop(context);
                    //     },
                    //     child: Container(
                    //       height: 50,
                    //       width: 50,
                    //       decoration: BoxDecoration(
                    //         color: Colors.white30,
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 7),
                    //         child: Icon(Icons.arrow_back_ios),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
