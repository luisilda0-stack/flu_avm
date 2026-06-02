import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class ExtraccionesScreen extends StatelessWidget {
  const ExtraccionesScreen({super.key});

  final List<Map<String, dynamic>> minerales = const [
    {'nombre': 'Litio', 'imagen': 'assets/images/litio.jpg'},
    {'nombre': 'Coltán', 'imagen': 'assets/images/coltan.jpg'},
    {'nombre': 'Cobalto', 'imagen': 'assets/images/cobalto.jpg'},
    {'nombre': 'Silicio', 'imagen': 'assets/images/silicio.jpg'},
    {'nombre': 'Tierras Raras', 'imagen': 'assets/images/tierras_raras.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Extracciones',
          style: GoogleFonts.cormorantGaramond(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        itemCount: minerales.length,
        itemBuilder: (context, index) {
          final mineral = minerales[index];
          return GestureDetector(
            onTap: () => context.push('/extracciones/${mineral['nombre']}'),
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: 'mineral_${mineral['nombre']}',
                      child: Image.asset(
                        mineral['imagen'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          mineral['nombre'],
                          style: GoogleFonts.cormorantGaramond(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              const Shadow(blurRadius: 8, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}