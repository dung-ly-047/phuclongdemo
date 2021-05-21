import 'package:get/get.dart';
import 'package:phuc_long_demo/models/tea.dart';

class TeaController extends GetxController {
  var teaList = <TeaModel>[].obs;

  @override
  void onInit() {
    teaList.value = [
      TeaModel(name: "Trà sữa trân châu đường đen", price: 50000, quantity: 15),
      TeaModel(name: "Trà đào miếng", price: 35000, quantity: 22),
      TeaModel(name: "Trà sữa matcha", price: 45000, quantity: 12),
      TeaModel(name: "Trà sữa Caramel thạch cafe", price: 55000, quantity: 15),
    ];
    super.onInit();
  }
}
