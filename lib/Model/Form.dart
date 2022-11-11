import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  FormPageState createState() {
    return FormPageState();
  }
}

final dados = FirebaseFirestore.instance.collection("usu");

String? dados1 = '';
String? dados2 = '';
String? dados3 = '';

Future dadoBanco() async {
  await dados.doc('01').get().then((snapshot) async {
    dados1 = snapshot.data()!['Email'];
    dados2 = snapshot.data()!['Nome'];
    dados3 = snapshot.data()!['Pass'];
  });
}

/* Future<List<String>> testeProd() async {
  final List<String> testeInst = [];

  await FirebaseFirestore.instance.collection('Prod').doc("Nike").get()

  print('estou aqui seu bosta');
  print(query.toString());
  print('passei por aqui');

/*       .doc('Nike')
      .get()
      .then((snapshot) async {
    print(snapshot.data()!['ID']);
    print(snapshot.data()!['Nome']);} */
} */

class FormPageState extends State<FormPage> {
  bool status = false;
  String changeName = 'Juca';
  // Map data = {};

  /* void initState() {
    super.initState();
    Dados.doc('01').get().then((snapshot) {
      setState(() {
        dados1 = snapshot.data()!['Email'];
        dados2 = snapshot.data()!['Nome'];
        dados3 = snapshot.data()!['Pass'];
      });
    });
  }

  @override
  void didChangeDependencies() {
  
    super.didChangeDependencies();
    // data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
  }
 */
  @override
  Widget build(BuildContext context) {
    final controlerTeste = TextEditingController();

    /* print('teste aqui');
    (context).select((Bank b) => b.dadoBanco());
    String? n1 = (context).select((Bank b) => b.dados2);
    print(n1); */
    // String nome = data["nome"];

    final ButtonStyle style = TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        appBar: AppBar(
          title: const Text("User"),
          leading: const Icon(Icons.login),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: TextButton(
                      style: style,
                      onPressed: () {
                        context.read<AuthService>().logout();
                        Navigator.of(context)
                            .pushNamed('/auth_check'); //pushnamedandreplace
                      },
                      child: const Icon(Icons.logout, color: Colors.black),
                    ),
                  )
                ])),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(top: BorderSide(color: Colors.white, width: 3.0))),
          child: BottomNavigationBar(
              currentIndex: 0,
              backgroundColor: const Color.fromARGB(68, 180, 50, 152),
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white),
                  label: "Dados",
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_basket, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Produtos",
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.feed, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Feed",
                ),
              ],
              selectedItemColor: Colors.amber[800],
              onTap: (int index) {
                switch (index) {
                  case 0:
                    Navigator.of(context).pushNamed('/form');
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
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const Text('Seja Bem Vindo'),
              const Text(
                'dados2.toString()',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 120),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /* Text(
                        (dados2.toString()).length > 0
                            ? 'Name : ' + dados2.toString()
                            : 'Name : ' + nome,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ), */
                      /* Text(
                        'Pass : ' + dados3.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ), */
                      status == true
                          ? Container(
                              margin: const EdgeInsets.all(10),
                              constraints: const BoxConstraints.expand(
                                  height: 80, width: 160),
                              child: TextField(
                                controller: controlerTeste,
                                decoration:
                                    const InputDecoration(labelText: 'Comment'),
                              ),
                            )
                          : const Text('Deseja Editar?'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child:
                                  Text(status == true ? 'Confirmar' : 'Editar'),
                              onPressed: () => {
                                    setState(() {
                                      status = !status;
                                      if (status == false) {
                                        dados2 = controlerTeste.value.text;
                                        dados3 = controlerTeste.value.text;
                                        FirebaseFirestore.instance
                                            .collection("usu")
                                            .doc("01")
                                            .set({
                                          "Nome": controlerTeste.value.text,
                                          "Pass": controlerTeste.value.text,
                                        });
                                      }
                                    }),
                                    TextButton(
                                      child: const Text('Deletar'),
                                      onPressed: () => {
                                        setState(() => changeName = ''),
                                        Navigator.pushReplacementNamed(
                                            context, '/')
                                      },
                                    )
                                  })
                        ],
                      )
                    ]),
              )
            ]),
          ),
        ));
  }
}
