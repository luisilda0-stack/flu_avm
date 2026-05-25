import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push('/home'),
          child: Text('Inicio'),
        ),
      ),
    );
  }
}