import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/Controller/bank.dart';
import 'package:projeto_flutter/View/auth_check.dart';
import 'package:projeto_flutter/View/home.dart';
//import 'package:projeto_flutter/View/list.dart';
import 'package:projeto_flutter/View/register.dart';
import 'package:projeto_flutter/View/login.dart';
import 'package:projeto_flutter/Controller/app.dart';
/* import 'package:projeto_flutter/View/loading.dart'; */
import 'package:projeto_flutter/Model/Form.dart';
import 'package:projeto_flutter/Model/Store.dart';
import 'package:projeto_flutter/View/info.dart';
import 'package:projeto_flutter/View/cart.dart';
import 'package:projeto_flutter/View/feed.dart';
import 'package:projeto_flutter/firebase_options.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/View/shoes_list.dart';
//import 'package:projeto_flutter/View/home.dart';
import 'package:projeto_flutter/View/product_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    /* ChangeNotifierProvider(
    create: (_) => Bank(),
    child: AppWight(),
  ) */
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => Bank()),
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
            '/shoes': (context) => const ShoesList(),
            '/info': (context) => const InfoTeste(),
            '/cart': (context) => const Cart(),
            '/feed': (context) => const Feed(),
            '/auth_check': (context) => const AuthCheck(),
            '/product': (context) => const ProductReg(),
            //'/shoes': (context) => ShoesList(),
            '/home': (context) => const Carousel()
          },
        );
      },
    ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  /*  @override
  void initState() {
    (context).select((Bank b1) => b1.pg());
    super.initState();
  }

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  } */

  final String texto = Store.login;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            (context).select((AuthService au) => au.usuario.toString()),
          ),
          actions: [
            TextButton(
              onPressed: () {
                /* Navigator.of(context).pushNamed('/register'); */
                context.read<AuthService>().logout();
              },
              child: const Icon(Icons.logout, color: Colors.black),
            ),
          ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: const Color.fromARGB(68, 180, 50, 152),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Dados",
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_basket),
              backgroundColor: Colors.white.withOpacity(0.1),
              label: "Produtos",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              backgroundColor: Colors.white.withOpacity(0.1),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.feed_sharp),
              backgroundColor: Colors.white.withOpacity(0.1),
              label: "Feed",
            ),
          ],
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, "/form",
                    arguments: {"nome": texto});
                break;
              case 1:
                Navigator.of(context).pushNamed('/list');
                break;
              case 2:
                Navigator.of(context).pushNamed('/home');
                break;
              case 3:
                Navigator.of(context).pushNamed('/feed');
                break;
            }
          }),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          /* crossAxisAlignment: CrossAxisAlignment.stretch, */
          children: [
            Text('Contador : $counter'),
            Container(
              /*apenas para afastar o Text do Custom*/
              height: 20,
            ),
            const CustomSwitch(),
            Container(
              /*apenas para afastar a coluna da linha(Custom dos quadrados*/
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter++;
            });
          }),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (Switch(
        value: AppController.instance.isLight,
        onChanged: (value) {
          AppController.instance.changeTheme();
        }));
  }
}
