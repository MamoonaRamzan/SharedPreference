import 'package:flutter/material.dart';
import 'package:shared_pref/Home_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final Emailcontroller=TextEditingController();
  final Passwordcontroller=TextEditingController();
  final Agecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 30,left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: Emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: Passwordcontroller,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: Agecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Age",
              ),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap:()async{
                SharedPreferences sp= await SharedPreferences.getInstance();
                sp.setString("Email", Emailcontroller.text.toString());
                sp.setString("Age", Agecontroller.text.toString());
                sp.setString("Password", Passwordcontroller.text.toString());
                sp.setBool("isLogin", true);
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Home_Screen())
              );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Submit")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
