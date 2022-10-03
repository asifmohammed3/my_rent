import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:my_rent/global_variables/global.dart';

HttpLink httpLink = HttpLink(
  'http://ec2-15-207-18-21.ap-south-1.compute.amazonaws.com/v1/graphql',
  // defaultHeaders: <String, String>{
  //   'Authorization':
  //       'Bearer ${() async => await FirebaseAuth.instance.currentUser!.getIdToken()}',
  //   //'x-hasura-admin-secret': 'myRent12'
  // },
);



final AuthLink authLink = AuthLink(
  getToken: () async {
         tokenID = await FirebaseAuth.instance.currentUser!.getIdToken(true);

   
   
     print("tokenID  " +JwtDecoder.decode(tokenID).toString());

    return 'Bearer $tokenID';
  },
  // OR
  // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
);

final Link link = authLink.concat(httpLink);
