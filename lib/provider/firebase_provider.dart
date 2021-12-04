import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:inframe/model/user.dart';
import 'package:path/path.dart' as path;

class FirebaseProvider {
  User get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('Not authenticated exception');
    return user;
  }

  FirebaseDatabase get firestore => FirebaseDatabase.instance;

  FirebaseStorage get storage => FirebaseStorage.instance;

  Future<MyUser?> getMyUser() async {
    final ref = await firestore.reference().child('user').child(currentUser.uid);
    final Map<String,Object> userData = Map<String,Object>();
    ref.once().then((snapshot) => {
      if(snapshot.exists){
        userData.addAll(snapshot.value)

      }
    });
    if(userData.isEmpty){
      return null;
    }else{
      return MyUser.fromFirebaseMap(userData);
    }

  }

  Future<void> saveMyUser(MyUser user, File? image) async {
    final ref = firestore.reference().child('user').child(currentUser.uid);
    if (image != null) {
      final imagePath =
          '${currentUser.uid}/profile/${path.basename(image.path)}';
      final storageRef = storage.ref(imagePath);
      await storageRef.putFile(image);
      final url = await storageRef.getDownloadURL();
      await ref.set(user.toFirebaseMap(newImage: url));
    } else {
      await ref.set(user.toFirebaseMap());
    }
  }
}
