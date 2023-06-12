import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/dio_client.dart';
import '../../data/repositories/authentication_repository_impl.dart';
import '../../data/repositories/nasa_repository_impl.dart';
import '../../data/services/api_service.dart';
import '../../features/home/bloc/home_screen_bloc.dart';
import 'auth/auth_bloc.dart';
import 'auth/auth_event.dart';
import 'auth/auth_state.dart';

class GlobalBlocProvider extends StatelessWidget {
  final Widget child;

  const GlobalBlocProvider({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(
            authenticationRepository: AuthenticationRepositoryImpl(
              firebaseAuth: FirebaseAuth.instance,
            ),
            initState: AuthInitial(),
          )..add(AppStarted()),
        ),
        BlocProvider<HomeScreenBloc>(
          create: (BuildContext context) => HomeScreenBloc(
            nasaRepository: NasaRepositoryImpl(
              nasaPhotosService: NasaPhotosService(
                DioConfig.configureDioClient(),
              ),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
