import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtraccionScreen extends StatefulWidget {
  final String mineral;

  const ExtraccionScreen({super.key, required this.mineral});

  @override
  State<ExtraccionScreen> createState() => _ExtraccionScreenState();
}

class _ExtraccionScreenState extends State<ExtraccionScreen> {
  int _indiceActual = 0;
  String _filtroActivo = 'Todo';
  Timer? _timer;

  final Map<String, List<Map<String, String>>> _imagenesPorMineral = {
    'Litio': [
      {'imagen': 'assets/images/litio/litio_extraccion_1.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/litio/litio_extraccion_2.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/litio/litio_extraccion_3.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/litio/litio_tecnologia_1.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/litio/litio_tecnologia_2.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/litio/litio_tecnologia_3.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/litio/litio_grafico.png', 'etiqueta': 'Existencia - Control'},
    ],
    'Coltán': [
      {'imagen': 'assets/images/coltan/coltan_extraccion_1.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/coltan/coltan_extraccion_2.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/coltan/coltan_extraccion_3.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/coltan/coltan_tecnologia_1.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/coltan/coltan_tecnologia_2.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/coltan/coltan_tecnologia_3.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/coltan/coltan_grafico.png', 'etiqueta': 'Existencia - Control'},
    ],
    'Cobalto': [
      {'imagen': 'assets/images/cobalto/cobalto_extraccion_1.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/cobalto/cobalto_extraccion_2.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/cobalto/cobalto_extraccion_3.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/cobalto/cobalto_tecnologia_1.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/cobalto/cobalto_tecnologia_2.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/cobalto/cobalto_tecnologia_3.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/cobalto/cobalto_grafico.png', 'etiqueta': 'Existencia - Control'},
    ],
    'Silicio': [
      {'imagen': 'assets/images/silicio/silicio_extraccion_1.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/silicio/silicio_extraccion_2.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/silicio/silicio_extraccion_3.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/silicio/silicio_tecnologia_1.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/silicio/silicio_tecnologia_2.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/silicio/silicio_tecnologia_3.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/silicio/silicio_grafico.png', 'etiqueta': 'Existencia - Control'},
    ],
    'Tierras Raras': [
      {'imagen': 'assets/images/tierras_raras/tierras_raras_extraccion_1.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/tierras_raras/tierras_raras_extraccion_2.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/tierras_raras/tierras_raras_extraccion_3.jpg', 'etiqueta': 'Extracción'},
      {'imagen': 'assets/images/tierras_raras/tierras_raras_tecnologia_1.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/tierras_raras/tierras_raras_tecnologia_2.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/tierras_raras/tierras_raras_tecnologia_3.jpg', 'etiqueta': 'Tecnología'},
      {'imagen': 'assets/images/tierras_raras/tierras_raras_grafico.png', 'etiqueta': 'Existencia - Control'},
    ],
  };

  final List<String> _filtros = ['Todo', 'Extracción', 'Tecnología', 'Existencia - Control'];

  List<Map<String, String>> get _imagenesFiltradas {
    final todas = _imagenesPorMineral[widget.mineral] ?? [];
    if (_filtroActivo == 'Todo') {
      return todas.where((img) => img['etiqueta'] != 'Existencia - Control').toList();
    }
    return todas.where((img) => img['etiqueta'] == _filtroActivo).toList();
  }

  void _iniciarTimer() {
    _timer?.cancel();
    final imagenes = _imagenesFiltradas;
    if (imagenes.length <= 1) return;
    _timer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (!mounted) return;
      setState(() {
        _indiceActual = (_indiceActual + 1) % imagenes.length;
      });
    });
  }

  void _pararTimer() {
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imagenes = _imagenesFiltradas;

    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.mineral,
          style: GoogleFonts.cormorantGaramond(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [

          // Filtros
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _filtros.length,
              itemBuilder: (context, index) {
                final filtro = _filtros[index];
                final activo = filtro == _filtroActivo;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _filtroActivo = filtro;
                      _indiceActual = 0;
                    });
                    _iniciarTimer();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: activo ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white54),
                    ),
                    child: Text(
                      filtro,
                      style: GoogleFonts.sofiaSans(
                        color: activo ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Imagen animada principal
          if (imagenes.isNotEmpty)
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: _pararTimer,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: Image.asset(
                    imagenes[_indiceActual]['imagen']!,
                    key: ValueKey(imagenes[_indiceActual]['imagen']),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[900],
                      child: Center(
                        child: Text(
                          imagenes[_indiceActual]['etiqueta']!,
                          style: GoogleFonts.cormorantGaramond(
                            color: Colors.white38,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          if (imagenes.isEmpty)
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  'Sin imágenes',
                  style: GoogleFonts.cormorantGaramond(
                    color: Colors.white38,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

          // Etiqueta + control play/pause
          if (imagenes.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    imagenes[_indiceActual]['etiqueta']!,
                    style: GoogleFonts.sofiaSans(
                      color: Colors.white54,
                      fontSize: 11,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      if (_timer?.isActive ?? false) {
                        _pararTimer();
                      } else {
                        _iniciarTimer();
                      }
                      setState(() {});
                    },
                    child: Icon(
                      (_timer?.isActive ?? false) ? Icons.pause_circle_outline : Icons.play_circle_outline,
                      color: Colors.white38,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

          // Grid de miniaturas
          if (imagenes.isNotEmpty)
            Expanded(
              flex: 2,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: imagenes.length,
                itemBuilder: (context, index) {
                  final seleccionada = index == _indiceActual;
                  return GestureDetector(
                    onTap: () {
                      setState(() => _indiceActual = index);
                      _pararTimer();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: seleccionada ? Colors.white : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          imagenes[index]['imagen']!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}