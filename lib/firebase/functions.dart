import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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



Future<String> getImgUrl(String fileName) async {
  final Ref = FirebaseStorage.instance.ref();
  try {
    var res = await Ref.child(fileName).getDownloadURL();
    print("res----" + res.toString());
    return res;
  } catch (e) {
    print("img errrrrrrrrr" + e.toString());
    return "";
  }
}