import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref/Login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_Screen.dart';
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();

  }
  void isLogin()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool isLogin=sp.getBool("isLogin")??false;
    if(isLogin){
      Timer(Duration(seconds: 6), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Home_Screen()));
      });
    }
    else{
      Timer(Duration(seconds: 6), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Login_Screen()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
          image: NetworkImage("https://images.pexels.com/photos/5703527/pexels-photo-5703527.jpeg?auto=compress&cs=tinysrgb&w=1600"),
        ),
    );
  }
}
