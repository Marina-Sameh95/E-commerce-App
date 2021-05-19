import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qantra_app/GUI/Login.dart';
import 'package:qantra_app/provider/main_provider.dart';
import 'package:toast/toast.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<MainDataProvider>(
        create: (_) => MainDataProvider(),
        child: _RegisterProviderBody(),
      ),
    );
  }
}

class _RegisterProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterProviderBodyState();
  }
}

class _RegisterProviderBodyState extends State<_RegisterProviderBody> {
  FirebaseAuth instance = FirebaseAuth.instance;
  // FirebaseUser user = result.user;
  void showToast(String msg,
      {int duration, int gravity, Color backgroundColor}) {
    Toast.show(msg, context,
        duration: duration, gravity: gravity, backgroundColor: backgroundColor);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataProvider>(
        builder: (_, MainDataProvider myProvider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body:  SingleChildScrollView(
            child: Stack(children: [
              Positioned(
                  top: -210,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'images/appImg.png',
                      fit: BoxFit.fitWidth,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 170),
                child: Column(
                  children: [
                    /// Register text fields
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          /// NAME title
                          Container(
                              child: Text(
                            'NAME',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              fontFamily: 'Ubuntu',
                            ),
                          )),

                          /// NAME textField
                          Container(
                              child: new TextFormField(
                                  controller: Provider.of<MainDataProvider>(
                                          context,
                                          listen: false)
                                      .nameController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                  ),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontFamily: 'Ubuntu',
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ))),

                          SizedBox(
                            height: 30,
                          ),

                          /// phone title
                          Container(
                              child: Text(
                            'PHONE NUMBER',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              fontFamily: 'Ubuntu',
                            ),
                          )),

                          /// phone textField
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      child: new TextFormField(
                                          controller:
                                              Provider.of<MainDataProvider>(
                                                      context,
                                                      listen: false)
                                                  .phoneController,
                                          keyboardType: TextInputType.phone,
                                          textInputAction: TextInputAction.done,
                                          decoration: new InputDecoration(
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                          ),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Ubuntu',
                                            fontSize: 21,
                                            fontWeight: FontWeight.w500,
                                          )))),
                              Container(
                                child: Image.asset(
                                  'images/writing.png',
                                ),
                              )
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          /// email title
                          Container(
                              child: Text(
                            'EMAIL ADDRESS',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              fontFamily: 'Ubuntu',
                            ),
                          )),

                          /// email textField
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      child: new TextFormField(
                                          controller:
                                              Provider.of<MainDataProvider>(
                                                      context,
                                                      listen: false)
                                                  .emailAddressController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          enableSuggestions: true,
                                          autovalidate: true,
                                          maxLengthEnforced: true,
                                          validator: (value) {
                                            if (value == null || value == '') {
                                            } else {
                                              Pattern pattern =
                                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                              RegExp regex = new RegExp(pattern);
                                              if (!(value.contains(regex))) {
                                                return "Invalid Email";
                                              }
                                            }
                                            return null;
                                          },
                                          decoration: new InputDecoration(
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                          ),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Ubuntu',
                                            fontSize: 21,
                                            fontWeight: FontWeight.w500,
                                          )))),
                              Container(
                                child: Image.asset(
                                  'images/writing.png',
                                ),
                              )
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          /// password title
                          Container(
                              child: Text(
                            'PASSWORD',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              fontFamily: 'Ubuntu',
                            ),
                          )),

                          /// password textField
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      child: new TextFormField(
                                          obscureText: true,
                                          controller:
                                              Provider.of<MainDataProvider>(
                                                      context,
                                                      listen: false)
                                                  .passController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          enableSuggestions: true,
                                          autovalidate: true,
                                          maxLengthEnforced: true,
                                          validator: (value) {
                                            if (value == null || value == '') {
                                            } else {
                                              if (value.length < 6) {
                                                return "Password must be at least 6 characters long";
                                              }
                                            }
                                            return null;
                                          },
                                          decoration: new InputDecoration(
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                          ),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Ubuntu',
                                            fontSize: 33,
                                            fontWeight: FontWeight.w500,
                                          )))),
                              Container(
                                child: Image.asset(
                                  'images/writing.png',
                                ),
                              )
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          /// address title
                          Container(
                              child: Text(
                            'ADDRESS',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              fontFamily: 'Ubuntu',
                            ),
                          )),

                          /// address textField
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      child: new TextFormField(
                                          controller:
                                              Provider.of<MainDataProvider>(
                                                      context,
                                                      listen: false)
                                                  .addressController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          decoration: new InputDecoration(
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                          ),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Ubuntu',
                                            fontSize: 21,
                                            fontWeight: FontWeight.w500,
                                          )))),
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          /// terms and conditions
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (bool newValue) {},
                                checkColor: Colors.blue,
                              ),
                              Container(
                                child: Text(
                                  'I have read and agree to the ',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Terms and conditions',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    fontFamily: 'Ubuntu',
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                    decorationThickness: 2.5,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          /// sign up button
                          Container(
                            decoration: BoxDecoration(),
                            width: MediaQuery.of(context).size.width / 0.9,
                            height: 65,
                            child: new OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(250, 14, 105, 167)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                              ),
                              onPressed: () async {
                                try {
                                  UserCredential credential = await instance
                                      .createUserWithEmailAndPassword(
                                          email: myProvider
                                              .emailAddressController.text,
                                          password:
                                              myProvider.passController.text);
                               Map <String, dynamic> data = {'Name':myProvider.nameController.text,
                               'phoneNumber':myProvider.phoneController.text, 'email':myProvider.emailAddressController.text,
                               'address':myProvider.addressController.text};
                               FirebaseFirestore.instance.collection('userData').add(data);
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Login()),
                                      (Route<dynamic> route) => false);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    showToast(
                                      'Password must be at least 6 characters',
                                      duration: 5,
                                      gravity: Toast.BOTTOM,
                                      backgroundColor:
                                          Color.fromARGB(250, 14, 105, 167),
                                    );
                                  } else if (e.code == 'email-already-in-use') {
                                    showToast(
                                      'This email used before',
                                      duration: 5,
                                      gravity: Toast.BOTTOM,
                                      backgroundColor:
                                          Color.fromARGB(250, 14, 105, 167),
                                    );
                                  }
                                }
                              },
                              child: new Text('Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Ubuntu',
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ));
    });
  }
}
