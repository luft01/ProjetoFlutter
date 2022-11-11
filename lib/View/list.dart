// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:projeto_flutter/Model/Store.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/Controller/bank.dart';

class ListS extends StatefulWidget {
  const ListS({Key? key}) : super(key: key);

  @override
  State<ListS> createState() => _ListSState();
}

class _ListSState extends State<ListS> {
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
  String codigo = 'not';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text("List"),
          leading: Icon(Icons.image),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 25),
                child: Row(children: [
                  TextButton(
                    onPressed: () {
                      //Navigator.of(context).pushNamed('/login');
                      testef();
                    },
                    child: const Icon(Icons.logout, color: Colors.black),
                  ),
                ])),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 7, 7, 7), width: 3.0))),
          child: BottomNavigationBar(
              currentIndex: 0,
              backgroundColor: Colors.transparent,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white),
                  label: "Dados",
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.feed, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Feed",
                ),
              ],
              selectedItemColor: Colors.amber[800],
              onTap: (int index) {
                switch (index) {
                  case 0:
                    Navigator.pushReplacementNamed(context, "/form",
                        arguments: {"nome": texto});
                    break;
                  case 1:
                    Navigator.of(context).pushNamed('/home');
                    break;
                  case 2:
                    Navigator.of(context).pushNamed('/feed');
                    break;
                }
              }),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: const RadialGradient(
              colors: [
                Color.fromARGB(255, 252, 249, 249),
                Color.fromARGB(255, 202, 199, 199)
              ],
              center: Alignment.bottomLeft,
              radius: 0.8,
            )),
            child: CustomScrollView(slivers: [
              /* Row(children: [
                Padding(
                    padding: EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 145,
                      height: 162,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 101, 101)
                              .withOpacity(0.2),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        Container(
                          width: 140,
                          height: 160,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(20 / 360),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              /* child: Image.network(
                                  'https://i.pinimg.com/originals/51/2b/4b/512b4b870390fac58da5206e88d228d6.png'), */
                            ),
                          ),
                        ),
                      ]),
                    )),
                Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            Text('NIKE SPORT',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Text('R\$ 299.00',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: TextButton(
                                onPressed: () => {
                                  setState(() {
                                    codigo = 'nike';
                                  }),
                                  _Enviar()
                                },
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  shadowColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  elevation: 5,
                                  /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                                ),
                                child: Row(children: [
                                  const Icon(
                                    Icons.info,
                                    size: 15.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('More Info',
                                        style: TextStyle(
                                          fontSize: 13,
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
                    padding: EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 145,
                      height: 162,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 101, 101)
                              .withOpacity(0.2),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        Container(
                          width: 140,
                          height: 155,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(20 / 360),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              /*  child: Image.network(
                                  'https://sneakerbardetroit.com/wp-content/uploads/2020/06/Nike-Air-Force-1-Low-White-University-Red-CK7663-102-Release-Date.png'), */
                            ),
                          ),
                        ),
                      ]),
                    )),
                Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            Text('NIKE AIR1',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Text('R\$ 299.00',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: TextButton(
                                onPressed: () => {},
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  shadowColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  elevation: 5,
                                  /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                                ),
                                child: Row(children: [
                                  const Icon(
                                    Icons.info,
                                    size: 15.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('More Info',
                                        style: TextStyle(
                                          fontSize: 13,
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
                    padding: EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 145,
                      height: 162,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 101, 101)
                              .withOpacity(0.2),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        Container(
                          width: 160,
                          height: 160,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(20 / 360),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              /* child: Image.network(
                                  'https://www.transparentpng.com/thumb/adidas-shoes/Oz65MO-red-women-shoes-adidas-adizero-women-tennis-shoes-red-ubersonic.png'), */
                            ),
                          ),
                        ),
                      ]),
                    )),
                Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            Text('ADIDAS HEAVY',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Text('R\$ 179.00',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: TextButton(
                                onPressed: () => {},
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  shadowColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  elevation: 5,
                                  /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                                ),
                                child: Row(children: [
                                  const Icon(
                                    Icons.info,
                                    size: 15.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('More Info',
                                        style: TextStyle(
                                          fontSize: 13,
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
                    padding: EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 145,
                      height: 162,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 101, 101)
                              .withOpacity(0.2),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        Container(
                          width: 170,
                          height: 160,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(20 / 360),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              /*  child: Image.network(
                                  'https://www.pngmart.com/files/21/Adidas-Shoes-PNG-Isolated-Pic.png'), */
                            ),
                          ),
                        ),
                      ]),
                    )),
                Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            Text('ADIDAS BASIC',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Text('R\$ 229.00',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: TextButton(
                                onPressed: () => {},
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  shadowColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  elevation: 5,
                                  /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                                ),
                                child: Row(children: [
                                  const Icon(
                                    Icons.info,
                                    size: 15.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('More Info',
                                        style: TextStyle(
                                          fontSize: 13,
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
                    padding: EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 145,
                      height: 162,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 101, 101)
                              .withOpacity(0.2),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        Container(
                          width: 140,
                          height: 160,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(20 / 360),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              /*  child: Image.network(
                                  'https://www.webrun.com.br/wp-content/uploads/2022/09/TEMPLATE-mizuno.png'), */
                            ),
                          ),
                        ),
                      ]),
                    )),
                Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            Text('MIZUNO',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Text('R\$ 799.00',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: TextButton(
                                onPressed: () => {
                                  setState(() {
                                    codigo = 'mizuno';
                                  }),
                                  _Enviar()
                                },
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  shadowColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  elevation: 5,
                                  /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                                ),
                                child: Row(children: [
                                  const Icon(
                                    Icons.info,
                                    size: 15.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('More Info',
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        )))
              ]), */
              SliverList(
                delegate: SliverChildListDelegate(
                  listprice
                      .map(
                        (nikes) => Row(children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 35, bottom: 30, top: 10),
                              child: Container(
                                width: 145,
                                height: 162,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 104, 101, 101)
                                        .withOpacity(0.2),
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.4)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(children: [
                                  SizedBox(
                                    width: 140,
                                    height: 155,
                                    child: RotationTransition(
                                      turns: AlwaysStoppedAnimation(20 / 360),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        /*  child: Image.network(
                                  'https://sneakerbardetroit.com/wp-content/uploads/2020/06/Nike-Air-Force-1-Low-White-University-Red-CK7663-102-Release-Date.png'), */
                                      ),
                                    ),
                                  ),
                                ]),
                              )),
                          Center(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Column(
                                    children: [
                                      Text(nikes,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22)),
                                      Text(nikes,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22)),
                                      Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.black),
                                        child: TextButton(
                                          onPressed: () => {},
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            shadowColor: Color.fromARGB(
                                                255, 255, 255, 255),
                                            elevation: 5,
                                            /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        ), */
                                          ),
                                          child: Row(children: const [
                                            Icon(
                                              Icons.info,
                                              size: 15.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text('More Info',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  )),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ],
                                  )))
                        ]),
                      )
                      .toList(),
                ),
              ),

              /* Row(//Kit Dois
                  children: [
                Padding(
                    padding: EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 135,
                      height: 161,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        Text('Shoes ???',
                            style: TextStyle(color: Colors.black)),
                        Container(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            /*  child: Image.network(
                                'https://pngimg.com/uploads/running_shoes/running_shoes_PNG5817.png'), */
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black),
                          child: TextButton(
                            onPressed: () => {},
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              shadowColor: Color.fromARGB(255, 255, 255, 255),
                              elevation: 5,
                              /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                            ),
                            child: Row(children: [
                              const Icon(
                                Icons.info,
                                size: 13.0,
                              ),
                              Text(
                                'More Info',
                                style: TextStyle(fontSize: 13),
                              )
                            ]),
                          ),
                        )
                      ]),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 30, top: 10),
                  child: Container(
                    width: 135,
                    height: 161,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [
                      Text('MIZUNO', style: TextStyle(color: Colors.black)),
                      Container(
                        width: 100,
                        height: 100,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(-20 / 360),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            /* child: Image.network(
                                  "https://freepngdownload.com/image/thumb/running-shoes-png-free-download-42.png") */
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                        child: TextButton(
                          onPressed: () => {
                            setState(() {
                              codigo = 'mizuno';
                            }),
                            _Enviar()
                          },
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            shadowColor: Color.fromARGB(255, 255, 255, 255),
                            elevation: 5,
                            /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                          ),
                          child: Row(children: [
                            const Icon(
                              Icons.info,
                              size: 13.0,
                            ),
                            Text(
                              'More Info',
                              style: TextStyle(fontSize: 13),
                            )
                          ]),
                        ),
                      )
                    ]),
                  ),
                )
              ]), */
              /*  Row(// Kit Três
                  children: [
                Padding(
                    padding: EdgeInsets.only(left: 35, bottom: 30, top: 10),
                    child: Container(
                      width: 135,
                      height: 161,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        Text('NIKE RUN', style: TextStyle(color: Colors.black)),
                        Container(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            /*  child: Image.network(
                                'https://www.pngall.com/wp-content/uploads/13/Nike-Shoes-Transparent.png'), */
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black),
                          child: TextButton(
                            onPressed: () => {},
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              shadowColor: Color.fromARGB(255, 255, 255, 255),
                              elevation: 5,
                              /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                            ),
                            child: Row(children: [
                              const Icon(
                                Icons.info,
                                size: 13.0,
                              ),
                              Text(
                                'More Info',
                                style: TextStyle(fontSize: 13),
                              )
                            ]),
                          ),
                        )
                      ]),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 30, top: 10),
                  child: Container(
                    width: 135,
                    height: 161,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [
                      Text('ADIDAS SPEED',
                          style: TextStyle(color: Colors.black)),
                      Container(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          /* child: Image.network(
                                "https://www.pngmart.com/files/21/Adidas-Shoes-PNG-Isolated-Pic.png") */
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                        child: TextButton(
                          onPressed: () =>
                              {Navigator.pushNamed(context, '/info')},
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            shadowColor: Color.fromARGB(255, 255, 255, 255),
                            elevation: 5,
                            /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                          ),
                          child: Row(children: [
                            const Icon(
                              Icons.info,
                              size: 13.0,
                            ),
                            Text(
                              'More Info',
                              style: TextStyle(fontSize: 13),
                            )
                          ]),
                        ),
                      )
                    ]),
                  ),
                )
              ]) */
            ]))));
  }
}
