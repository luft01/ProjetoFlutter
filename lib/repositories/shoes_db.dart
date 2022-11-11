import 'package:projeto_flutter/Model/shoes.dart';

class Shoesdb {
  static List<Shoes> tabela = [
    Shoes(
        id: '01',
        nome: 'Mizuno Shock',
        preco: '799.99',
        url:
            'https://freepngdownload.com/image/thumb/running-shoes-png-free-download-42.png'),
    Shoes(
        id: '02',
        nome: 'Nike Shock',
        preco: '299.99',
        url:
            'https://i.pinimg.com/originals/51/2b/4b/512b4b870390fac58da5206e88d228d6.png'),
    Shoes(
        id: '03',
        nome: 'Nike Air',
        preco: '299.00',
        url:
            'https://sneakerbardetroit.com/wp-content/uploads/2020/06/Nike-Air-Force-1-Low-White-University-Red-CK7663-102-Release-Date.png'),
  ];
  static Map<int, List<String>> mapList = {
    01: [
      'Mizuno Shock',
      '799.99',
      'https://www.webrun.com.br/wp-content/uploads/2022/09/TEMPLATE-mizuno.png'
    ],
    02: [
      'Nike Shock',
      '299.99',
      'https://i.pinimg.com/originals/51/2b/4b/512b4b870390fac58da5206e88d228d6.png'
    ],
    03: [
      'Nike Air',
      '299.00',
      'https://sneakerbardetroit.com/wp-content/uploads/2020/06/Nike-Air-Force-1-Low-White-University-Red-CK7663-102-Release-Date.png'
    ],
    04: [
      'Nike Air',
      '299.00',
      'https://sneakerbardetroit.com/wp-content/uploads/2020/06/Nike-Air-Force-1-Low-White-University-Red-CK7663-102-Release-Date.png'
    ],
    05: [
      'Nike Air',
      '299.00',
      'https://sneakerbardetroit.com/wp-content/uploads/2020/06/Nike-Air-Force-1-Low-White-University-Red-CK7663-102-Release-Date.png'
    ],
  };
}
