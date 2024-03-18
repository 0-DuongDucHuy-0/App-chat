import 'package:chat_v4/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final void Function()? onTap_;

  RegisterPage({
    super.key,
    required this.onTap_,
  });

  void register(BuildContext context){
    // auth service
    final authService = AuthService();

    //sign up
    if (passController.text == confirmPassController.text) {
      try {
        authService.signUpWithEmailPassword(
            emailController.text,
            passController.text
        );
      }
      //error
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    // password =! config password
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Kiểm tra lại mật khẩu của bạn"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 25),

            Text(
              "Đăng ký tài khoản của bạn",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 25),

            MyTextField(
              hintText: "Email...",
              obscureText: false,
              controller: emailController,
            ),

            const SizedBox(height: 15),

            MyTextField(
              hintText: "Password...",
              obscureText: true,
              controller: passController,
            ),

            const SizedBox(height: 15),

            MyTextField(
              hintText: "Confirm password...",
              obscureText: true,
              controller: confirmPassController,
            ),

            const SizedBox(height: 25),

            MyButton(
              textButton: "Register",
              onTap_: () => register(context)
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Đã có tài khoản? ",
                  style:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap_,
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
              ],
            )


          ],
        ),
      ),
    );
  }
}