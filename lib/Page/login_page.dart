import 'package:chat_v4/services/auth/auth_service.dart';
import 'package:chat_v4/components/my_button.dart';
import 'package:chat_v4/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final void Function()? onTap_;

  LoginPage ({
    super.key,
    required this.onTap_,
  });

  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();
    
    // login
    try {
      await authService.signInWithEmailPassword(
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
              "Chào mừng bạn quay lại =))",
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

            const SizedBox(height: 25),

            MyButton(
              textButton: "Login",
              onTap_: () => login(context)
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Không có tài khoản? ",
                  style:
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap_,
                  child: Text(
                    "Đăng ký",
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