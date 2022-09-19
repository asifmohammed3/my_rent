import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:my_rent/firebase_options.dart';
import 'package:my_rent/global_variables/global.dart';
import 'package:my_rent/register_signin_sections/screen_register_next.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/screens/screen_main_page.dart';
import 'package:my_rent/splash_screen/onboarding/screen_main_splash.dart';
import 'package:my_rent/splash_screen/onboarding/screen_onboarding.dart';
import 'package:my_rent/splash_screen/select_prop_or_veh/screen_select_prop_or_veh.dart';

import 'package:my_rent/widgets/drawer_section/cust_drawer.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((user) async {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');

      final tokenResult = await FirebaseAuth.instance.currentUser!.getIdToken();
      tokenID = tokenResult;
      //print(tokenResult);

      Map<String, dynamic> decodedToken = JwtDecoder.decode(tokenResult);
      print(decodedToken);
    }
  });

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Rent',
      theme: ThemeData(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        scaffoldBackgroundColor: Color.fromARGB(255, 245, 245, 245),
      ),
      home: SplashScreen(),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.hasData) {
          return ScreenMainPage();
        } else {
          return ScreenOnboarding();
        }
      },
    );
  }
}
