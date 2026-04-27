import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 66, 177, 69)
      ) ,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Este es el Home'),
        ),
        body: Center(
          child: FilledButton(
            onPressed: () { }, 
            child: Text('Hola mundo!')
          ),
        ),
      ),
    );
  }
}
 