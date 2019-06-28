
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:escanor/delegate/delegate.dart';
import 'package:escanor/user_repository.dart';
import 'package:flutter/widgets.dart';

import 'aplication_start.dart';
import 'bloc/authentication/bloc/authentication_bloc.dart';
import 'bloc/authentication/bloc/authentication_event.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    builder: (context) => AuthenticationBloc( userRepository: userRepository)
    ..dispatch(AppStart()),
    child: App(userRepository: userRepository,),)
  );
}