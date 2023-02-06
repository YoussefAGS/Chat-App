import 'package:chat/base.dart';
import 'package:chat/models/user.dart';

abstract class CreateAccountNavigator extends BaseNavigator{
  void goToHome(MyUser myUser);

}