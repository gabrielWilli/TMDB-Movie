import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfoAbs {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfoAbs {

  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

}