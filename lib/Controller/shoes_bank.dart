import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShoesBank extends ChangeNotifier {
  ShoesBank._();

  static final ShoesBank _instance = ShoesBank._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return ShoesBank._instance._firestore;
  }
}
