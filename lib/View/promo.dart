// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:projeto_flutter/Model/Store.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/Controller/bank.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_flutter/services/auth_service.dart';
import 'dart:convert';

class Promo extends StatefulWidget {
  const Promo({Key? key}) : super(key: key);

  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  final String texto = Store.login;
  List<List<String>> pricelist = [];
  Map<int, List> testeobj = {};
  List<String> nike = [''];
  int i = 0;
  bool loading = true;
  String? testestring = '';
  String? testestring1 = '';
  int itens = 10;
  int contador = 0;
  /* void _Enviar() {
    Navigator.pushReplacementNamed(context, "/infote",
        arguments: {"nome": codigo});
  } */

  @override
  void initState() {
    (context).read<Bank>().pgn();
    super.initState();
  }

  void testef() {
    (context).read<Bank>().pgn();
    setState(() {
      pricelist = (context).read<Bank>().pgn();
      print(pricelist);
    });

    /* print('estou aqui');
    print(nike); */
  }

  void _enviar(cod) {
    Navigator.pushReplacementNamed(context, "/info_tshirt",
        arguments: {"Codigo": cod});
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("ARISTORE"),
        centerTitle: true,
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
            selectedItemColor: Colors.greenAccent,
            unselectedItemColor: Colors.white,
            currentIndex: 1,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.shop, color: Colors.white),
                label: "Products",
                backgroundColor: Color.fromARGB(0, 255, 255, 255),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                backgroundColor: Colors.transparent,
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.feed, color: Colors.white),
                backgroundColor: Colors.transparent,
                label: "Feed",
              ),
            ],
            onTap: (int index) {
              switch (index) {
                case 0:
                  Navigator.of(context).pushNamed('/shoes');
                  break;
                case 1:
                  Navigator.of(context).pushNamed('/cart');
                  break;
                case 2:
                  Navigator.of(context).pushNamed('/feed');
                  break;
              }
            }),
      ),
      body: FutureBuilder<dynamic>(
          future: usoApi(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Ink(
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: snapshot.data!['produtos'].length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    '${snapshot.data!['produtos'][index]['nome']}'
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    width: 230,
                                    height: 200,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            width: 200,
                                            height: 170,
                                            child: Image.network(
                                                '${snapshot.data!['produtos'][index]['image']}')),
                                        Padding(
                                            padding: EdgeInsets.only(left: 39),
                                            child: Row(
                                              children: [
                                                Text('Mais informações',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18)),
                                                SizedBox(
                                                    width: 40,
                                                    height: 25,
                                                    child: TextButton(
                                                      child: Icon(
                                                          Icons.arrow_forward,
                                                          color: Colors.black),
                                                      onPressed: () {
                                                        _enviar(snapshot.data![
                                                                'produtos']
                                                            [index]['id']);
                                                      },
                                                    )),
                                              ],
                                            ))
                                      ],
                                    )),
                                Text(
                                  'R\$ ${snapshot.data!['produtos'][index]['price']}'
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ));
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
    ));
  }
}
