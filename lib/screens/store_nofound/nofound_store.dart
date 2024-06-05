import 'package:flutter/material.dart';

class StoreNoFound extends StatelessWidget {
  const StoreNoFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Image.asset('images/error.png'),
        ),
      ),
    );
  }
}
