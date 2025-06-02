import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      _firestore.collection('users').doc(credential.user?.uid).set({
        'name': name.trim(),
        'email': email.trim(),
        'password': password.trim(),
        'role': role,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.toString();
    }
    return null;
  }

  Future<String?> logIn({
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(credential.user?.uid)
          .get();
      return userDoc['role'];
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('User signed out successfully');
    } catch (e) {
      print('Error signing out : $e');
    }
  }
}
