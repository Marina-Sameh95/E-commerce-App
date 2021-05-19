import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qantra_app/GUI/Home.dart';
import 'package:qantra_app/GUI/Register.dart';
import 'package:qantra_app/provider/main_provider.dart';
import 'package:toast/toast.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<MainDataProvider>(
        create: (_) => MainDataProvider(),
        child: _LoginProviderBody(),
      ),
    );
  }
}

class _LoginProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginProviderBodyState();
  }
}

class _LoginProviderBodyState extends State<_LoginProviderBody> {
  FirebaseAuth instance = FirebaseAuth.instance;
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
              body: Container(
                  child:
                  SingleChildScrollView(child:
                  Stack(children: [
                    Positioned(
                        top: -210,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child:
                          Image.asset('images/appImg.png',fit: BoxFit.fitWidth
                            ,),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 170),
                      child: Column(
                        children: [
                          ///login text fields
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20,top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ///email title
                                Container(
                                    child:Text(
                                      'EMAIL ADDRESS',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        fontFamily: 'Ubuntu',
                                      ),
                                    )),
                                ///email textField
                                Container(
                                    child: new TextFormField(
                                        controller: Provider.of<MainDataProvider>(context,
                                            listen: false)
                                            .emailController,
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
                                ///password title
                                Container(
                                    child:Text(
                                      'PASSWORD',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        fontFamily: 'Ubuntu',
                                      ),
                                    )),

                                Row(
                                  children: [
                                    ///password textField
                                    Expanded(
                                        child: Container(
                                            child: new TextFormField(
                                                obscureText: true,
                                                controller: Provider.of<MainDataProvider>(context,
                                                    listen: false)
                                                    .passwordController,
                                                keyboardType: TextInputType.text,
                                                textInputAction: TextInputAction.done,
                                                decoration: new InputDecoration(
                                                  contentPadding: EdgeInsets.all(10.0),
                                                ),
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontFamily: 'Ubuntu',
                                                  fontSize: 33,
                                                  fontWeight: FontWeight.w500,
                                                )))),
                                    ///forget password
                                    Container(
                                      child: Text(
                                        'Forget Password',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),


                                    ),
                                  ],),

                                SizedBox(
                                  height: 70,
                                ),
                                ///signUp button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Don\'t have an account ?',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: InkWell(
                                          onTap: () async{
                                            Navigator.of(context).pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (BuildContext context) =>
                                                        Register()),
                                                    (Route<dynamic> route) => false);
                                          },
                                          child:Text(
                                            ' Sign up',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              fontFamily: 'Ubuntu',
                                            ),
                                          )),
                                    ),
                                  ],),

                                SizedBox(
                                  height: 20,
                                ),
                                ///social media signIn
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Image.asset(
                                          'images/facebook.png',
                                          width: 80,
                                          height: 80,
                                        )
                                    ),
                                    Container(
                                        child: Image.asset(
                                          'images/gmail.png',
                                          width: 80,
                                          height: 80,
                                        )
                                    ),
                                  ],),

                                SizedBox(
                                  height: 20,
                                ),

                                /// sign in button
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
                                              borderRadius: BorderRadius.circular(10.0))),
                                    ),
                                    onPressed: () async {
                                      try {
                                        UserCredential credential =
                                        await instance.signInWithEmailAndPassword(
                                            email: myProvider.emailController.text,
                                            password: myProvider.passwordController.text);
                                        showToast(
                                          'Logged in Successfully',
                                          duration: 5,
                                          gravity:
                                          Toast.BOTTOM,
                                          backgroundColor:
                                          Color.fromARGB(250, 14, 105, 167),
                                        );
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    Home()),
                                                (Route<dynamic> route) => false);
                                      } on FirebaseAuthException catch (e){
                                        if(e.code == 'user-not-found'){
                                          showToast(
                                            'Invalid User',
                                            duration: 5,
                                            gravity:
                                            Toast.BOTTOM,
                                            backgroundColor:
                                            Color.fromARGB(250, 14, 105, 167),
                                          );
                                        } else if (e.code == 'wrong-password'){
                                          showToast(
                                            'Invalid Password',
                                            duration: 5,
                                            gravity:
                                            Toast.BOTTOM,
                                            backgroundColor:
                                            Color.fromARGB(250, 14, 105, 167),
                                          );
                                        }
                                      }

                                    },
                                    child: new Text('Sign In',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize:18,
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

                  ]
                  ),
                  )));
        });
  }
}
