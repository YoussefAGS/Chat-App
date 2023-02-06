// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo/models/task.dart';
//
// void addTask() {
//
// }
// CollectionReference<Task>getTaskColiction(){
//   return
//     FirebaseFirestore.instance.collection("Tasks").withConverter<Task>(
//         fromFirestore: (snapshot,option)=>Task.fromJson(snapshot.data()!),
//         toFirestore: (task,option)=> task.tojson());
//
// }
//
// Future<void> AddTasktoFirebase(Task task) {
//   var collection=getTaskColiction();
//   var docref=collection.doc();
//   task.id=docref.id;
//   return docref.set(task);
//
// }
// Stream<QuerySnapshot<Task>>getTaskFromFirebase(DateTime date){
//   return getTaskColiction().where('data',isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch).snapshots();
//
// }
// Future<void> DeletTask(String id) {
//   return getTaskColiction().doc(id).delete();
//
// }
//
// Future<void> update(Task task) {
//   return getTaskColiction().doc(task.id).update(task.tojson());
//
// }