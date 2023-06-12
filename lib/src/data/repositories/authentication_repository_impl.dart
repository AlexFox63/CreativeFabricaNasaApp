import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/authentication_repository.dart';

final class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth firebaseAuth;

  AuthenticationRepositoryImpl({required this.firebaseAuth});

  @override
  Future<void> signInAnonymously() => firebaseAuth.signInAnonymously();

  @override
  bool isSignedIn() => firebaseAuth.currentUser != null;

  @override
  User? getUser() => firebaseAuth.currentUser;
}
