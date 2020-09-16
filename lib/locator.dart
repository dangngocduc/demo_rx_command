import 'package:demo_rx_command/blocs/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<AuthBloc>(AuthBloc());
}
