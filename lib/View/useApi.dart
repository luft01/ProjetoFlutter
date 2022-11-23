import 'package:flutter/material.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarouselT extends StatefulWidget {
  const CarouselT({
    Key? key,
  }) : super(key: key);

  @override
  State<CarouselT> createState() => _CarouselTState();
}

class _CarouselTState extends State<CarouselT> {
  loadData() async {
    var url = Uri.parse('https://fakestoreapi.com/products/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao carregar');
    }
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
          future: loadData(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${snapshot.data![index]['nome']}'),
                      subtitle: Text('${snapshot.data![index]['estoque']}'),
                    );
                  });
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
