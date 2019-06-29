import 'dart:async';

import 'package:escanor/model/user_principle.dart';
import 'package:meta/meta.dart';

import 'commons/share_preference/user_preference.dart';

class UserRepository {

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    var principle = new UserPrinciple(username, password);
    await UserPreference.setUserPrinciple(principle);
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> signUp({@required String email, @required String password}) async{
    print('coba login '+email);
    var principle = new UserPrinciple(email, password);
    await UserPreference.setUserPrinciple(principle);
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future<bool> isSignedIn() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future<UserPrinciple> getUser() async {
    await Future.delayed(Duration(seconds: 1));
    return await UserPreference.getUserPrinciple();
  }



}
