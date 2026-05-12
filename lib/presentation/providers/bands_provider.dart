import 'package:flu_avm/config/entities/band.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  online,
  offline,
  connecting,
}

final bandsProvider = StateNotifierProvider<BandsNotifier, BandsState>((ref) {
  return BandsNotifier();
});

class BandsState {
  final ServerStatus serverStatus;
  final IO.Socket socket;
  final List<Band> bands;

  BandsState({
    required this.serverStatus,
    required this.socket,
    required this.bands,
  });

  BandsState copyWith({
    ServerStatus? serverStatus,
    IO.Socket? socket,
    List<Band>? bands,
  }) {
    return BandsState(
      serverStatus: serverStatus ?? this.serverStatus,
      socket: socket ?? this.socket,
      bands: bands ?? this.bands,
    );
  }
}

class BandsNotifier extends StateNotifier<BandsState> {
  BandsNotifier()
      : super(
          BandsState(
            serverStatus: ServerStatus.connecting,
            socket: IO.io(
              'http://localhost:3000',
              IO.OptionBuilder()
                  .setTransports(['websocket'])
                  .enableAutoConnect()
                  .build(),
            ),
            bands: [],
          ),
        ) {
    _initConfig();
  }

  void _initConfig() {
    state.socket.onConnect((_) {
      state = state.copyWith(serverStatus: ServerStatus.online);
    });

    state.socket.onDisconnect((_) {
      state = state.copyWith(serverStatus: ServerStatus.offline);
    });

    state.socket.on('active-bands', (data) {
      final bands = (data as List).map((b) => Band.fromMap(b)).toList();
      state = state.copyWith(bands: bands);
    });
  }
}



/*class BandsNotifier extends StateNotifier<List<Band>> {
  BandsNotifier() : super([
    Band(id: '1', nomen: 'Metallica', numerusVotum: 5),
    Band(id: '2', nomen: 'Queen', numerusVotum: 1),
    Band(id: '3', nomen: 'Héroes del silencio', numerusVotum: 2),
    Band(id: '4', nomen: 'Bon Jovi', numerusVotum: 5),
  ]);

  void addereBand(Band band) {
    state = [...state, band];
  }

  void delereBand(Band band) {
    state = state.where((b) => b.id != band.id).toList();
  }

  void addereVotum(Band band) {
    state = state.map((b) {
      return b.id == band.id
          ? b.copyWith(numerusVotum: b.numerusVotum + 1)
          : b;
    }).toList();
  }

  void updateBand(Band band) {
    state = state.map((b) => b.id == band.id ? band : b).toList();
  }
}*/



