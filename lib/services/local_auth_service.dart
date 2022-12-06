import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:flutter/services.dart';

class LocalAuthService extends ChangeNotifier {
  final LocalAuthentication auth;

  LocalAuthService({required this.auth});

  Future<bool> isBiometricAvaliable() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    return canAuthenticateWithBiometrics || await auth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    try {
      return await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ));
      // ···
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        print('// Add handling of no hardware here.');
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        print('permanentlock');
      } else {
        print(e);
      }
      return false;
    }
  }
}
