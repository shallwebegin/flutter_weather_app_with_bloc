import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.secilenSehir});

  final String secilenSehir;

  @override
  Widget build(BuildContext context) {
    return Text(
      secilenSehir,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
