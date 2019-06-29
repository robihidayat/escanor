import 'package:escanor/bloc/authentication/bloc/bloc.dart';
import 'package:escanor/commons/share_preference/user_preference.dart';
import 'package:escanor/model/user_principle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';


class HomeScreen extends StatefulWidget {

  _HomeScreenState createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen>{
  final UserPrinciple username = null;
  

  @override
  void initState() {
    super.initState();
    UserPreference.getUserPrinciple();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).dispatch(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child:
            FutureBuilder(
              future: UserPreference.getUserPrinciple(), 
              builder: (context, snapshot){
              if(snapshot.hasData) {

                print("datanya "+ jsonEncode(snapshot.data.toJson()));
                return  new Container(child: Text(jsonEncode(snapshot.data.toJson())), );
                }
                return  new Container(child: Text('Kosong Isinya'), );
                }
              )
            ), 
        ],
      ),
    );
  }
}
