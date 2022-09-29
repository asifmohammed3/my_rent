import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/firebase/functions.dart';
import 'package:my_rent/global_variables/global.dart';
import 'package:my_rent/main.dart';
import 'package:my_rent/screens/screen_main_page.dart';

Future<bool> signUp(String emailAddress, String password) async {
  bool isSuccess = false;
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    Future.delayed(Duration(seconds: 1), () async {
      await updateRole();
     });
      tokenID = await FirebaseAuth.instance.currentUser!.getIdToken(true);
    print(tokenID.toString());

    print(JwtDecoder.decode(tokenID));
   
     
   
    isSuccess = true;
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(
        msg: e.message!,
        gravity: ToastGravity.BOTTOM,
        fontSize: 13,
        backgroundColor: customBlue);

    isSuccess = false;
    if (e.code == 'weak-password') {
      Fluttertoast.showToast(
          msg: 'The password provided is too weak.',
          gravity: ToastGravity.BOTTOM,
          fontSize: 13,
          backgroundColor: customBlue);

      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      Fluttertoast.showToast(
          msg: 'The account already exists for that email.',
          gravity: ToastGravity.BOTTOM,
          fontSize: 13,
          backgroundColor: customBlue);

      print('The account already exists for that email.');
    }
  } catch (e) {
    isSuccess = false;
    print(e);
  }
  return isSuccess;
}

Future<bool> signIn(String emailAddress, String password) async {
  bool isSuccess;
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);

      
  
    isSuccess = true;
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(
        msg: e.message!,
        gravity: ToastGravity.BOTTOM,
        fontSize: 13,
        backgroundColor: customBlue);

    isSuccess = false;
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  return isSuccess;
}

signOut() async {
  await FirebaseAuth.instance.signOut();
  tokenID = "";
}
