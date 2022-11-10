import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:projeto_flutter/View/shoes_list.dart';
import 'package:projeto_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final images = [
    /* "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5816.png",
    "https://www.freepnglogos.com/uploads/shoes-png/running-shoes-png-transparent-running-shoes-images-40.png",
    "https://www.pngall.com/wp-content/uploads/13/Nike-Shoes-Air-Max-PNG-File.png",
    "https://freepngimg.com/thumb/shoes/27518-9-nike-shoes-file-thumb.png",
    "https://www.freeiconspng.com/thumbs/shoes-png/green-asics-running-shoes-png-image-4.png", */
    /*  "https://image.goat.com/transform/v1/attachments/product_template_pictures/images/071/445/308/original/719082_00.png.png?width=750", */
    "https://cdnv2.moovin.com.br/genko/imagens/produtos/lista/tenis-puma-flyer-beta-377082-01-2c3820d99c24866d1e24c5ba07f9e049.png",
  ];
  final imagesPromo = [
    'https://freepngimg.com/thumb/running%20shoes/10-running-shoes-png-image-thumb.png',
    'https://www.thenextsole.com/storage/images/742CMA0026147.png',
    'https://freepngimg.com/thumb/categories/1498.png',
  ];

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("ARISTORE"),
          centerTitle: true,
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
        body: Ink(
            color: Colors.white70,
            child: ListView(children: [
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                child: Container(
                  width: (double.infinity),
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 5,
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(1, 10))
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.green,
                          Colors.blue,
                          Colors.purple,
                          Colors.pink,
                        ],
                      )),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Aproveite a Black Friday',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.wavy,
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Ofertas de até 80%',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.wavy,
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
              ),
              Center(
                  child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 250.0,
                  autoPlay: true,
                  //viewportFraction: 1,
                  //enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 2),
                ),
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = images[index];
                  return buildImage(urlImage, index);
                },
              )),
              Center(
                  child: Text('Promoções',
                      style: TextStyle(color: Colors.black, fontSize: 26))),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Column(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withOpacity(0.2),
                          ),
                          width: 170,
                          height: 140,
                          /* alignment: Alignment.topLeft, */
                          child: Padding(
                              padding: EdgeInsets.only(left: 1),
                              child: Image.network(imagesPromo[0])),
                        ),
                        Text('MAMA', style: TextStyle(color: Colors.black)),
                        Text('De R\$ 799,00',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black)),
                        Text('Por R\$ 599,00',
                            style: TextStyle(color: Colors.black))
                      ]),
                      Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black.withOpacity(0.3),
                              ),
                              width: 170,
                              height: 140,
                              /* alignment: Alignment.topLeft, */
                              child: Padding(
                                  padding: EdgeInsets.only(left: 1),
                                  child: Image.network(imagesPromo[1])),
                            ),
                            Text('Lagartixa',
                                style: TextStyle(color: Colors.black)),
                            Text('De R\$ 600,00',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black)),
                            Text('De R\$ 400,00',
                                style: TextStyle(color: Colors.black)),
                          ]))
                    ]),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                  width: 170,
                                  height: 140,
                                  /* alignment: Alignment.topLeft, */
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 1),
                                      child: Image.network(imagesPromo[0])),
                                ),
                                Text('MAMA',
                                    style: TextStyle(color: Colors.black)),
                                Text('De R\$ 799,00',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black)),
                                Text('Por R\$ 599,00',
                                    style: TextStyle(color: Colors.black))
                              ]),
                              Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Column(children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ShoesList(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.black.withOpacity(0.3),
                                        ),
                                        width: 170,
                                        height: 140,
                                        /* alignment: Alignment.topLeft, */
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 1),
                                            child:
                                                Image.network(imagesPromo[1])),
                                      ),
                                    ),
                                    Text('Lagartixa',
                                        style: TextStyle(color: Colors.black)),
                                    Text('De R\$ 600,00',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.black)),
                                    Text('De R\$ 400,00',
                                        style: TextStyle(color: Colors.black)),
                                  ]))
                            ]))
                  ]))
            ]))));
  }

  Widget buildImage(String urlImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.transparent,
      child: Column(
        children: [
          Text('Shoes X', style: TextStyle(color: Colors.black, fontSize: 22)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Color.fromARGB(188, 13, 72, 161),
                    offset: Offset(1, 3))
              ],
              color: Color.fromARGB(41, 170, 167, 167),
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
