import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kime/screens/auth/email/sign_in.dart';
import 'package:kime/screens/home/medicines/medicine_card.dart';
import 'package:kime/screens/settings/settings.dart';
import 'package:kime/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "David Kihara",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // _signOut();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, i) {
            return MedicineCard();
          },
        ),
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

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void _getCurrentUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        user = user;
      }
    });
  }
}
