import 'package:flutter/material.dart';
import 'package:kime/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("My Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors().colorSix,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
