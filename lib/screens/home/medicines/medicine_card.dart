import 'package:flutter/material.dart';

class MedicineCard extends StatefulWidget {
  const MedicineCard({Key? key}) : super(key: key);

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Medicine 1"),
          ),
        ),
      ),
    );
  }
}
