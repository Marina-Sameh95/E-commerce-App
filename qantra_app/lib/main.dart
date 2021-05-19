import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qantra_app/GUI/Login.dart';
import 'package:qantra_app/provider/main_provider.dart';
import 'package:splashscreen/splashscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
    ChangeNotifierProvider<MainDataProvider>(
      create: (_) => MainDataProvider(),
      child:
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elezaby',
        home: Container(
            alignment: Alignment.center,
            child: Container(
              child: SplashScreen(
                seconds: 2,
                backgroundColor: Colors.white,
                loaderColor: Color.fromARGB(250, 25, 112, 147),
                image: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.fill,
                ),
                photoSize: 100,
                loadingText: Text(
                  'Loading...',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Color.fromARGB(250, 25, 112, 147),
                  ),
                ),
                navigateAfterSeconds: Login(),


              ),
            ))),
    ),
  ));
}


