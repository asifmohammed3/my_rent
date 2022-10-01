import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_rent/global_variables/global.dart';

class WidgetTest extends StatelessWidget {
  const WidgetTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Query(
          options: QueryOptions(
            fetchPolicy: FetchPolicy.cacheAndNetwork,

            document: gql(
                getOwnerDetails), // this is the query string you just created
          ),
          // Just like in apollo refetch() could be used to manually trigger a refetch
          // while fetchMore() can be used for pagination purpose
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Text('Loading');
            }

            dynamic repositories = result.data?['owner_details'];

            print(repositories);

            return Text(repositories.toString());
          },
        ),
      ),
    );
    ;
  }
}

final String getOwnerDetails = """
  query GET_OWNER_DETAILS(\$user_Id: String) {
  owner_details(where: {uid: {_eq: \$user_Id}}){
    business_name,
    business_type,
    address
  }
}
""";
