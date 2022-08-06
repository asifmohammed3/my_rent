import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_rent/global_variables/global.dart';

Future<void> updateRole() async {

  try {
    final result = await FirebaseFunctions.instance
        .httpsCallable('updateRole')
        .call(tokenID);
  } on FirebaseFunctionsException catch (error) {
    print(error.code);
    print(error.details);
    print(error.message);
  }
}

// Future<void> processSignUp() async {

//   try {
//     final result = await FirebaseFunctions.instance
//         .httpsCallable('processSignUp')
//         .call(tokenID);
//   } on FirebaseFunctionsException catch (error) {
//     print(error.code);
//     print(error.details);
//     print(error.message);
//   }
// }