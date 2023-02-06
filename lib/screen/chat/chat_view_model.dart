import 'package:chat/database_utils/database_Utils.dart';
import 'package:chat/models/Room.dart';
import 'package:chat/models/message.dart';
import 'package:chat/models/user.dart';
import 'package:chat/screen/chat/chat-navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../base.dart';

class ChatViewModel extends BaseViewModel<ChatNavigator>{
  late Room room;
  late MyUser myUser;
  void sendMessage(String messageContent){
    Message message=Message(
        content: messageContent,
        dateTime: DateTime.now().millisecondsSinceEpoch,
        roomId: room.id,
        senderId: myUser.id,
        senderName: myUser.userName
    );
    DatabaseUtils.addMessageToFirebase(message).then((value) {
      navigator!.UploadMessagetoFirsore();
    });
  }
  Stream<QuerySnapshot<Message>> getMessage(){
    return DatabaseUtils.readMessageFormFirebase(room.id);
  }



}