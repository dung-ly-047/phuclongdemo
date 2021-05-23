import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:phuc_long_demo/models/tea.dart';
import 'package:phuc_long_demo/services/teaService.dart';

class TeaController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  //  VARIABLES

  var teaList = <TeaModel>[].obs;

  CollectionReference menu = TeaService().menu;
  Stream<QuerySnapshot> teaStream = TeaService().teaStream;

  Map<String, dynamic> order = {
    "quantity": 1,
    "size": "S",
    "sugar": 100,
    "ice": 100,
    "toppings": {
      "black_pearl": 0,
      "white_pearl": 0,
      "fruit_jelly": 0,
    },
    "note": "",
    "totalPrice": 0.0,
  }.obs;

  var totalPriceCart = 0.0.obs;
  var totalQuantityCart = 0.obs;

  //METHODS

  void resetOrder() {
    order = {
      "quantity": 1,
      "size": "S",
      "sugar": 100,
      "ice": 100,
      "toppings": {
        "black_pearl": 0,
        "white_pearl": 0,
        "fruit_jelly": 0,
      },
      "note": "",
      "totalPrice": 0.0,
    }.obs;
  }
}
