import 'package:chat_v4/Page/login_page.dart';
import 'package:chat_v4/Page/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginOrRegisterState();
  }}

class LoginOrRegisterState extends State<LoginOrRegister>{
  bool isLogin = true;

  void togglePages() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (isLogin) {
      return LoginPage(
        onTap_: togglePages,
      );
    } else {
      return RegisterPage(
        onTap_: togglePages,
      );
    }
  }
}