import 'package:get/get.dart';

import '../controllers/mahasiswa2_controller.dart';

class Mahasiswa2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Mahasiswa2Controller>(
      () => Mahasiswa2Controller(),
    );
  }
}
