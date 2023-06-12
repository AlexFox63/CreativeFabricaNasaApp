import 'package:flutter/material.dart';

import 'features/login/login_screen.dart';
import 'shared/bloc/global_bloc_provider.dart';

class CreativeFabricaApp extends StatefulWidget {
  const CreativeFabricaApp({
    Key? key,
  }) : super(key: key);

  @override
  State<CreativeFabricaApp> createState() => _CreativeFabricaAppState();
}

class _CreativeFabricaAppState extends State<CreativeFabricaApp> {
  @override
  Widget build(BuildContext context) {
    return GlobalBlocProvider(
      child: MaterialApp(
        title: 'Creative Fabrica test task',
        home: LoginScreen(),
      ),
    );
  }
}
