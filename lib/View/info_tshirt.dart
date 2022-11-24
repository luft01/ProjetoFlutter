import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/Controller/bank.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Info_Tshirt extends StatefulWidget {
  const Info_Tshirt({Key? key}) : super(key: key);

  @override
  State<Info_Tshirt> createState() => _Info_TshirtState();
}

class _Info_TshirtState extends State<Info_Tshirt> {
  bool medidas = false;
  bool status = false;
  List<bool> testeStatus = [false, false, false, false, false];
  int tamanho = 0;
  bool loading = true;
  int itens = 10;
  int numbe = 0;
  int cod = 0;
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)?.settings.arguments == null) {
      data = {};
    } else {
      setState(() {
        data = ModalRoute.of(context)!.settings.arguments as Map;
        cod = data["Codigo"];
      });
    }
    super.didChangeDependencies();
  }

  usoApi() async {
    var url =
        Uri.parse('https://my-json-server.typicode.com/luft01/senhaForte/db');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao carregar');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(cod);
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("GaleriTeste"),
          leading: const Icon(Icons.image),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(children: [
                  TextButton(
                    onPressed: () {
                      context.read<AuthService>().logout();
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.logout, color: Colors.black),
                    ),
                  )
                ])),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.blue[900],
              border: const Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 7, 7, 7), width: 3.0))),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue[900],
              unselectedItemColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white),
                  label: "Home",
                  backgroundColor: Color.fromARGB(0, 250, 248, 248),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_mall, color: Colors.white),
                  backgroundColor: Color.fromARGB(0, 250, 248, 248),
                  label: "Produos",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.feed, color: Colors.white),
                  backgroundColor: Colors.transparent,
                  label: "Feed",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  backgroundColor: Colors.transparent,
                  label: "Cart",
                ),
              ],
              onTap: (int index) {
                switch (index) {
                  case 0:
                    Navigator.of(context).pushNamed('/home');
                    break;
                  case 1:
                    Navigator.of(context).pushNamed('/shoes');
                    break;
                  case 2:
                    Navigator.of(context).pushNamed('/cart');
                    break;
                  case 3:
                    Navigator.of(context).pushNamed('/feed');
                    break;
                }
              }),
        ),
        body: /* data.isEmpty
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.white),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      SizedBox(
                          width: 200,
                          height: 180,
                          child: Image.network(
                              "http://cdn.onlinewebfonts.com/svg/img_359860.png")),
                      const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('Algo de errado não está certo',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 28)))
                    ])))
            :  */
            Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: FutureBuilder<dynamic>(
              future: usoApi(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Ink(
                      color: Colors.white,
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    '${snapshot.data!['produtos'][5]['nome']}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 28),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 2.0),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5))),
                                        width: 240,
                                        height: 200,
                                        child: Image.network(snapshot
                                            .data!['produtos'][5]['image'])))
                              ],
                            );
                          }));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
        )));
  }
}
