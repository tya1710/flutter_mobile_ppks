import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser(String userId, String name, String phone) async {
    await users.doc(userId).set({
      'name': name,
      'phone': phone,
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
    });
  }


  Future<void> updateUser(String userId, String name, String phone) async {
    await users.doc(userId).update({
      'name': name,
      'phone': phone,
      'updatedAt': DateTime.now(),
    });
  }

 
  Future<Map<String, dynamic>?> getUser(String userId) async {
    DocumentSnapshot doc = await users.doc(userId).get();
    if (doc.exists) {
      return doc.data() as Map<String, dynamic>;
    }
    return null;
  }
}
