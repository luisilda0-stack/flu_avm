import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class InicioScreen extends ConsumerWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.data_object),
        title: const Text('Flu Avm'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(estTenebrisModusProvider.notifier).update(
                (statumTheme) => !estTenebrisModus,
              );
            },
            icon: Icon(
              estTenebrisModus
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 8),

            // Row imágenes móvil + puntos + servidor
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/images/movil.png', height: 80, fit: BoxFit.contain)),
                Expanded(child: Image.asset('assets/images/puntos.png', height: 80, fit: BoxFit.contain)),
                Expanded(child: Image.asset('assets/images/servidor.png', height: 80, fit: BoxFit.contain)),
              ],
            ),

            const SizedBox(height: 28),

            // Badge CONECTADO
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '● CONECTADO',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),

            const SizedBox(height: 12),

            // Título y subtítulo
            Text(
              'WebSockets en vivo',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Aprende a construir apps con datos en tiempo real en Flutter. Dos ejemplos prácticos te esperan dentro.',
              style: GoogleFonts.sofiaSans(fontSize: 14),
            ),

            const SizedBox(height: 28),

            // Row tarjetas Mapas + Votaciones
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/mapa.jpg',
                          height: 120,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Mapas',
                        style: GoogleFonts.cormorantGaramond(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Ubicación en tiempo real',
                        style: GoogleFonts.sofiaSans(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/votaciones.jpg',
                          height: 120,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Votaciones',
                        style: GoogleFonts.cormorantGaramond(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Gráfico que se actualiza',
                        style: GoogleFonts.sofiaSans(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Row badges
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Badge(texto: '5\nPANTALLAS'),
                _Badge(texto: '2\nWEBSOCKET'),
                _Badge(texto: 'MI\nPROYECTO'),
              ],
            ),

            const SizedBox(height: 32),

            // Botón Comenzar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.push('/home'),
                child: const Text('→ Comenzar'),
              ),
            ),

            const SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String texto;

  const _Badge({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: GoogleFonts.sofiaSans(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}