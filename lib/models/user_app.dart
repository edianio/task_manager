import 'package:cloud_firestore/cloud_firestore.dart';

class UserApp{
  String? id;
  late String name;
  late String email;
  String? password;
  String? confirmPassword;

  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('users/$id');

  UserApp({this.id, required this.name, required this.email, this.password, this.confirmPassword});

  UserApp.fromDocument(DocumentSnapshot<Map<String,dynamic>> doc){
    id = doc.id;
    name = doc.data()!['name'] as String;
    email = doc.data()!['email'] as String;
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'email': email,
    // 'password': password,
  };

  Future<void> saveUser() async {
    await firestoreRef.set(toMap());
  }

  Future<void> updateData() async{
    await firestoreRef.update({
      'name': name,
      'email': email,
    });
  }
}