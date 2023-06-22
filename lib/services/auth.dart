import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  String? uid;

  Future<bool> login(String emailAddress, String password) async {
    try {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailAddress, password: password);

        if (credential.user != null) {
          return true;
        }
        return false;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        } else if (e.code == 'email-already-in-use') {
          return true;
        }
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
