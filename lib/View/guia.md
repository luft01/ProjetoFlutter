import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:projeto_flutter/View/shoes_list.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  loadData() async {
    var url = Uri.parse('https://api.escuelajs.co/api/v1/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao carregar');
    }
  }

  final images = [
    /* "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5816.png",
    "https://www.freepnglogos.com/uploads/shoes-png/running-shoes-png-transparent-running-shoes-images-40.png",
    "https://www.pngall.com/wp-content/uploads/13/Nike-Shoes-Air-Max-PNG-File.png",
    "https://freepngimg.com/thumb/shoes/27518-9-nike-shoes-file-thumb.png",
    "https://www.freeiconspng.com/thumbs/shoes-png/green-asics-running-shoes-png-image-4.png", */
    /*  "https://image.goat.com/transform/v1/attachments/product_template_pictures/images/071/445/308/original/719082_00.png.png?width=750", */
    "https://cdnv2.moovin.com.br/genko/imagens/produtos/lista/tenis-puma-flyer-beta-377082-01-2c3820d99c24866d1e24c5ba07f9e049.png",
    "https://www.pngplay.com/wp-content/uploads/6/Adidas-Shoes-Icon-Transparent-PNG.png",
    "https://sneakerbardetroit.com/wp-content/uploads/2020/06/Nike-Air-Force-1-Low-White-University-Red-CK7663-102-Release-Date.png",
  ];
  final imagesPromo = [
    'https://www.webrun.com.br/wp-content/uploads/2022/09/TEMPLATE-mizuno.png',
    'https://cdnv2.moovin.com.br/genko/imagens/produtos/lista/tenis-puma-flyer-beta-377082-01-2c3820d99c24866d1e24c5ba07f9e049.png',
    'https://sneakerbardetroit.com/wp-content/uploads/2020/06/Nike-Air-Force-1-Low-White-University-Red-CK7663-102-Release-Date.png',
    ''
  ];

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
                      title: Text('${snapshot.data![index]['title']}'),
                      subtitle: Text('${snapshot.data![index]['description']}'),
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

  Widget buildImage(String urlImage, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.transparent,
      child: Column(
        children: [
          const Text('Shoes X',
              style: TextStyle(color: Colors.black, fontSize: 22)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 10,
                    color: Color.fromARGB(188, 13, 72, 161),
                    offset: Offset(1, 3))
              ],
              color: const Color.fromARGB(41, 170, 167, 167),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 200,
            width: 250,
            child: Image.network(
              /* height: 170, */
              urlImage,
              fit: BoxFit.fill,
            ),
          )
        ],
      ));
}
