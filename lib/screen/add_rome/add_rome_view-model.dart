import 'package:chat/base.dart';
import 'package:chat/database_utils/database_Utils.dart';
import 'package:chat/models/Room.dart';
import 'package:chat/screen/add_rome/add_room_navigator.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator>{
  void addRoomToDB(String title,String description,String category){
    Room room =Room( title: title, description: description, category: category);
    DatabaseUtils.AddRoomToFirebase(room).then((value) {
      navigator!.goToHome();

    });

}


}