import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebas_auth;
import 'package:fugipie_inventory/provider/usermodal.dart';

class AuthRepository {
  final firebas_auth.FirebaseAuth _firebaseAuth;

  AuthRepository({firebas_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebas_auth.FirebaseAuth.instance;

  var currentuser = Users.empty;

  Stream<Users> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? Users.empty : firebaseUser.toUser;
      currentuser = user;
      return user;
    });
  }

  Future<void> signup({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (_) {}
  }
  Future<void> loginWithEmailAndPassword({required String email, required String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(_){}
  }
  Future<void> logout()async{
    try{
      await Future.wait([_firebaseAuth.signOut()]);
    }catch(_){};
  }
}

extension on firebas_auth.User {
  Users get toUser {
    return Users(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
