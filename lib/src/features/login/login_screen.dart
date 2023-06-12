import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/bloc/auth/auth_bloc.dart';
import '../../shared/bloc/auth/auth_event.dart';
import '../../shared/bloc/auth/auth_state.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushReplacement<void, void>(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) => Center(
          child: state is AuthLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () => state is AuthFailure ? _onSignInPressed(context) : null,
                  child: const Text('Sign in anonymously'),
                ),
        ),
      ),
    );
  }

  void _onSignInPressed(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      AppStarted(),
    );
  }
}
