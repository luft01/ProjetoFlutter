import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/View/home.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:projeto_flutter/services/local_auth_service.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/View/login.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  final ValueNotifier<bool> isLocalAuthFailed = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    checkLocalAuth();
  }

  checkLocalAuth() async {
    final auth = context.read<LocalAuthService>();
    final isLocalAuthAvaliable = await auth.isBiometricAvaliable();
    isLocalAuthFailed.value = false;

    if (isLocalAuthAvaliable) {
      final authenticated = await auth.authenticate();

      if (!authenticated) {
        isLocalAuthFailed.value = true;
      } else {
        if (!mounted) return;
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const LoginPage();
    } else {
      return const Carousel();
    }
  }

  loading() {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
