import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'src/creative_fabrica_app.dart';
import 'src/shared/bloc/bloc_observer.dart';

void main() => runZonedGuarded<void>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        Bloc.observer = const AppBlocObserver();
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        runApp(const CreativeFabricaApp());
      },
      (error, stack) => log('Top level exception $error'),
    );
