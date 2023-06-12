import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/repositories/authentication_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

final class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authenticationRepository;

  AuthBloc({
    required AuthenticationRepository authenticationRepository,
    required AuthState initState,
  })  : _authenticationRepository = authenticationRepository,
        super(initState) {
    on<AppStarted>(_onAnonymousSignIn);
  }

  Future<void> _onAnonymousSignIn(AppStarted event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      await _authenticationRepository.signInAnonymously();
      final user = _authenticationRepository.getUser();
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        throw Exception('User not found');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'operation-not-allowed':
          emit(AuthFailure("Anonymous auth hasn't been enabled for this project."));
        case _:
          emit(AuthFailure('Unknown error.'));
      }
    } on Object catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
