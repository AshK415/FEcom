import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_state.g.dart';

enum NState { connected, disconnected, restored }

@Riverpod(keepAlive: true)
class NetworkState extends _$NetworkState {
  @override
  FutureOr<NState> build() async {
    final isConnected = await Connectivity().checkConnectivity();
    if (isConnected == ConnectivityResult.none) {
      return NState.disconnected;
    }
    _observe();
    return NState.connected;
  }

  void _observe() {
    Connectivity().onConnectivityChanged.listen((event) {
      NState status = NState.connected;
      switch (event) {
        case ConnectivityResult.none:
          status = NState.disconnected;
          break;
        default:
          if (state.value == NState.disconnected) {
            status = NState.restored;
          }
      }
      if (status != state.value) {
        state = AsyncData(status);
      }
    });
  }
}
