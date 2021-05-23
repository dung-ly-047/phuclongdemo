import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TeaService extends GetConnect {
  //FIREBASE VARIABLES

  CollectionReference get menu => FirebaseFirestore.instance.collection('menu');
  Stream<QuerySnapshot> get teaStream =>
      FirebaseFirestore.instance.collection('menu').snapshots();
}
