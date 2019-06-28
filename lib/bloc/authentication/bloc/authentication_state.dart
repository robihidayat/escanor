import 'package:equatable/equatable.dart';
import 'package:escanor/model/user_principle.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super(props);
}

class InitialAuthenticationState extends AuthenticationState {}


class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class SplashScrean extends AuthenticationState{
  @override
  String toString()=> 'SplashScrean';
}

class Authenticated extends AuthenticationState {
  final UserPrinciple userPrinciple;

  Authenticated(this.userPrinciple) : super([userPrinciple]);

  @override
  String toString() => 'Authenticated { displayName: $userPrinciple }';
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}
