import 'package:flutter/material.dart';
import 'package:projeto_flutter/Model/Store.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/Controller/bank.dart';
import 'package:projeto_flutter/repositories/shoes_db.dart';

class ShoesList extends StatefulWidget {
  const ShoesList({Key? key}) : super(key: key);

  @override
  State<ShoesList> createState() => _ShoesListState();
}

class _ShoesListState extends State<ShoesList> {
  final String texto = Store.login;
  bool loading = true;
  Map<int, List<String>> mapteste = Shoesdb.mapList;
  String? testestring = '';

  int itens = 10;

  String codigo = 'not';
  void _enviar() {
    (context).read<Bank>().cardProductAllGet();
    Navigator.pushReplacementNamed(context, "/info",
        arguments: {"nome": codigo});
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("List"),
          leading: const Icon(Icons.image),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(children: [
                  TextButton(
                    onPressed: () {
                      //Navigator.of(context).pushNamed('/login');
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
                  icon: Icon(Icons.store, color: Colors.white),
                  label: "Home",
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  backgroundColor: Color.fromARGB(0, 241, 240, 240),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.feed, color: Colors.white),
                  backgroundColor: Color.fromARGB(0, 241, 240, 240),
                  label: "Feed",
                ),
              ],
              onTap: (int index) {
                switch (index) {
                  case 0:
                    Navigator.of(context).pushNamed('/home');
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
        body: Container(
            decoration: const BoxDecoration(
                gradient: RadialGradient(
              colors: [
                Color.fromARGB(255, 252, 249, 249),
                Color.fromARGB(255, 202, 199, 199)
              ],
              center: Alignment.bottomLeft,
              radius: 0.8,
            )),
            child: ListView(children: [
              Row(children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 165,
                      height: 172,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 104, 101, 101)
                              .withOpacity(0.2),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        SizedBox(
                          width: 163,
                          height: 170,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(20 / 360),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                  'https://i.pinimg.com/originals/51/2b/4b/512b4b870390fac58da5206e88d228d6.png'),
                            ),
                          ),
                        ),
                      ]),
                    )),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 40, bottom: 20),
                        child: Column(
                          children: [
                            const Text('NIKE SPORT',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            const Text('R\$ 299.00',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[900]),
                              child: TextButton(
                                onPressed: () => {
                                  setState(() {
                                    codigo = 'Nike';
                                  }),
                                  _enviar()
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  /* shadowColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  elevation: 1, */
                                  /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                                ),
                                child: Row(children: const [
                                  Icon(
                                    Icons.info,
                                    size: 19.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('More Info',
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        )))
              ]),
              Row(children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 165,
                      height: 172,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 104, 101, 101)
                              .withOpacity(0.2),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        SizedBox(
                          width: 163,
                          height: 170,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(20 / 360),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                  'https://sneakerbardetroit.com/wp-content/uploads/2020/06/Nike-Air-Force-1-Low-White-University-Red-CK7663-102-Release-Date.png'),
                            ),
                          ),
                        ),
                      ]),
                    )),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 40, bottom: 20),
                        child: Column(
                          children: [
                            const Text('  NIKE  AIR1  ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            const Text('R\$ 299.00',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[900]),
                              child: TextButton(
                                onPressed: () => {
                                  setState(() {
                                    codigo = 'Nike Air';
                                  }),
                                  _enviar()
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                ),
                                child: Row(children: const [
                                  Icon(
                                    Icons.info,
                                    size: 19.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('More Info',
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        )))
              ]),
              Row(children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 165,
                      height: 172,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 104, 101, 101)
                              .withOpacity(0.2),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        SizedBox(
                          width: 163,
                          height: 170,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(20 / 360),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                  'https://www.transparentpng.com/thumb/adidas-shoes/Oz65MO-red-women-shoes-adidas-adizero-women-tennis-shoes-red-ubersonic.png'),
                            ),
                          ),
                        ),
                      ]),
                    )),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 30, bottom: 20),
                        child: Column(
                          children: [
                            const Text('ADIDAS HEAVY',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            const Text('R\$ 179.00',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[900]),
                              child: TextButton(
                                onPressed: () => {},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  /* shadowColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  elevation: 5, */
                                  /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                                ),
                                child: Row(children: const [
                                  Icon(
                                    Icons.info,
                                    size: 19.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('More Info',
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        )))
              ]),
              Row(children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 165,
                      height: 172,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 104, 101, 101)
                              .withOpacity(0.2),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        SizedBox(
                          width: 163,
                          height: 170,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(20 / 360),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                  'https://www.pngmart.com/files/21/Adidas-Shoes-PNG-Isolated-Pic.png'),
                            ),
                          ),
                        ),
                      ]),
                    )),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 40, bottom: 20),
                        child: Column(
                          children: [
                            const Text('ADIDAS BASIC',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            const Text('R\$ 229.00',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[900]),
                              child: TextButton(
                                onPressed: () => {},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  /* shadowColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  elevation: 5, */
                                  /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                                ),
                                child: Row(children: const [
                                  Icon(
                                    Icons.info,
                                    size: 19.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('More Info',
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        )))
              ]),
              Row(children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 165,
                      height: 172,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 104, 101, 101)
                              .withOpacity(0.2),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        SizedBox(
                          width: 163,
                          height: 170,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(20 / 360),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network('${mapteste[1]![2]}'),
                            ),
                          ),
                        ),
                      ]),
                    )),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 40, bottom: 20),
                        child: Column(
                          children: [
                            Text('${mapteste[1]![0]} ',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Text('R\$ ${mapteste[1]![1]}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[900]),
                              child: TextButton(
                                onPressed: () => {
                                  setState(() {
                                    codigo = 'Mizuno';
                                  }),
                                  _enviar()
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  /* shadowColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  elevation: 5, */
                                  /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                                ),
                                child: Row(children: const [
                                  Icon(
                                    Icons.info,
                                    size: 19.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('More Info',
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        )))
              ]),
            ]))));
  }
}
