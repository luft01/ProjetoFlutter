import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:projeto_flutter/Controller/bank.dart';
import 'package:projeto_flutter/View/auth_check.dart';
import 'package:projeto_flutter/View/home.dart';
import 'package:projeto_flutter/View/useApi.dart';
import 'package:projeto_flutter/View/register.dart';
import 'package:projeto_flutter/View/login.dart';
import 'package:projeto_flutter/Controller/app.dart';
/* import 'package:projeto_flutter/View/loading.dart'; */
import 'package:projeto_flutter/Model/Form.dart';
import 'package:projeto_flutter/View/info.dart';
import 'package:projeto_flutter/View/cart.dart';
import 'package:projeto_flutter/View/feed.dart';
import 'package:projeto_flutter/firebase_options.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/View/shoes_list.dart';
import 'package:projeto_flutter/View/home.dart';
import 'package:projeto_flutter/View/product_register.dart';
import 'package:projeto_flutter/View/promo.dart';
import 'package:projeto_flutter/View/info_tshirt.dart';
import 'package:projeto_flutter/services/local_auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => Bank()),
        ChangeNotifierProvider(
          create: (_) => LocalAuthService(auth: LocalAuthentication()),
        ),
      ],
      child: const AppWight(),
    ),
  );
}

class AppWight extends StatelessWidget {
  const AppWight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.orange,
            brightness: AppController.instance.isLight
                ? Brightness.light
                : Brightness.dark,
          ),
          initialRoute: '/auth_check',
          routes: {
            /*  '/': (context) => LoadingPage(), */
            '/login': (context) => const LoginPage(),
            //'/home': (context) => HomePage(),
            '/form': (context) => const FormPage(),
            '/register': (context) => const RegisterPage(),
            //'/shoes': (context) => const ListS(),
            '/info': (context) => const InfoTeste(),
            '/cart': (context) => const Cart(),
            '/feed': (context) => const Feed(),
            '/auth_check': (context) => const AuthCheck(),
            '/product': (context) => const ProductReg(),
            '/shoes': (context) => const ShoesList(),
            '/home': (context) => const Carousel(),
            '/useapi': (context) => const CarouselT(),
            '/promo': (context) => const Promo(),
            '/info_tshirt': (context) => const Info_Tshirt(),
          },
        );
      },
    ));
  }
}
