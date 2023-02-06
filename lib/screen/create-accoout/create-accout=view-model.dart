import 'package:chat/base.dart';
import 'package:chat/database_utils/database_Utils.dart';
import 'package:chat/models/user.dart';
import 'package:chat/shared/componats/firbase-errors.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'create-account-navigator.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator>{
   String message="";
  void CreateAccountWithFirbaseAuth(String emailAddress,String password,String firstName,String userName)async{
    try {
      navigator!.showLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      message = "Account created";
      MyUser myUser=MyUser(
          id: credential.user?.uid??"",
          firstName: firstName,
          userName: userName,
          email: emailAddress
      );
      DatabaseUtils.AddUserToFirebase(myUser).then((value){
        navigator!.hideLoading();
        navigator!.goToHome(myUser);
        return;
      });
    } on FirebaseAuthException catch (e) {
      if(e.code==FirebaseErrors.weakPassword){
        message="The password is too weak";
      }
      else if (e.code==FirebaseErrors.emailAlreadyInUse){
        message = "The email is already in Use";

      }

    } catch (e) {
      message = e.toString();
    }
    if(message!=""){
      navigator!.hideLoading();
      navigator!.showMessage(message);
    }



  }

}