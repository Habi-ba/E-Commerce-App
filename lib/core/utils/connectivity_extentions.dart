import 'package:connectivity_plus/connectivity_plus.dart';

extension ConnectivityExtentions on Connectivity {
  Future<bool> isConnected() async {
    var connectivityResult = await checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile);
  }
}
