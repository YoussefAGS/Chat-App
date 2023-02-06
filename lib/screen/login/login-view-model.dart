
import 'package:chat/base.dart';
import 'package:chat/database_utils/database_Utils.dart';
import 'package:chat/layout/home/home_screen.dart';
import 'package:chat/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login-navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator>{

  String message="";
  void loginWithFirbaseAuth(String emailAddress,String password)async{
    try {
      navigator!.showLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      message = "Login successful";

      MyUser? myUser=await DatabaseUtils.readUserFormFirebase(credential.user?.uid??"");

      if(myUser!=null){
        navigator!.hideLoading();
        navigator!.goToHome(myUser);
        return;
      }

    } on FirebaseAuthException catch (e) {
      message = "email or password is invalid";

    } catch (e) {
     message = e.toString();
    }
    if(message!=""){
      navigator!.hideLoading();
      navigator!.showMessage(message);
    }
  }
}