
import 'package:escanor/bloc/login/bloc/bloc.dart';
import 'package:escanor/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository userRepository;

  const LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        this.userRepository = userRepository,
        super(key: key);
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  @override
  LoginScreen get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider<LoginBloc>(
        builder: (context) => LoginBloc(userRepository: widget.userRepository),
        child: LoginForm(userRepository: widget.userRepository),
      ),
    );
  }
}
