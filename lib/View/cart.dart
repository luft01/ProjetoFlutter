import 'package:flutter/material.dart';
import 'package:projeto_flutter/Controller/bank.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/repositories/shoes_db.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Map<int, List<String>> mapteste = Shoesdb.mapList;
  int number = 0;
  bool medidas = false;
  String nome = '';
  bool status = false;
  List<String> tListbank = [];
  Map data = {};
  @override
  void initState() {
    super.initState();
    setState(() {
      tListbank = (context).read<Bank>().cardProductAllGet();
    });
  }

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)?.settings.arguments == null) {
      data = {};
      status = false;
    } else {
      data = ModalRoute.of(context)?.settings.arguments as Map;
      status = true;
      nome = data["nome"];
      tamanho = data['tamanho'];
      if (nome == 'Nike') {
        (context).read<Bank>().cardProductAll(nome);
      } else if (nome == 'Mizuno') {
        (context).read<Bank>().cardProductAll(nome);
      } else if (nome == 'Nike Air') {
        (context).read<Bank>().cardProductAll(nome);
      }
    }
    super.didChangeDependencies();
  }

  _finalizar() {
    (context)
        .read<Bank>()
        .buyFinish(tListbank[0], double.parse(tListbank[1]) * quanti);
    Navigator.pushReplacementNamed(context, '/home');
  }

  void testInit() {
    setState(() {
      tListbank = (context).read<Bank>().cardProductAllGet();
    });
  }

  bool loading = true;
  int quanti = 1;
  double total = 0;
  int tamanho = 0;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("Cart"),
          leading: const Icon(Icons.shopping_cart),
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
              currentIndex: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue[900],
              unselectedItemColor: Colors.white,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.store, color: Colors.white),
                  label: "Home",
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.local_mall, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Products",
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.feed, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Feed",
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
                    Navigator.of(context).pushNamed('/feed');
                    break;
                }
              }),
        ),
        body: tListbank.isEmpty
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white70,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 130,
                          height: 130,
                          child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/34/34627.png')),
                      const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                                " Sem produtos em seu carrinho\nVa para Produtos e selecione um.",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ))
                    ]))
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(193, 40, 3, 252),
                    Color.fromARGB(193, 40, 3, 252),
                    Color.fromARGB(255, 252, 252, 252),
                    Color.fromARGB(255, 252, 252, 252)
                  ],
                  center: Alignment.topCenter,
                  radius: 0.8,
                )),
                child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Text(
                          tListbank[0],
                          style: const TextStyle(fontSize: 28),
                        ),
                        SizedBox(
                          width: 190,
                          height: 170,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(tListbank[2]),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, top: 30),
                          child: Row(
                            children: [
                              Text(
                                'Valor Total :  ${(total = double.parse(tListbank[1]) * quanti).toString()}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                      offset: Offset(3.0, 3.0),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 90.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue[900],
                                    ),
                                    child: TextButton(
                                      child: Text(
                                        medidas == false ? 'US' : 'BR',
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          medidas = !medidas;
                                        });
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: Row(children: [
                            Text(
                              'Quantidade : $quanti',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 25),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 20),
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.blue[900]),
                                  child: TextButton(
                                    child: const Center(
                                      child:
                                          Icon(Icons.add, color: Colors.white),
                                    ),
                                    onPressed: () => {
                                      setState(() {
                                        quanti++;
                                      })
                                    },
                                  ),
                                )),
                            Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blue[900]),
                                child: TextButton(
                                  child: const Icon(Icons.remove,
                                      color: Colors.white),
                                  onPressed: () => {
                                    setState(() {
                                      if (quanti == 0) quanti = 1;
                                      quanti--;
                                    })
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(left: 58.0),
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.blue[900]),
                                    child: TextButton(
                                        onPressed: (() {}),
                                        child: Text(
                                            medidas == false
                                                ? tamanho.toString()
                                                : '7.5',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)))))
                          ]),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Align(
                              alignment: AlignmentDirectional.center,
                              child: Container(
                                  width: 120,
                                  height: 60,
                                  alignment: AlignmentDirectional.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.blue[900],
                                  ),
                                  child: TextButton(
                                      child: const Text('Comprar',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () => {_finalizar()})),
                            )),
                      ],
                    )))));
  }
}
