import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtracccionesSplashScreen extends StatefulWidget {
  const ExtracccionesSplashScreen({super.key});

  @override
  State<ExtracccionesSplashScreen> createState() => _ExtracccionesSplashScreenState();
}

class _ExtracccionesSplashScreenState extends State<ExtracccionesSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted) context.push('/extracciones');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'EXTRACCIONES',
              style: GoogleFonts.cormorantGaramond(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 8,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'materiales críticos de la tecnología',
              style: GoogleFonts.sofiaSans(
                color: Colors.white38,
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}