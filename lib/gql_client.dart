import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_rent/global_variables/global.dart';

final HttpLink httpLink = HttpLink(
    'http://ec2-15-207-18-21.ap-south-1.compute.amazonaws.com/v1/graphql',
    defaultHeaders:  <String, String>{
      'x-hasura-admin-secret': 'myRent12',
    },

  );
  final AuthLink authLink = AuthLink(
    getToken: () => 'Bearer $tokenID',
  );

  final Link link = authLink.concat(httpLink);