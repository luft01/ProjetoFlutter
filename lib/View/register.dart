import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var isLoading = false;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final nome = TextEditingController();
  bool status = false;
  int aux = 0;
  final usua = FirebaseFirestore.instance.collection("Usuario");

  registrar() async {
    setState(() => isLoading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
      aux = 1;
    }
  }

  logando() {
    if (aux == 2) {
      Navigator.of(context).pushNamed('/home');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        leading: const Icon(Icons.app_registration),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(children: [
                TextButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/shoes');
                  },
                  child: const Text('Login'),
                ),
              ])),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [Color(0xff000000), Color(0xff085795)],
          center: Alignment.center,
          radius: 0.8,
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          //form
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const Text(
                  "Tela de Registro ",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(4.0, 7.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(213, 233, 238, 231),
                      ),
                      Shadow(
                        offset: Offset(4.0, 7.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    child: Image.network(
                      'https://uxwing.com/wp-content/themes/uxwing/download/editing-user-action/new-registration-icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),

                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email/Login',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    icon: const Icon(Icons.login,
                        color: Color.fromARGB(255, 159, 161, 167)),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    //Validator
                  },
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
                ),

                //box styling
                /* SizedBox(
                  height: MediaQuery.of(context).size.width * 0.06,
                ), */
                /* Material(
                  elevation: 18,
                  shadowColor: Colors.white,
                  child: TextFormField(
                    controller: nome,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      icon: new Icon(Icons.login,
                          color: Color.fromARGB(255, 159, 161, 167)),
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      //Validator
                    },
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z]").hasMatch(value)) {
                        return 'Enter your name';
                      }
                      return null;
                    },
                  ),
                ), */
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                TextFormField(
                  controller: senha,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    icon: const Icon(Icons.lock, color: Color(0xff224597)),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {},
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Enter a valid password!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        side: const BorderSide(width: 1.0, color: Colors.white),
                        foregroundColor: Colors.white,
                        shadowColor: const Color.fromARGB(255, 255, 255, 255),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text(
                        "Enter",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          registrar();
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
