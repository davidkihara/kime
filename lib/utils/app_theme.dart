import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AppTheme {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
  );

  // final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  //     border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  //     borderRadius: BorderRadius.circular(8),
  //   );

  //   final submittedPinTheme = defaultPinTheme.copyWith(
  //     decoration: defaultPinTheme.decoration.copyWith(
  //       color: Color.fromRGBO(234, 239, 243, 1),
  //     ),
  //   );
}
