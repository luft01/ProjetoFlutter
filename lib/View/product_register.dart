import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductReg extends StatefulWidget {
  const ProductReg({Key? key}) : super(key: key);

  @override
  State<ProductReg> createState() => _ProductRegState();
}

final Dados = FirebaseFirestore.instance.collection("pedidos");

String? dados = '';

Future dadoBanco(item, item2, item3) async {
  await {
    dados = item3,
    print(dados),
    print('aqui estopi'),
    FirebaseFirestore.instance.collection("pedidos").doc(dados).set({
      "Nome": item,
      "Desc": item2,
    })
  };
}

class _ProductRegState extends State<ProductReg> {
  final controlerTeste = TextEditingController();
  final controlerP = TextEditingController();
  final controler2 = TextEditingController();
  final controler3 = TextEditingController();

  void salvar() {
    dadoBanco(controlerTeste.value.text, controlerP.value.text,
        controler3.value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product"),
          leading: Icon(Icons.add),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 25),
                child: Row(children: [
                  TextButton(
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
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 130,
                    child: Image.network(
                      'https://cdn2.iconfinder.com/data/icons/e-commerce-line-4-1/1024/open_box4-512.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.01,
                  ),
                  TextField(
                    controller: controlerTeste,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Name',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      icon: new Icon(Icons.production_quantity_limits,
                          color: Color.fromARGB(255, 7, 7, 7)),
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  TextField(
                    controller: controlerP,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Description',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      icon: new Icon(Icons.description,
                          color: Color.fromARGB(255, 5, 5, 5)),
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  TextField(
                    controller: controler2,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Quantity',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      icon: new Icon(Icons.numbers_outlined,
                          color: Color.fromARGB(255, 7, 7, 7)),
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  TextField(
                    controller: controler3,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'URl Image',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      icon: new Icon(Icons.link,
                          color: Color.fromARGB(255, 7, 7, 7)),
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  Container(
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          side: BorderSide(
                              width: 1.0, color: Color.fromARGB(255, 5, 5, 5)),
                          primary: Colors.white,
                          shadowColor: Color.fromARGB(255, 255, 255, 255),
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                          ),
                        ),
                        onPressed: () => {
                              salvar(),
                            }),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
