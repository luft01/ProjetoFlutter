import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_flutter/Controller/bank.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:projeto_flutter/Model/shoes.dart';
import 'package:social_share/social_share.dart';

class InfoTeste extends StatefulWidget {
  const InfoTeste({Key? key}) : super(key: key);

  @override
  State<InfoTeste> createState() => _InfoTesteState();
}

class _InfoTesteState extends State<InfoTeste> {
  bool medidas = false;
  bool status = false;
  List<bool> testeStatus = [false, false, false, false, false];
  int tamanho = 0;
  List<String> teste = [];
  List<String> tListbank = [];
  List<String> tListbank2 = [];
  bool loading = true;
  int itens = 10;
  int numbe = 0;
  int cod = 0;
  String nome = '';
  Map data = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      tListbank = (context).read<Bank>().cardProductAllGet();
    });

    testInit();
  }

  @override
  void didChangeDependencies() {
    tListbank.clear();
    if (ModalRoute.of(context)?.settings.arguments == null) {
      data = {};
    } else {
      setState(() {
        data = ModalRoute.of(context)!.settings.arguments as Map;
        nome = data["nome"];
      });
    }
    if (nome == 'Nike') {
      (context).read<Bank>().cardProductAll(nome);
    } else if (nome == 'Mizuno') {
      (context).read<Bank>().cardProductAll(nome);
    } else if (nome == 'Nike Air') {
      (context).read<Bank>().cardProductAll(nome);
    }

    super.didChangeDependencies();
  }

  void testInit() {
    setState(() {
      tListbank = (context).read<Bank>().cardProductAllGet();
    });
  }

  void _nextCart() {
    if (tamanho == 0) {
      tamanho = 0;
    } else {
      Navigator.pushReplacementNamed(context, "/cart",
          arguments: {"nome": nome, "tamanho": tamanho});
    }
  }

  compartilharPreco() {
    SocialShare.shareWhatsapp(
        'Confira o produto ${tListbank[0]} agora: ${(tListbank[1])} ');
  }

  @override
  Widget build(BuildContext context) {
/*     String _buttonText = "Click";
    int intens = 10; */
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("GaleriTeste2"),
          leading: const Icon(Icons.image),
          actions: <Widget>[
            IconButton(onPressed: compartilharPreco, icon: Icon(Icons.share)),
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
        body: tListbank.isEmpty
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.white),
                child: Center(
                    child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue[900]),
                        child: TextButton(
                          onPressed: (() {
                            testInit();
                          }),
                          child: const Text(
                            'Atualizar',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ))))
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.white),
                child: ListView(children: [
                  Container(
                      /* width: 300 ,
        height: 300,  */
                      decoration: const BoxDecoration(
                          gradient: RadialGradient(
                        colors: [
                          Color.fromARGB(255, 40, 3, 252),
                          Color.fromARGB(255, 40, 3, 252),
                          Color.fromARGB(255, 252, 252, 252),
                          Color.fromARGB(255, 252, 252, 252)
                        ],
                        center: Alignment.topCenter,
                        radius: 0.8,
                      )),
                      child: Column(children: [
                        Text(
                          tListbank[0],
                          style: const TextStyle(fontSize: 28),
                        ),
                        Container(
                          width: 190,
                          height: 170,
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              color: Colors.black,
                              width: 2,
                            )),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(tListbank[2]),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, top: 100),
                          child: Row(
                            children: [
                              Text(
                                'Preço : ${tListbank[1]}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                      offset: Offset(5.0, 5.0),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color:
                                          const Color.fromARGB(255, 65, 62, 62),
                                    ),
                                    child: TextButton(
                                        child: Text(
                                          medidas == false ? 'US' : 'BR',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        onPressed: () => {
                                              setState(() {
                                                medidas = !medidas;
                                              })
                                            })),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Row(
                              children: [
                                const Text('Tamanhos : ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: testeStatus[0] == true
                                            ? Colors.blue[900]
                                            : const Color.fromARGB(
                                                255, 65, 62, 62),
                                      ),
                                      child: TextButton(
                                          child: Text(
                                              medidas == false ? '39' : '7.5',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          onPressed: () => {
                                                for (int i = 0; i < 5; i++)
                                                  {
                                                    if (i != 0)
                                                      {
                                                        if (testeStatus[i] ==
                                                            true)
                                                          {
                                                            setState(() {
                                                              testeStatus[i] =
                                                                  false;
                                                            })
                                                          }
                                                      }
                                                    else
                                                      {
                                                        setState(() {
                                                          testeStatus[0] =
                                                              !testeStatus[0];
                                                          if (testeStatus[0] ==
                                                              true) {
                                                            tamanho = 39;
                                                          } else {
                                                            tamanho = 0;
                                                          }
                                                        })
                                                      }
                                                  }
                                              })),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: testeStatus[1] == true
                                            ? Colors.blue[900]
                                            : const Color.fromARGB(
                                                255, 65, 62, 62),
                                      ),
                                      child: TextButton(
                                          child: Text(
                                              medidas == false ? '40' : '8.5',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          onPressed: () => {
                                                for (int i = 0; i < 5; i++)
                                                  {
                                                    if (i != 1)
                                                      {
                                                        if (testeStatus[i] ==
                                                            true)
                                                          {
                                                            setState(() {
                                                              testeStatus[i] =
                                                                  false;
                                                            })
                                                          }
                                                      }
                                                    else
                                                      {
                                                        setState(() {
                                                          testeStatus[1] =
                                                              !testeStatus[1];
                                                          if (testeStatus[1] ==
                                                              true) {
                                                            tamanho = 40;
                                                          } else {
                                                            tamanho = 0;
                                                          }
                                                        })
                                                      }
                                                  }
                                              })),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: testeStatus[2] == true
                                            ? Colors.blue[900]
                                            : const Color.fromARGB(
                                                255, 65, 62, 62),
                                      ),
                                      child: TextButton(
                                          child: Text(
                                              medidas == false ? '41' : '9.5',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          onPressed: () => {
                                                numbe = 2,
                                                for (int i = 0; i < 5; i++)
                                                  {
                                                    if (i != 2)
                                                      {
                                                        if (testeStatus[i] ==
                                                            true)
                                                          {
                                                            setState(() {
                                                              testeStatus[i] =
                                                                  false;
                                                            })
                                                          }
                                                      }
                                                    else
                                                      {
                                                        setState(() {
                                                          testeStatus[2] =
                                                              !testeStatus[2];
                                                          if (testeStatus[2] ==
                                                              true) {
                                                            tamanho = 41;
                                                          } else {
                                                            tamanho = 0;
                                                          }
                                                        })
                                                      }
                                                  }
                                              })),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(children: [
                                      Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: testeStatus[3] == true
                                                ? Colors.blue[900]
                                                : const Color.fromARGB(
                                                    255, 65, 62, 62),
                                          ),
                                          child: TextButton(
                                              child: Text(
                                                  medidas == false
                                                      ? '42'
                                                      : '10',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15)),
                                              onPressed: () => {
                                                    for (int i = 0; i < 5; i++)
                                                      {
                                                        if (i != 3)
                                                          {
                                                            if (testeStatus[
                                                                    i] ==
                                                                true)
                                                              {
                                                                setState(() {
                                                                  testeStatus[
                                                                          i] =
                                                                      false;
                                                                })
                                                              }
                                                          }
                                                        else
                                                          {
                                                            setState(() {
                                                              testeStatus[3] =
                                                                  !testeStatus[
                                                                      3];
                                                              if (testeStatus[
                                                                      3] ==
                                                                  true) {
                                                                tamanho = 42;
                                                              } else {
                                                                tamanho = 0;
                                                              }
                                                            })
                                                          }
                                                      }
                                                  })),
                                    ])),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: testeStatus[4] == true
                                            ? Colors.blue[900]
                                            : const Color.fromARGB(
                                                255, 65, 62, 62),
                                      ),
                                      child: TextButton(
                                          child: Text(
                                              medidas == false ? '43' : '10.5',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          onPressed: () => {
                                                for (int i = 0; i < 5; i++)
                                                  {
                                                    if (i != 4)
                                                      {
                                                        if (testeStatus[i] ==
                                                            true)
                                                          {
                                                            setState(() {
                                                              testeStatus[i] =
                                                                  false;
                                                            })
                                                          }
                                                      }
                                                    else
                                                      {
                                                        setState(() {
                                                          testeStatus[4] =
                                                              !testeStatus[4];
                                                          if (testeStatus[3] ==
                                                              true) {
                                                            tamanho = 42;
                                                          } else {
                                                            tamanho = 0;
                                                          }
                                                        })
                                                      }
                                                  }
                                              })),
                                ),
                              ],
                            )),
                        /* Align(
                alignment: AlignmentDirectional.center,
                child: */

                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 120,
                                    height: 60,
                                    alignment: AlignmentDirectional.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.blue[900],
                                    ),
                                    child: TextButton(
                                        child: const Text('Adicionar',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () => {_nextCart()})),
                                TextButton(
                                    child: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 32,
                                    ),
                                    onPressed: () {
                                      (context)
                                          .read<Bank>()
                                          .cartProduct(tListbank[3]);
                                    })
                              ]),
                        )
                      ]))
                ]))));
  }
}
