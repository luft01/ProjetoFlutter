import 'package:flutter/material.dart';
import 'package:projeto_flutter/Model/Store.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final String texto = Store.login;
  final List<String> nike = Products.nike;
  final List<String> mizu = Products.mizuno;
  String nome = '';
  bool status = false;
  List<String> teste = [];
  @override
  Map data = {};
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    if (ModalRoute.of(context)?.settings.arguments == null) {
      data = {};
      status = false;
    } else {
      data = ModalRoute.of(context)?.settings.arguments as Map;
      status = true;
      nome = data["nome"];
      if (nome == 'nike')
        teste = nike;
      else if (nome == 'mizuno') teste = mizu;
    }
    super.didChangeDependencies();
  }

  bool loading = true;
  int itens = 10;
  int quanti = 0;
  double total = 0;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    String _buttonText = "Click";
    int intens = 10;
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Cart"),
          leading: Icon(Icons.shopping_cart),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 25),
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
              border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 7, 7, 7), width: 3.0))),
          child: BottomNavigationBar(
              currentIndex: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue[900],
              unselectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.store, color: Colors.white),
                  label: "Home",
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Products",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.feed, color: Colors.white),
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
        body: status == false
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white70,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/34/34627.png')),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(" you don't have product",
                                style: TextStyle(color: Colors.black)),
                          ))
                    ]))
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                  colors: [
                    Color(0xff2e2e2e),
                    Color.fromARGB(255, 122, 117, 117),
                    Color(0xffffffff)
                  ],
                  center: Alignment.topRight,
                  radius: 0.8,
                )),
                child: Column(
                  children: [
                    Text('description'),
                    Container(
                      width: 170,
                      height: 170,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(teste[3]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: [
                          Text(
                            'Total : ' +
                                (total = double.parse(teste[2]) * quanti)
                                    .toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(children: [
                        Text(
                          'QUANTITY : ${quanti}',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 30, right: 20),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black),
                              child: TextButton(
                                child: Center(
                                  child: const Icon(Icons.add),
                                ),
                                onPressed: () => {
                                  setState(() {
                                    quanti++;
                                  })
                                },
                              ),
                            )),
                        Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: TextButton(
                              child: const Icon(Icons.remove),
                              onPressed: () => {
                                setState(() {
                                  if (quanti == 0) quanti = 1;
                                  quanti--;
                                })
                              },
                            )),
                      ]),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Container(
                              width: 100,
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue[900],
                              ),
                              child: TextButton(
                                  child: Text('Purchase',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () => {})),
                        ))
                  ],
                ))));
  }
}
