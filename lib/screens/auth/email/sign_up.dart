import 'package:flutter/material.dart';
import 'package:kime/screens/auth/email/sign_in.dart';
import 'package:kime/screens/widgets/app_button.dart';
import 'package:kime/screens/widgets/app_input.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  _signUp();
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const HomePage(),
                  //   ),
                  // );
                },
                text: "Sign Up",
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                  );
                },
                child: const Text("Have an account? Sign in here",
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

  Future<void> _signUp() async {
    String email = emailEditingController.text.trim();
    String password = passwordEditingController.text.trim();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
