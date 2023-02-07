import 'package:chat/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Room.dart';
import '../models/message.dart';
class DatabaseUtils {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance.collection("Users").withConverter<MyUser>(
        fromFirestore: (snapshot, option) => MyUser.fromJson(snapshot.data()!),
        toFirestore: (value, option) => value.toJson());
  }

  static Future<void> AddUserToFirebase(MyUser user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> readUserFormFirebase(String id) async {
    DocumentSnapshot<MyUser> user = await getUserCollection().doc(id).get();
    var myUser = user.data();
    return myUser;
  }

  //Room
  static CollectionReference<Room> getRoomCollection() {
    return FirebaseFirestore.instance.collection("Rooms").withConverter<Room>(
        fromFirestore: (snapshot, option) => Room.fromJson(snapshot.data()!),
        toFirestore: (value, option) => value.toJson());
  }

  static Future<void> AddRoomToFirebase(Room room) {
    var collection=getRoomCollection();
  var docref=collection.doc();
  room.id=docref.id;
  return docref.set(room);
  }

  static Future<List<Room>> readRoomFormFirebase() async {
    QuerySnapshot<Room> rooms= await getRoomCollection().get();

    return rooms.docs.map((e) =>e.data()).toList();
  }
  static Future<QuerySnapshot<Room>> readRoomFormFirebase2()  {

    return getRoomCollection().get();
  }
  //message
  static CollectionReference<Message> getMessageCollection(String roomId) {
    return getRoomCollection().doc(roomId).collection("Messages").withConverter<Message>(
        fromFirestore: (snapshot, option) => Message.fromJson(snapshot.data()!),
        toFirestore: (value, option) => value.toJson());
  }

  static Future<void> addMessageToFirebase(Message message) {
    var collection=getMessageCollection(message.roomId);
    var docref=collection.doc();
    message.id=docref.id;
    return docref.set(message);
  }

  static Stream<QuerySnapshot<Message>> readMessageFormFirebase(String roomId){
    return getMessageCollection(roomId).orderBy('dateTime').snapshots();
  }
}
