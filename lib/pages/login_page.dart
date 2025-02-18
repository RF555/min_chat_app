import 'package:flutter/material.dart';
import 'package:min_chat_app/services/auth/auth_service.dart';
import 'package:min_chat_app/components/my_buttom.dart';
import 'package:min_chat_app/components/my_textfeild.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});


  // login method
  void login(BuildContext context) async {
    // get auth service
    final authService = AuthService();

    // try login
    try{
      await authService.signInWithEmailAndPassword(_emailController.text, _passwordController.text);
    }
    //catch any errors
    catch (e){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
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
              'Welcome back!',
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
            const SizedBox(height: 25),

            // login button
            SizedBox(
              width: 200,
              child: MyButton(
                text: 'Login',
                onTap: () => login(context),
              ),
            ),
            const SizedBox(height: 25),

            // register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Sign Up now",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary
                    ),
                  )
                )
              ],
            )
          ],
        )
      )
    );
  }
}
