import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_rent/global_variables/global.dart';

Future<void> updateRole() async {
  try {
    final result = await FirebaseFunctions.instance
        .httpsCallable('updateRole')
        .call(<String, dynamic>{
      'roles': ['owner'],
    });

    print("update status : ${result.data}");
    print("role updated");
  } on FirebaseFunctionsException catch (error) {
    print("roleupdaterr:  ${error.code}");
    print(("roleupdaterr    ${error.details}"));
    print(("roleupdaterr    ${error.message}"));
  }
}
