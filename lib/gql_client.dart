import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:my_rent/global_variables/global.dart';

// HttpLink httpLink = HttpLink(
//   'http://ec2-15-207-18-21.ap-south-1.compute.amazonaws.com/v1/graphql',
//   // defaultHeaders: <String, String>{
//   //   'Authorization':
//   //       'Bearer ${() async => await FirebaseAuth.instance.currentUser!.getIdToken()}',
//   //   //'x-hasura-admin-secret': 'myRent12'
//   // },
// );

// Future get _token async {
//   return await FirebaseAuth.instance.currentUser!.getIdToken();
// }

// final AuthLink authLink = AuthLink(
//   getToken: () async {
//     final token = await _token;

//     print("token  " + JwtDecoder.decode(token).toString());
//     print("====" +tokenID);
//     print("tokenID  " + JwtDecoder.decode(tokenID).toString());

//     return 'Bearer $tokenID';
//   },
//   // OR
//   // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
// );

// final Link link = authLink.concat(httpLink);








class GraphQLConfig {
  Future get _token async {
    return await FirebaseAuth.instance.currentUser!.getIdToken();
  }

  static HttpLink httpLink = HttpLink(
    'http://ec2-15-207-18-21.ap-south-1.compute.amazonaws.com/v1/graphql',
  );

  ///if you want to pass token
  static ValueNotifier<GraphQLClient> graphInit() {
    // We're using HiveStore for persistence,
    // so we need to initialize Hive.

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $tokenID',
    );

    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(
          store: InMemoryStore(),
        ),
      ),
    );

    return client;
  }

  GraphQLClient clientToQuery() {
    AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $tokenID',
    );

    final Link link = authLink.concat(httpLink);
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
    );
  }
}
