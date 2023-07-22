import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login_Screen.dart';
class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}
String Email="";
String Password="";
String Age="";
class _Home_ScreenState extends State<Home_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    Email=sp.getString("Email").toString();
    Password=sp.getString("Password").toString();
    Age=sp.getString("Age").toString();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Login"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left:30,right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome to SharedPreferences"),
              SizedBox(height: 30,),
              Text(Email),
              SizedBox(height: 30,),
              Text(Password),
              SizedBox(height: 30,),
              Text(Age),
              SizedBox(height: 30,),
              InkWell(
                onTap:()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Login_Screen())
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("Logout")),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
