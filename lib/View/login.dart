import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isLoading = false;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  bool isLogin = true;

  login() async {
    setState(() => isLoading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  bool exibir = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        leading: const Icon(Icons.login),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(children: [
                TextButton(
                  /* style: style, */
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  child: const Text('Register'),
                ),
              ])),
        ],
      ),

      //body
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
                  "Tela de Login ",
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
                      'http://cdn.onlinewebfonts.com/svg/img_201469.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //styling
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                /* Material(
                elevation: 18,
                shadowColor: Colors.white,
                child: */
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email/Login',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    icon: const Icon(Icons.email,
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
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                /* Material(
                elevation: 18,
                shadowColor: Colors.white,
                child: */
                TextFormField(
                  controller: senha,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      icon: const Icon(Icons.lock,
                          color: Color.fromARGB(255, 159, 161, 167)),
                      fillColor: Colors.transparent,
                      filled: true,
                      suffixIcon: GestureDetector(
                        child: Icon(
                            exibir == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color.fromARGB(255, 159, 161, 167)),
                        onTap: () => {
                          setState(() {
                            exibir = !exibir;
                          })
                        },
                      )),
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {},
                  obscureText: exibir == false ? true : false,
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length < 6 ||
                        !RegExp(r"^[a-zA-Z0-9]+[0-9]").hasMatch(value)) {
                      return 'Enter a valid password!';
                    }
                    return null;
                  },
                ),
                //text input
                /*  ), */
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,

                    /* gradient: LinearGradient(
                colors: [Color.fromARGB(137, 60, 52, 180),Color.fromARGB(171, 247, 247, 247)],
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight,
              ), */
                  ),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        side: const BorderSide(width: 1.0, color: Colors.white),
                        backgroundColor: Colors.transparent,
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
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (isLogin) {
                            login();
                          }
                        }
                      }),
                ),
                /* Container(
                width:250,
                height:70,
                child:
                Stack(
                children: [
                  Positioned(                   
                    child: Text("Register Now"),
                    left: 140,
                    top: 40,
                  ),
                       
                ],
              ),
              ) */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
