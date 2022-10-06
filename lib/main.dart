import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:my_rent/firebase_options.dart';
import 'package:my_rent/global_variables/global.dart';
import 'package:my_rent/gql_client.dart';
import 'package:my_rent/register_signin_sections/screen_register_next.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/screen_add_unit/screen_add_unit.dart';
import 'package:my_rent/screens/screen_main_page.dart';
import 'package:my_rent/splash_screen/onboarding/screen_main_splash.dart';
import 'package:my_rent/splash_screen/onboarding/screen_onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // String token = await FirebaseAuth.instance.currentUser!.getIdToken();
  //   print(token.toString());

  //   print(JwtDecoder.decode(token));

  FirebaseAuth.instance.idTokenChanges().listen((user) async {
    print("ID changed");
    if (user == null) {
      print('User is currently signed out!');
    } else {
      await user.getIdToken().then((String token) {
        tokenID = token;
        print(tokenID);
      });
    }
  });

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
    ),
  );

  runApp(GraphQLProvider(
    client: client,
    child: MaterialApp(
        title: 'My Rent',
        theme: ThemeData(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          scaffoldBackgroundColor: Color.fromARGB(255, 245, 245, 245),
        ),
        home: SplashScreen()),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // return ScreenRegisterNext();
          if (userSnapshot.hasData) {
            return ScreenMainPage();
          } else {
            return ScreenOnboarding();
          }
        });
  }
}
