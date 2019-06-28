

import 'package:escanor/page/splash_screen.dart';
import 'package:escanor/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authentication/bloc/authentication_bloc.dart';
import 'bloc/authentication/bloc/bloc.dart';
import 'page/landing_page.dart';
import 'page/login_screan.dart';

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
        : assert(userRepository != null),
          _userRepository = userRepository,
          super(key: key);
          
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (BuildContext context, AuthenticationState state) {
          if(state is Uninitialized){
            return SplashScreen();
          }
          if (state is Unauthenticated){
            return LoginScreen(userRepository: _userRepository);
          }
          if(state is Authenticated){
            return LandingPage(name: state.userPrinciple);
          }
        },
      ),
      
    );
  }
}