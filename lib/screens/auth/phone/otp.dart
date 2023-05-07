import 'package:flutter/material.dart';
import 'package:kime/screens/home/homepage.dart';
import 'package:kime/screens/widgets/app_button.dart';
import 'package:kime/utils/app_theme.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController otpCodeEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Pinput(
                length: 6,
                keyboardType: TextInputType.number,
                controller: otpCodeEditingController,
                defaultPinTheme: AppTheme().defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,
                // pinputAutovalidateMode: null,
                textInputAction: TextInputAction.next,
                showCursor: true,
                validator: (s) {
                  print('validating code: $s');
                },
                onCompleted: (pin) => print(pin),
              ),
              const SizedBox(
                height: 15,
              ),
              AppButton(
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                text: "Verify",
              )
            ],
          ),
        ),
      ),
    );
  }
}
