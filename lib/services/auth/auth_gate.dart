import 'package:chat_v4/Page/home_page.dart';
import 'package:chat_v4/services/auth/login_of_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget{
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder(
        stream:  FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user login
          if (snapshot.hasData) {
            return HomePage();
          }

          // user NOT login
          return const LoginOrRegister();
        },
      ),
    );
  }
}