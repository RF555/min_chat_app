import 'package:flutter/material.dart';
import 'package:min_chat_app/services/auth/auth_service.dart';
import 'package:min_chat_app/components/my_buttom.dart';
import 'package:min_chat_app/components/my_textfeild.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // tap to go to login page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    // passwords match -> create user
    if(_passwordController.text == _confirmPasswordController.text) {
      try{
        _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // passwords don't match -> tell user to fix
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
            Icons.message,
            size: 70,
            color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 10),

            // welcome back message
            Text(
              'Let\'s create an account for you!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 50),

            // email textfield
            SizedBox(
              width: 400,
              child: MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
              ),
            ),
            const SizedBox(height: 10),

            // password textfield
            SizedBox(
              width: 400,
              child: MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: _passwordController,
              ),
            ),
            const SizedBox(height: 10),

            // confirm password textfield
            SizedBox(
              width: 400,
              child: MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: _confirmPasswordController,
              ),
            ),
            const SizedBox(height: 25),

            // login button
            SizedBox(
              width: 200,
              child: MyButton(
                text: 'Sign Up',
                onTap: () => register(context),
              ),
            ),
            const SizedBox(height: 25),

            // register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary
                    ),
                )
)              ],
            )
          ],
        )
      )
    );
  }
}
