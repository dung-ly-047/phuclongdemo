import 'package:get/get.dart';
import 'package:phuc_long_demo/models/tea.dart';

class TeaService extends GetConnect {
  static const teaPath = '';

  Future<List<TeaModel>> getTeaList() async {
    final response = await get(teaPath);
    if (response.statusCode == 500) {}
    return [];
  }
}
