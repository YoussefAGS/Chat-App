import 'package:chat/base.dart';
import 'package:chat/database_utils/database_Utils.dart';
import 'package:chat/models/Room.dart';

import 'home_navigator.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator>{
  List<Room>rooms=[];

  readRooms(){
    DatabaseUtils.readRoomFormFirebase().then((value) {
      rooms=value;
    }).catchError((error){
      navigator!.showMessage(error.toString());
    });

  }


}