
import 'package:chat/database_utils/database_Utils.dart';
import 'package:chat/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  MyUser? myUser;
  User? firebaseUser;
  MyProvider(){
  firebaseUser= FirebaseAuth.instance.currentUser;
  if(firebaseUser!=null){
    initUser();
  }

  }
  void initUser()async{
    myUser=await DatabaseUtils.readUserFormFirebase(firebaseUser?.uid??"");
  }

}