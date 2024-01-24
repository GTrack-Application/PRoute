import 'package:flutter/material.dart';

class SignatureScree extends StatefulWidget {
  const SignatureScree({super.key});

  @override
  State<SignatureScree> createState() => _SignatureScreeState();
}

class _SignatureScreeState extends State<SignatureScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signature'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
