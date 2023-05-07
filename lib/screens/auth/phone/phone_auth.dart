import 'package:flutter/material.dart';
import 'package:kime/screens/auth/phone/otp.dart';
import 'package:kime/screens/widgets/app_button.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  TextEditingController countryCodeEditingController = TextEditingController();

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
              TextFormField(
                controller: textEditingController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Country",
                  labelText: "Country",
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(left: 5), // add padding to adjust icon
                  ),
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter your height';
                //   }
                //   return null;
                // },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.,
                children: [
                  SizedBox(
                    width: width * .2,
                    child: TextFormField(
                      controller: countryCodeEditingController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "+",
                        labelText: "+",
                        // prefixIcon: Padding(
                        //   padding: EdgeInsets.only(
                        //     left: 0,
                        //   ), // add padding to adjust icon
                        // ),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your height';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  SizedBox(
                    width: width * .7,
                    child: TextFormField(
                      controller: phoneNumberEditingController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "1234",
                        labelText: "Phone Number",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 5), // add padding to adjust icon
                        ),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your height';
                      //   }
                      //   return null;
                      // },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              AppButton(
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OTP(),
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
