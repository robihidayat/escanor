import 'dart:convert';

import 'package:escanor/model/user_principle.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserPreference{


  ///
  /// Instantiation of the SharedPreferences library
  ///
  final String _kNotificationsPrefs = "allowNotifications";
  final String _kSortingOrderPrefs = "sortOrder";
  static final String _kUserPrinciple = "userPrinciple";

  static Future<bool> setUserPrinciple(UserPrinciple priciple) async {
	  final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonUser = jsonEncode(priciple.toJson());
    return prefs.setString(_kUserPrinciple, jsonUser);
  }

  static Future<UserPrinciple> getUserPrinciple() async {
	  final SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(_kUserPrinciple);
    final jsonResponse = new Map<String, dynamic>.from(json.decode(value));
    print("hasil map"+jsonResponse.toString());
    UserPrinciple userPrinciple = new UserPrinciple.fromJson(jsonResponse);
    return userPrinciple;
  }

  /// ------------------------------------------------------------
  /// Method that returns the user decision to allow notifications
  /// ------------------------------------------------------------
  Future<bool> getAllowsNotifications() async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();

  	return prefs.getBool(_kNotificationsPrefs) ?? false;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user decision to allow notifications
  /// ----------------------------------------------------------
  Future<bool> setAllowsNotifications(bool value) async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();

	return prefs.setBool(_kNotificationsPrefs, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the user decision on sorting order
  /// ------------------------------------------------------------
  Future<String> getSortingOrder() async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();

	return prefs.getString(_kSortingOrderPrefs) ?? 'name';
  }

  /// ----------------------------------------------------------
  /// Method that saves the user decision on sorting order
  /// ----------------------------------------------------------
  Future<bool> setSortingOrder(String value) async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();

	return prefs.setString(_kSortingOrderPrefs, value);
  }
}