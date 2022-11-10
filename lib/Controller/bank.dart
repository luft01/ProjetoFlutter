import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_flutter/Model/shoes.dart';

final dados = FirebaseFirestore.instance.collection("usu");
final feed = FirebaseFirestore.instance.collection("Prod");
final feeds = FirebaseFirestore.instance.collection("Feed");
/* final prod = FirebaseFirestore.instance.collection("Produto");
final listSh = FirebaseFirestore.instance.collection("Produto"); */
String nomeb = '';
List<String> listret = [];
List<String> listTelaList = [];
List<String> listprice = [];
int count = 0;

class Bank extends ChangeNotifier {
  String nome = 'Juqueiras';

  Bank() {
    nome = nome;
  }

  void fr(cmm) {
    feeds.doc('feed07').set({
      "Nome": cmm,
    });
  }

  final List<Shoes> listap = [];

  bool status = false;
  Future openBankp() async {
    final snap = await feed.get();
    //for (var document in snapshot.docs) {
    snap.docs.forEach((doc) {
      /*  print('doc');
      print(doc.id); */
      String? nn = doc.id;
      pgnn(nn);
      pgpp(nn);
    });
  }

  List<String> pgn() {
    openBankp();
    return listret;
  }

  List<String> pgp() {
    openBankp();
    return listprice;
  }

  void pgnn(nn) {
    feed.doc(nn).get().then((snapshot) {
      listret.add(snapshot.data()!['Nome']);
    });
  }

  void pgpp(nn) {
    feed.doc(nn).get().then((snapshot) {
      listprice.add(snapshot.data()!['Preco']);
    });
  }

  List<String> listDoc = [];
  Future feedbank() async {
    final snaps = await feeds.get();
    snaps.docs.forEach((item) {
      String? ff = item.id;
      fg(ff);
    });
  }

  List<String> listcomment = [];
  void fg(item) {
    listcomment = [];
    feeds.doc(item).get().then((snapshot) {
      listcomment.add(snapshot.data()!["Nome"]);
    });
  }

  List<String> feedall() {
    feedbank().toString();
    /* print('erro aqui');
    print(listcomment); */
    return listcomment;
  }

  String? dados1 = '';
  String? dados2 = '';
  String? dados3 = '';

  Future dadoBanco() async {
    await dados.doc('01').get().then((snapshot) async {
      dados1 = snapshot.data()!['Email'];
      dados2 = snapshot.data()!['Nome'];
      dados3 = snapshot.data()!['Pass'];
    });
  }

  void cardProductlist(tipo) {
    feed.doc(tipo).get().then((snapshot) {
      listTelaList.add(snapshot.data()!['Nome']);
      listTelaList.add(snapshot.data()!['Preco']);
      listTelaList.add(snapshot.data()!['Url']);
      /* print(listTelaList); */
    });
  }

  void cardProductAll(tipo) {
    cardProductlist(tipo);
    /* print('tipo');
    print(tipo); */
  }

  List<String> cardProductAllGet() {
    return listTelaList;
  }
}
