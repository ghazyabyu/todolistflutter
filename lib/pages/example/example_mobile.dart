import 'package:flutter/material.dart';

class ExampleMobile extends StatelessWidget {
  const ExampleMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Example Mobile'),
      ),
      body: const Center(
        child: Text('contoh mobile screen layout.'),
      ),
    );
  }
}