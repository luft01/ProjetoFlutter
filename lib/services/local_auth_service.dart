import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService extends ChangeNotifier {
  final LocalAuthentication auth;

  LocalAuthService({required this.auth});

  Future<bool> isBiometricAvaliable() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    return canAuthenticateWithBiometrics || await auth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    return await auth.authenticate(
        localizedReason: 'Autentique-se para acessar o App');
  }
}
