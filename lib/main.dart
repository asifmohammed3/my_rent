import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:my_rent/firebase_options.dart';
import 'package:my_rent/global_variables/global.dart';
import 'package:my_rent/gql_client.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/screens/screen_main_page.dart';
import 'package:my_rent/splash_screen/onboarding/screen_main_splash.dart';
import 'package:my_rent/splash_screen/onboarding/screen_onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
    ),
  );


  

  
  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key, required this.client}) : super(key: key);
  ValueNotifier<GraphQLClient> client;

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
    return GraphQLProvider(
      client: widget.client,
      child: MaterialApp(
        title: 'My Rent',
        theme: ThemeData(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          scaffoldBackgroundColor: Color.fromARGB(255, 245, 245, 245),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
