import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_flutter/repositories/shoes_db.dart';
import 'package:projeto_flutter/Model/shoes.dart';
import 'package:projeto_flutter/Controller/shoes_bank.dart';

class Favoritos extends ChangeNotifier {
  List<Shoes> _lista = [];
  late FirebaseFirestore db;

  Favoritos() {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readFavoritas();
  }

  _startFirestore() {
    db = ShoesBank.get();
  }

  _readFavoritas() async {
    final snapshot = await db.collection('favoritos').get();

    snapshot.docs.forEach((doc) {
      Shoes shoes =
          Shoesdb.tabela.firstWhere((shoes) => shoes.nome == doc.get('Nome'));
      _lista.add(shoes);
    });
  }

  /* UnmodifiableByteBufferView<Shoes> get lista =>
      UnmodifiableByteBufferView(_lista); */

  saveAll(List<Shoes> shoes) {
    shoes.forEach((shoes) async {
      if (!_lista.any((atual) => atual.nome == shoes.nome)) {
        _lista.add(shoes);
        await db.collection('favoritos').doc(shoes.nome).set({
          'Nome': shoes.nome,
          'ID': shoes.id,
          'Url': shoes.url,
        });
      }
    });
  }

  remove(Shoes shoes) async {
    await db.collection("favoritos").doc(shoes.nome).delete();
    _lista.remove(shoes);
  }
}
