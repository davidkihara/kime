import 'package:flutter/material.dart';
import 'package:kime/screens/auth/phone_auth.dart';
import 'package:kime/screens/widgets/app_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppButton(
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PhoneAuth(),
                ),
              );
            },
            text: "Get Started",
          ),
        ),
      ),
    );
  }
}
