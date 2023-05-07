import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kime/screens/auth/email/sign_up.dart';
import 'package:kime/screens/home/homepage.dart';
import 'package:kime/screens/widgets/app_button.dart';
import 'package:kime/screens/widgets/app_input.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppInputField(
                textEditingController: emailEditingController,
                obscureText: false,
                hintText: "Email",
                labelText: "Email",
                icon: const Icon(
                  Icons.email,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AppInputField(
                textEditingController: passwordEditingController,
                obscureText: false,
                hintText: "Password",
                labelText: "Password",
                icon: const Icon(
                  Icons.lock,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AppButton(
                onPress: () {
                  _signIn();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                text: "Sign In",
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: const Text("Don't have an account? Sign up here",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    String email = emailEditingController.text.trim();
    String password = passwordEditingController.text.trim();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
