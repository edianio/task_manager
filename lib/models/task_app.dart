import 'package:cloud_firestore/cloud_firestore.dart';

class TaskApp{
  String? id;
  late String title;
  String? description;
  late Timestamp createDate;
  Timestamp? doneDate;
  bool isDone = false;

  TaskApp({this.id, required this.title, this.description, required this.createDate,
    this.doneDate, required this.isDone});

  TaskApp.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc){
    id = doc.id;
    title = doc.data()!['title'] as String;
    description = doc.data()?['description'] as String?;
    createDate = doc.data()!['createDate'] as Timestamp;
    doneDate = doc.data()?['doneDate'] as Timestamp?;
    isDone = doc.data()!['isDone'] as bool;
  }

  Map<String, dynamic> toMap() => {
    'title': title,
    'description': description,
    'createDate': createDate,
    'doneDate': doneDate,
    'isDone': isDone,
  };
}