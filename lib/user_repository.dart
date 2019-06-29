import 'dart:async';
import 'dart:convert';
import 'package:escanor/commons/utils/config.dart';
import 'package:escanor/model/response_authentication.dart';
import 'package:escanor/model/user_principle.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'commons/share_preference/user_preference.dart';



class UserRepository {


  Future<Map> createPost({String url, var body}) async {
    return http.post(Uri.encodeFull(url), body: body, headers: {"Content-Type":"application/json"}).then((http.Response response) {
    final int statusCode = response.statusCode;
    print("statusCode "+statusCode.toString());
    
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return json.decode(response.body);
    });
  }


  Future<String> authenticate({String email, String password}) async {
    try {
      Map response = await createPost(url:Config.baseUrlTechinlabs, body: jsonEncode({	
        "email": "robismandax3@gmail.com",
  "password": "QW!@qw12"
      }));
      print("get token "+response.toString());
    } catch (e){
      print("error wtf "+ e.toString());
    }
   
    var principle = new UserPrinciple(email, password);
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
