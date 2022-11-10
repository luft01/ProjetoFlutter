import 'package:flutter/material.dart';
import 'package:projeto_flutter/View/home.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/View/login.dart';
//import 'package:flutter_app/View/home.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null) {
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
