// ignore: one_member_abstracts
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthenticationRepository {
  Future<void> signInAnonymously();

  bool isSignedIn();

  User? getUser();
}
