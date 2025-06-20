import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference items = FirebaseFirestore.instance.collection(
    'items',
  );
  String? selectedCategory;

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

  Future<void> resetPassword(String email) async {
    try {
      // Send reset email
      await _auth.sendPasswordResetEmail(email: email);

      // Listen for password changes (optional)
      _auth.authStateChanges().listen((User? user) {
        if (user != null && user.email == email.trim()) {
          // Can update lastReset timestamp if needed
          _firestore.collection('users').doc(user.uid).update({
            'lastPasswordReset': FieldValue.serverTimestamp(),
          });
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<QuerySnapshot> getItemStream(String uid) {
    Query query = items.where('uid', isEqualTo: uid);

    if (selectedCategory != null) {
      query = query.where('category', isEqualTo: selectedCategory);
    }
    return query.snapshots();
  }
}
